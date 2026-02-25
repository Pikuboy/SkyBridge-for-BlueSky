import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// List statuses the authenticated user has liked/favourited.
/// GET /api/v1/favourites HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/favourites/
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final params = context.request.uri.queryParameters;
  final limitRaw = int.tryParse(params['limit'] ?? '20') ?? 20;
  final limit = limitRaw.clamp(1, 40);
  final cursor = params['max_id'];

  try {
    final response = await bluesky.feed.getActorLikes(
      actor: bluesky.session.did,
      limit: limit,
      cursor: cursor,
    );

    final nextCursor = response.data.cursor;

    // Convert individually so one bad post doesn't kill the whole list.
    final posts = <MastodonPost>[];
    for (final feedView in response.data.feed) {
      try {
        final post = await databaseTransaction(
          () => MastodonPost.fromFeedView(feedView),
        );
        posts.add(post);
      } catch (e) {
        print('Favourites: skipping post ${feedView.post.uri} — $e');
      }
    }

    var headers = <String, String>{};
    if (posts.isNotEmpty && nextCursor != null) {
      headers = generatePaginationHeaders(
        items: posts,
        requestUri: context.request.uri,
        nextCursor: nextCursor,
        getId: (post) => BigInt.parse(post.id),
      );
    }

    return threadedJsonResponse(body: posts, headers: headers);
  } catch (e) {
    print('Favourites endpoint error: $e');
    return threadedJsonResponse(body: <MastodonPost>[]);
  }
}
