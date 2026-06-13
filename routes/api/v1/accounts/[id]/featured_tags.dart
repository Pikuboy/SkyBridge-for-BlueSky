import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/src/generated/prisma/prisma.dart';
import 'package:sky_bridge/util.dart';

/// Returns the featured (pinned) hashtags for an account.
/// GET /api/v1/accounts/:id/featured_tags HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/featured_tags/
///
/// Bluesky has no concept of featured/pinned hashtags on a profile, so we
/// always return an empty list. Without this route, clients like Ivory
/// receive a 404 when loading a profile, which can cause the profile view
/// (including the bio/description) to flicker or fail to render.
Future<Response> onRequest(RequestContext context, String id) async {
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // If the id is not a number we return 404, matching the other
  // accounts/:id routes.
  final idNumber = BigInt.tryParse(id);
  if (idNumber == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Make sure the account actually exists.
  final userRecord = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: idNumber),
  );
  if (userRecord == null) return Response(statusCode: HttpStatus.notFound);

  // Bluesky doesn't support featured tags, so always return an empty list.
  return threadedJsonResponse(
    body: <dynamic>[],
  );
}
