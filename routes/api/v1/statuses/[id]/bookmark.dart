import 'dart:io';

import 'package:atproto/core.dart' as at;
import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Bookmark a status. Bluesky has no public bookmark API, so this is a no-op
/// that returns the status with bookmarked: true to satisfy clients.
/// POST /api/v1/statuses/:id/bookmark HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#bookmark
Future<Response> onRequest<T>(RequestContext context, String id) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final idNumber = BigInt.parse(id);
  final postRecord = await db.postRecord.findUnique(
    where: PostRecordWhereUniqueInput(id: idNumber),
  );
  if (postRecord == null) return Response(statusCode: HttpStatus.notFound);

  final uri = at.AtUri.parse(postRecord.uri);
  final response = await bluesky.feed.getPosts(uris: [uri]);
  final post = response.data.posts.first;

  final mastodonPost = await databaseTransaction(
    () => MastodonPost.fromBlueSkyPost(post),
  );

  // Return the post with bookmarked: true. We can't actually persist this
  // server-side since Bluesky doesn't expose a bookmark API.
  return threadedJsonResponse(
    body: mastodonPost.copyWith(bookmarked: true),
  );
}
