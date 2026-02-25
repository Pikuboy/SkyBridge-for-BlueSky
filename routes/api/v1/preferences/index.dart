import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/util.dart';

/// View user preferences.
/// GET /api/v1/preferences HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/preferences/
///
/// Returns sensible defaults. These can't be stored server-side since
/// Bluesky doesn't have a concept of Mastodon-style user preferences.
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  return threadedJsonResponse(
    body: {
      'posting:default:visibility': 'public',
      'posting:default:sensitive': false,
      'posting:default:language': null,
      'reading:expand:media': 'default',
      'reading:expand:spoilers': false,
    },
  );
}
