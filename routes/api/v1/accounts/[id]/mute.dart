import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_relationship.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Mute the given account.
/// POST /api/v1/accounts/:id/mute HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#mute
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

  // Mute the actor via the Bluesky graph service.
  try {
    await bluesky.graph.muteActor(actor: record.did);
  } catch (e) {
    print('Mute error (non-fatal): $e');
  }

  final rel = await MastodonRelationship.getActorRelationship(bluesky, record);
  return threadedJsonResponse(body: rel);
}
