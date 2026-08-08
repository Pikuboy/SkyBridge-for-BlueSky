import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/feed_filters.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/timeline_params.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context) async {
  final params = context.request.uri.queryParameters;
  final encodedParams = TimelineParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Load filters/preferences up front — needed by both branches below.
  final filters = loadFeedFilters();
  final preferences = preferencesFromContext(context);

  // A post should be kept in the response if it passes both filters.json
  // and the user's reply preference. This is evaluated on posts that have
  // already had their parent post resolved (inReplyToId is populated), so
  // it matches the semantics filters.json expects.
  bool keepPost(MastodonPost post) {
    if (!preferences.showRepliesInHome && post.inReplyToId != null) {
      return false;
    }
    if (filters.shouldHide(post)) return false;
    return true;
  }

  final List<MastodonPost> processedPosts;
  String? nextCursor;
  List<BigInt> scannedIds;

  // Check if we should allow posts to be backfilled.
  final backfillAllowed = env
      .getOrElse(
        'SKYBRIDGE_ALLOW_BACKFILL',
        () => 'false',
      )
      .toLowerCase();

  if (encodedParams.isNewPostsRequest && backfillAllowed == 'true') {
    // Get all the posts following minId so that Ivory can backfill its
    // timeline. This branch already over-fetches until it reaches the
    // last-read post, so filtering can safely happen afterwards.
    final allPosts = <MastodonPost>[];

    final lastRead = BigInt.parse(encodedParams.minId!);
    BigInt? maxID;
    String? prevCursor;
    var done = false;

    while (!done) {
      final feed = await bluesky.feed.getTimeline(
        limit: 100,
        cursor: prevCursor,
      );

      final posts = await databaseTransaction(() async {
        final futures = feed.data.feed.map<Future<MastodonPost>>(MastodonPost.fromFeedView).toList();
        return Future.wait(futures);
      });

      for (final post in posts) {
        final id = BigInt.parse(post.id);
        if (id <= lastRead) {
          // We've seen the last-read post (or something older than that).
          // That means we're fully caught up with the supplied min_id
          done = true;
          break;
        }

        if (maxID == null || id < maxID) {
          maxID = id - BigInt.one;
        }

        allPosts.add(post);
      }

      print(
        'Loaded ${posts.length} posts (total ${allPosts.length}, new maxID=$maxID)',
      );
      prevCursor = feed.data.cursor;

      if (posts.length < 25 || allPosts.length > 400) {
        // Bail early and don't try to fetch more posts if the batch was tiny
        done = true;
      }
    }

    nextCursor = prevCursor;

    processedPosts = await processParentPosts(bluesky, allPosts);
    scannedIds = processedPosts.map((post) => BigInt.parse(post.id)).toList();
    processedPosts.removeWhere((post) => !keepPost(post));
  } else {
    // Standard pagination request. Over-fetch from Bluesky and filter each
    // batch as we go, so that a page filtered heavily (e.g. lots of hidden
    // replies) doesn't come back to Ivory almost empty.
    final paginationCursor = encodedParams.cursor ?? encodedParams.maxId;
    final targetLimit = encodedParams.limit.clamp(1, 40);

    final result = await fetchFilteredFeed(
      bluesky: bluesky,
      fetchPage: (cursor) async {
        final feed = await bluesky.feed.getTimeline(
          limit: 100,
          cursor: cursor,
        );

        final posts = await databaseTransaction(() async {
          final futures = feed.data.feed.map<Future<MastodonPost>>(MastodonPost.fromFeedView).toList();
          return Future.wait(futures);
        });

        return (posts: posts, cursor: feed.data.cursor);
      },
      keep: keepPost,
      targetLimit: targetLimit,
      initialCursor: paginationCursor,
    );

    processedPosts = result.posts;
    nextCursor = result.cursor;
    scannedIds = result.scannedIds;
  }

  var headers = <String, String>{};
  if (scannedIds.isNotEmpty) {
    headers = generatePaginationHeadersForIds(
      ids: scannedIds,
      requestUri: context.request.uri,
      nextCursor: nextCursor ?? '',
    );
  }

  return threadedJsonResponse(body: processedPosts, headers: headers);
}
