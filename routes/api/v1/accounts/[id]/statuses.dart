import 'dart:async';
import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/statuses_params.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Get statuses posted to the given account.
/// GET /api/v1/accounts/:id/statuses HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#statuses
Future<Response> onRequest(RequestContext context, String id) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final params = context.request.uri.queryParameters;
  final options = StatusesParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final session = await sessionFromContext(context);
  if (session == null) return authError();
  final bluesky = bsky.Bluesky.fromSession(session);

  // Bluesky does not have pinned posts in the same way Mastodon does.
  if (options.pinned) {
    return Response.json(body: []);
  }

  final user = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: BigInt.parse(id)),
  );
  if (user == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Determine the number of items to fetch (capped at 40).
  final limit = (options.limit > 0 ? options.limit : 20).clamp(1, 40);

  // Get the user's posts from Bluesky.
  final feed = await bluesky.feed.getAuthorFeed(
    actor: user.did,
    limit: limit,
    cursor: options.cursor,
  );

  final nextCursor = feed.data.cursor;

  // Convert all the posts to MastodonPost futures and await them.
  var posts = await databaseTransaction(() {
    final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList().cast<Future<MastodonPost>>();
    return Future.wait(futures);
  }) as List<MastodonPost>;

  // Filter out reposts if requested.
  if (options.excludeReblogs) {
    posts.removeWhere((post) => post.reblog != null);
  }

  // Filter out replies if requested.
  if (options.excludeReplies) {
    posts.removeWhere((post) {
      // A reply has a replyPostUri set before parent processing,
      // or an inReplyToId set after processing.
      return post.replyPostUri != null || post.inReplyToId != null;
    });
  }

  // Filter to only media posts if requested.
  if (options.onlyMedia) {
    posts = posts
        .where((post) => post.mediaAttachments.isNotEmpty)
        .toList();
  }

  // Resolve parent posts for replies (fills in inReplyToId / inReplyToAccountId).
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
