import 'dart:io';

import 'package:atproto/core.dart' as at;
import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/mastodon/mastodon_tag.dart';
import 'package:sky_bridge/models/params/search_params.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Perform a search.
/// GET /api/v2/search HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/search/#v2
Future<Response> onRequest<T>(RequestContext context) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final body = context.request.uri.queryParameters;
  final params = SearchParams.fromJson(body);

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Empty query → return empty results immediately.
  if (params.query.trim().isEmpty) {
    return threadedJsonResponse(
      body: {'hashtags': [], 'accounts': [], 'statuses': []},
    );
  }

  // Special-case: Ivory quote-post lookup via SkyBridge URL.
  if (params.limit == 1 &&
      params.resolve == true &&
      params.type == SearchType.statuses) {
    final quoteMatch = RegExp(r'^(.+)\/@([^/]+)\/(\d+)$')
        .firstMatch(params.query)
        ?.groups([1, 2, 3]);
    final postId = quoteMatch?[2];

    final repostMatch = RegExp(
      r'https://.*?/profile/(.*?)/post/([a-zA-Z0-9]+)',
    ).firstMatch(params.query)?.groups([1, 2]);
    final repostHandle = repostMatch?[0];
    final repostPostId = repostMatch?[1];

    if (postId != null) {
      final postRecord = await db.postRecord.findUnique(
        where: PostRecordWhereUniqueInput(id: BigInt.parse(postId)),
      );
      if (postRecord == null) {
        return threadedJsonResponse(
          body: {'hashtags': [], 'accounts': [], 'statuses': []},
        );
      }

      final uri = at.AtUri.parse(postRecord.uri);
      final response = await bluesky.feed.getPosts(uris: [uri]);
      final post = response.data.posts.first;

      final mastodonPost = await databaseTransaction(
        () => MastodonPost.fromBlueSkyPost(post),
      );
      final processedPost = await processParentPosts(bluesky, [mastodonPost]);

      return threadedJsonResponse(
        body: {
          'hashtags': [],
          'accounts': [],
          'statuses': [processedPost.first],
        },
      );
    }

    if (repostHandle != null && repostPostId != null) {
      try {
        final did =
            await bluesky.atproto.identity.resolveHandle(handle: repostHandle);
        final uri = at.AtUri.parse(
          'at://${did.data.did}/app.bsky.feed.post/$repostPostId',
        );

        final response = await bluesky.feed.getPosts(uris: [uri]);
        final post = response.data.posts.first;

        final mastodonPost = await databaseTransaction(
          () => MastodonPost.fromBlueSkyPost(post),
        );
        final processedPost =
            await processParentPosts(bluesky, [mastodonPost]);

        return threadedJsonResponse(
          body: {
            'hashtags': [],
            'accounts': [],
            'statuses': [processedPost.first],
          },
        );
      } catch (_) {
        return threadedJsonResponse(
          body: {'hashtags': [], 'accounts': [], 'statuses': []},
        );
      }
    }
  }

  // General full-text search.
  final query = params.query.trim();
  final limit = (params.limit > 0 ? params.limit : 20).clamp(1, 40);
  final searchType = params.type;

  var accountResults = <MastodonAccount>[];
  var statusResults = <MastodonPost>[];
  var hashtagResults = <MastodonTag>[];

  // Search accounts.
  if (searchType == null || searchType == SearchType.accounts) {
    try {
      final results = await bluesky.actor.searchActors(
        term: query,
        limit: limit,
      );

      final handles =
          results.data.actors.map((actor) => actor.handle.toString()).toList();

      if (handles.isNotEmpty) {
        // Let Dart infer the profile type from the callback return type.
        final profiles = await chunkResults(
          items: handles,
          callback: (List<String> chunk) async {
            final r = await bluesky.actor.getProfiles(actors: chunk);
            return r.data.profiles;
          },
        );

        accountResults = await databaseTransaction(() {
          return Future.wait(
            profiles.map<Future<MastodonAccount>>(
              MastodonAccount.fromActorProfile,
            ),
          );
        });
      }
    } catch (e) {
      print('Account search error: $e');
    }
  }

  // Search statuses (posts).
  if (searchType == null || searchType == SearchType.statuses) {
    try {
      // Fix: query is now a named parameter q: in bluesky 1.x
      final results = await bluesky.feed.searchPosts(q: query, limit: limit);

      statusResults = await databaseTransaction(() async {
        final futures = results.data.posts
            .map<Future<MastodonPost>>(MastodonPost.fromBlueSkyPost);
        return Future.wait(futures);
      });

      statusResults = await processParentPosts(bluesky, statusResults);
    } catch (e) {
      print('Status search error: $e');
    }
  }

  // Extract hashtags from the query (Bluesky has no dedicated hashtag search).
  if (searchType == null || searchType == SearchType.hashtags) {
    final base = env.getOrElse(
      'SKYBRIDGE_BASEURL',
      () => throw Exception('SKYBRIDGE_BASEURL not set!'),
    );

    final tagPattern = RegExp(r'#(\w+)');
    final tagMatches = tagPattern.allMatches(query);
    for (final m in tagMatches) {
      final name = m.group(1)!;
      hashtagResults.add(
        MastodonTag(name: name, url: 'https://$base/tags/$name'),
      );
    }

    if (hashtagResults.isEmpty &&
        !query.contains(' ') &&
        !query.startsWith('@')) {
      hashtagResults.add(
        MastodonTag(name: query, url: 'https://$base/tags/$query'),
      );
    }
  }

  return threadedJsonResponse(
    body: {
      'hashtags': hashtagResults,
      'accounts': accountResults,
      'statuses': statusResults,
    },
  );
}
