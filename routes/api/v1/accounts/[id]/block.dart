import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_relationship.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Block the given account.
/// POST /api/v1/accounts/:id/block HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#block
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
  final record = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: idNumber),
  );
  if (record == null) return Response(statusCode: HttpStatus.notFound);

  // Check if not already blocking before creating the record.
  try {
    final profile = await bluesky.actor.getProfile(actor: record.did);
    if (profile.data.viewer.blocking == null) {
      await bluesky.graph.block(did: record.did);
    }
  } catch (e) {
    print('Block error (non-fatal): $e');
  }

  final rel = await MastodonRelationship.getActorRelationship(bluesky, record);
  return threadedJsonResponse(body: rel);
}
