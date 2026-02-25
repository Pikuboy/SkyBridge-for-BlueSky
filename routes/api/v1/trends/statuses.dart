import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';
import 'package:atproto/core.dart' as at;
import 'package:bluesky/bluesky.dart' as bsky;

/// Posts that have been interacted with more than others.
/// GET /api/v1/trends/statuses HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/trends/#statuses
Future<Response> onRequest(RequestContext context) async {
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  List<MastodonPost> posts;

  try {
    // Use the Bluesky "What's Hot" feed generator as a trending posts source.
    // The old unspecced.getPopular endpoint is deprecated.
    const whatsHotUri =
        'at://did:plc:z72i7hdynmk6r22z27h6tvur/app.bsky.feed.generator/whats-hot';

    final feed = await bluesky.feed.getFeed(
      generatorUri: at.AtUri.parse(whatsHotUri),
      limit: 40,
    );

    posts = await databaseTransaction(() async {
      final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
      return Future.wait(futures);
    });
  } catch (e) {
    // Feed generator not available, return empty list.
    print('Trending feed error: $e');
    return threadedJsonResponse(body: <MastodonPost>[]);
  }

  return threadedJsonResponse(body: posts);
}
