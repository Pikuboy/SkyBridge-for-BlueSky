import 'dart:async';
import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/statuses_params.dart';
import 'package:sky_bridge/src/generated/prisma/prisma.dart';
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

  // Determine the number of items to actually return to the client
  // (capped at 40).
  final targetLimit = (options.limit > 0 ? options.limit : 20).clamp(1, 40);

  // A post should be kept in the response if it passes every requested
  // filter. This is evaluated on posts that have already had their parent
  // post resolved (inReplyToId is populated).
  bool keepPost(MastodonPost post) {
    if (options.excludeReblogs && post.reblog != null) return false;
    if (options.excludeReplies && post.inReplyToId != null) return false;
    if (options.onlyMedia && post.mediaAttachments.isEmpty) return false;
    return true;
  }

  // Over-fetch from Bluesky and filter each batch as we go, so that
  // excludeReplies / excludeReblogs / onlyMedia don't turn a full page
  // request into a near-empty response.
  final result = await fetchFilteredFeed(
    bluesky: bluesky,
    fetchPage: (cursor) async {
      final feed = await bluesky.feed.getAuthorFeed(
        actor: user.did!,
        limit: 100,
        cursor: cursor,
      );

      final posts = await databaseTransaction(() {
        final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList().cast<Future<MastodonPost>>();
        return Future.wait(futures);
      }) as List<MastodonPost>;

      return (posts: posts, cursor: feed.data.cursor);
    },
    keep: keepPost,
    targetLimit: targetLimit,
    initialCursor: options.cursor,
  );

  final processedPosts = result.posts;

  var headers = <String, String>{};
  if (result.scannedIds.isNotEmpty) {
    headers = generatePaginationHeadersForIds(
      ids: result.scannedIds,
      requestUri: context.request.uri,
      nextCursor: result.cursor ?? '',
    );
  }

  return threadedJsonResponse(body: processedPosts, headers: headers);
}
