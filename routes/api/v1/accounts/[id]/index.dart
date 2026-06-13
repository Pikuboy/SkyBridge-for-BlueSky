import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/src/generated/prisma/prisma.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  // If the id is not a number we return 404
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final idNumber = BigInt.parse(id);
  final user = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: idNumber),
  );
  if (user == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  final profile = await bluesky.actor.getProfile(actor: user.did!);
  final account = await databaseTransaction(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  // DEBUG: log the raw description and the processed note so we can
  // confirm whether the bio is actually populated in the response.
  print(
    '[DEBUG accounts/$id] '
    'raw_description="${profile.data.description}" '
    'note="${account.note}" '
    'note_length=${account.note.length}',
  );

  return threadedJsonResponse(
    body: account,
  );
}
