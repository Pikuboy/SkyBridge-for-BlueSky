import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/util.dart';

/// View pending follow requests.
/// GET /api/v1/follow_requests HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/follow_requests/
///
/// Bluesky does not have follow requests in the same way (accounts are
/// either open or locked). Return an empty list.
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  return threadedJsonResponse(body: []);
}
