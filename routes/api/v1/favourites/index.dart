import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// List statuses the authenticated user has liked/favourited.
/// GET /api/v1/favourites HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/favourites/
///
/// Maps to Bluesky's getActorLikes feed endpoint.
Future<Response> onRequest(RequestContext context) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final params = context.request.uri.queryParameters;

  // Parse limit (Mastodon default: 20, max: 40).
  final limitRaw = int.tryParse(params['limit'] ?? '20') ?? 20;
  final limit = limitRaw.clamp(1, 40);

  // Bluesky cursor for pagination (passed as max_id / since_id are not
  // directly applicable; we use a bluesky cursor stored as max_id).
  final cursor = params['max_id'];

  try {
    // Fetch the list of posts the authenticated user has liked.
    final response = await bluesky.feed.getActorLikes(
      actor: bluesky.session.did,
      limit: limit,
      cursor: cursor,
    );

    final nextCursor = response.data.cursor;

    // Convert all the feed views to MastodonPost objects.
    final posts = await databaseTransaction(() {
      final futures =
          response.data.feed.map(MastodonPost.fromFeedView).toList();
      return Future.wait(futures);
    });

    // Build Link pagination headers so clients can page through results.
    var headers = <String, String>{};
    if (posts.isNotEmpty) {
      headers = generatePaginationHeaders(
        items: posts,
        requestUri: context.request.uri,
        nextCursor: nextCursor ?? '',
        getId: (post) => BigInt.parse(post.id),
      );
    }

    return threadedJsonResponse(body: posts, headers: headers);
  } catch (e) {
    // If the account has no likes or the API call fails, return an empty list.
    print('Favourites endpoint error: $e');
    return threadedJsonResponse(body: <dynamic>[]);
  }
}
