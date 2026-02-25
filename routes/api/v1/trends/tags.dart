import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/models/mastodon/mastodon_tag.dart';
import 'package:sky_bridge/util.dart';

/// View trending hashtags.
/// GET /api/v1/trends/tags HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/trends/#tags
///
/// Bluesky does not have a trending hashtags API. We return an empty list.
Future<Response> onRequest(RequestContext context) async {
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Bluesky has no trending tags endpoint.
  // Return an empty list so clients don't show an error.
  return threadedJsonResponse(body: <MastodonTag>[]);
}
