import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/util.dart';

/// View bookmarked statuses.
/// GET /api/v1/bookmarks HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/bookmarks/
///
/// Bluesky does not expose a public bookmark API. We return an empty list
/// so that clients that require this endpoint don't error out.
Future<Response> onRequest(RequestContext context) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Bookmarks are not exposed via the Bluesky API.
  // Return an empty list rather than an error so clients degrade gracefully.
  return threadedJsonResponse(body: []);
}
