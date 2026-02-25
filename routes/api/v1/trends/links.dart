import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/util.dart';

/// View trending links.
/// GET /api/v1/trends/links HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/trends/#links
///
/// Bluesky does not have a trending links API.
Future<Response> onRequest(RequestContext context) async {
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  return threadedJsonResponse(body: []);
}
