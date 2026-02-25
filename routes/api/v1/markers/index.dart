import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/util.dart';

/// Get or save timeline position markers.
/// GET/POST /api/v1/markers HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/markers/
///
/// Bluesky has no equivalent concept. We return empty objects to avoid errors.
Future<Response> onRequest(RequestContext context) async {
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  if (context.request.method == HttpMethod.get) {
    // Return empty markers. Clients use these to sync reading position.
    return threadedJsonResponse(body: {});
  } else if (context.request.method == HttpMethod.post) {
    // Acknowledge the save request without actually storing anything.
    return threadedJsonResponse(body: {});
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
