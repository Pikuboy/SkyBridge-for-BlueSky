import 'dart:io';

import 'package:atproto/core.dart' as at;
import 'package:bluesky/app_bsky_richtext_facet.dart' show RichtextFacet;
import 'package:bluesky/bluesky.dart' as bsky;
import 'package:collection/collection.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/forms/new_post_form.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Publish a new post with the given parameters.
/// POST /api/v1/statuses HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#create
Future<Response> onRequest<T>(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final request = context.request;
  final type = context.request.headers[HttpHeaders.contentTypeHeader] ?? '';
  Map<String, dynamic> body;
  if (type.contains('application/json')) {
    body = await request.json() as Map<String, dynamic>;
  } else {
    body = (await request.formData()).fields.cast<String, dynamic>();
  }

  final form = NewPostForm.fromJson(body);
  var facets = <Map<String, dynamic>>[];

  // Handle reply threading.
  bsky.ReplyRef? postReplyRef;
  final replyId = form.inReplyToId;
  if (replyId != null) {
    final record = await db.postRecord.findUnique(
      where: PostRecordWhereUniqueInput(id: BigInt.from(replyId)),
    );
    if (record == null) return Response(statusCode: HttpStatus.notFound);

    final uri = at.AtUri.parse(record.uri);
    bsky.Post? parentPost;

    for (var i = 0; i < 3; i++) {
      try {
        final response = await bluesky.feed.getPosts(uris: [uri]);
        parentPost = response.data.posts.firstOrNull;
        if (parentPost != null) break;
      } catch (_) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }

    if (parentPost == null) return Response(statusCode: HttpStatus.notFound);

    final parentRef = at.StrongRef(cid: parentPost.cid, uri: parentPost.uri);
    final reply = parentPost.record.reply;
    postReplyRef = bsky.ReplyRef(
      root: reply != null ? reply.root : parentRef,
      parent: parentRef,
    );
  }

  // Build facets for mentions and links.
  final status = form.status;
  if (status != null) {
    facets = await status.entities.toFacets();
  }

  // Build image embed (video not supported in this version).
  final mediaIds = form.mediaIds;
  final images = <bsky.Image>[];
  if (mediaIds != null) {
    for (final idString in mediaIds) {
      final id = BigInt.parse(idString);
      final record = await db.mediaRecord.findUnique(
        where: MediaRecordWhereUniqueInput(id: id),
      );
      if (record == null) continue;
      // Skip video blobs — video embedding not supported in bluesky 0.15.x.
      if (record.mimeType.toLowerCase().startsWith('video/')) continue;
      images.add(bsky.Image(alt: record.description, image: record.toBlob()));
    }
  }

  final embed = images.isEmpty
      ? null
      : bsky.Embed.images(data: bsky.EmbedImages(images: images));

  // Post to Bluesky.
  final newPost = await bluesky.feed.post.create(
    text: form.status?.value ?? '',
    facets: facets.map(RichtextFacet.fromJson).toList(),
    reply: postReplyRef,
    embed: embed,
    langs: form.language != null ? [form.language!] : null,
  );

  // Fetch the newly created post, retrying up to 3 times.
  bsky.Post? postData;
  for (var i = 0; i < 3; i++) {
    try {
      final response = await bluesky.feed.getPosts(uris: [newPost.data.uri]);
      postData = response.data.posts.firstOrNull;
      if (postData != null) break;
    } catch (_) {
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  if (postData == null) {
    return Response(statusCode: HttpStatus.internalServerError);
  }

  final mastodonPost = await databaseTransaction(
    () => MastodonPost.fromBlueSkyPost(postData!),
  );

  return threadedJsonResponse(body: mastodonPost);
}
