import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/util.dart';

/// Dismiss a single notification.
/// POST /api/v1/notifications/:id/dismiss HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/notifications/#dismiss
///
/// Bluesky doesn't support dismissing individual notifications, but we
/// acknowledge the request so clients don't error out.
Future<Response> onRequest<T>(RequestContext context, String id) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Acknowledge the dismiss without actually persisting it.
  return threadedJsonResponse(body: <String, dynamic>{});
}
