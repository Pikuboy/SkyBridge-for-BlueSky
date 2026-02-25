import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/timeline_params.dart';
import 'package:sky_bridge/util.dart';
import 'package:atproto/core.dart' as at;
import 'package:bluesky/bluesky.dart' as bsky;

/// View public posts.
/// GET /api/v1/timelines/public HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/timelines/#public
///
/// Maps to the Bluesky "What's Hot" popular feed.
Future<Response> onRequest(RequestContext context) async {
  final params = context.request.uri.queryParameters;
  final encodedParams = TimelineParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  List<MastodonPost> posts;
  String? nextCursor;

  try {
    // Use the Bluesky "What's Hot" popular feed generator.
    // This is a public, curated algorithmic feed that maps naturally to
    // Mastodon's federated/public timeline concept.
    const whatsHotUri =
        'at://did:plc:z72i7hdynmk6r22z27h6tvur/app.bsky.feed.generator/whats-hot';

    // Support both max_id and cursor for pagination
    final paginationCursor = encodedParams.cursor ?? encodedParams.maxId;

    final feed = await bluesky.feed.getFeed(
      generatorUri: at.AtUri.parse(whatsHotUri),
      limit: encodedParams.limit.clamp(1, 40),
      cursor: paginationCursor,
    );

    nextCursor = feed.data.cursor;

    posts = await databaseTransaction(() async {
      final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
      return Future.wait(futures);
    });
  } catch (e) {
    // Fallback: if the popular feed is unavailable, try the home timeline.
    print('Public timeline fallback to home: $e');
    try {
      // Support both max_id and cursor for pagination
      final paginationCursor = encodedParams.cursor ?? encodedParams.maxId;
      
      final feed = await bluesky.feed.getTimeline(
        limit: encodedParams.limit.clamp(1, 40),
        cursor: paginationCursor,
      );
      nextCursor = feed.data.cursor;
      posts = await databaseTransaction(() async {
        final futures =
            feed.data.feed.map(MastodonPost.fromFeedView).toList();
        return Future.wait(futures);
      });
    } catch (_) {
      return threadedJsonResponse(body: <MastodonPost>[]);
    }
  }

  // Resolve parent posts for replies.
  final processedPosts = await processParentPosts(bluesky, posts);

  var headers = <String, String>{};
  if (processedPosts.isNotEmpty) {
    headers = generatePaginationHeaders(
      items: processedPosts,
      requestUri: context.request.uri,
      nextCursor: nextCursor ?? '',
      getId: (post) => BigInt.parse(post.id),
    );
  }

  return threadedJsonResponse(body: processedPosts, headers: headers);
}
