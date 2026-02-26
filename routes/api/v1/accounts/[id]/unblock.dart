import 'dart:io';

import 'package:atproto/core.dart' as at;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_relationship.dart';
import 'package:sky_bridge/src/generated/prisma/prisma.dart';
import 'package:sky_bridge/util.dart';

/// Unblock the given account.
/// POST /api/v1/accounts/:id/unblock HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#unblock
Future<Response> onRequest(RequestContext context, String id) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final idNumber = BigInt.parse(id);
  final record = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: idNumber),
  );
  if (record == null) return Response(statusCode: HttpStatus.notFound);

  // Find the block record URI via the viewer and delete it.
  try {
    final profile = await bluesky.actor.getProfile(actor: record.did!);
    final blockUri = profile.data.viewer?.blocking;
    if (blockUri != null) {
      final parsedBlockUri = at.AtUri.parse(blockUri.toString());
      await bluesky.atproto.repo.deleteRecord(
        repo: parsedBlockUri.hostname,
        collection: parsedBlockUri.collection.toString(),
        rkey: parsedBlockUri.rkey,
      );
    }
  } catch (e) {
    print('Unblock error (non-fatal): $e');
  }

  final rel = await MastodonRelationship.getActorRelationship(bluesky, record);
  return threadedJsonResponse(body: rel);
}
