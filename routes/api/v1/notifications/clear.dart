import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/util.dart';

/// Dismiss all notifications.
/// POST /api/v1/notifications/clear HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/notifications/#clear
///
/// Bluesky doesn't have a "clear all notifications" concept.
/// We acknowledge the request so clients don't show an error.
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // No-op: Bluesky doesn't support dismissing all notifications via API.
  return threadedJsonResponse(body: <String, dynamic>{});
}
