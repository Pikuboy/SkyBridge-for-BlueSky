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

  final session = await sessionFromContext(context);
  if (session == null) return authError();

  final params = context.request.uri.queryParameters;
  final limitRaw = int.tryParse(params['limit'] ?? '50') ?? 50;
  final limit = limitRaw.clamp(1, 100);
  
  // Support both max_id and cursor for pagination
  // max_id is used by Mastodon clients for fetching older items (standard Mastodon API)
  // We need to use it as cursor for Bluesky API
  String? cursor;
  if (params['max_id'] != null && params['max_id']!.isNotEmpty) {
    cursor = params['max_id'];
  } else if (params['cursor'] != null && params['cursor']!.isNotEmpty) {
    cursor = params['cursor'];
  }

  try {
    print('Favourites: Fetching likes for ${session.did} (bluesky session: ${bluesky.session.did}) with cursor=$cursor, limit=$limit');
    
    // Note: Bluesky API only allows fetching your own likes
    // We must use bluesky.session.did which is guaranteed to be the authenticated user
    final response = await bluesky.feed.getActorLikes(
      actor: bluesky.session.did,
      limit: limit,
      cursor: cursor,
    );

    print('Favourites: Received ${response.data.feed.length} items, nextCursor=${response.data.cursor}');
    final nextCursor = response.data.cursor;

    // Convert individually so one bad post doesn't kill the whole list.
    final posts = <MastodonPost>[];
    for (final feedView in response.data.feed) {
      try {
        final post = await databaseTransaction(
          () => MastodonPost.fromFeedView(feedView),
        );
        // Since this is the favourites endpoint, these posts are BY DEFINITION favourited
        // Force favourited to true regardless of what the viewer data says
        post.favourited = true;
        posts.add(post);
      } catch (e) {
        print('Favourites: skipping post ${feedView.post.uri} — $e');
      }
    }

    print('Favourites: Successfully converted ${posts.length} posts');

    // Sort posts newest-first to match Mastodon API expectations
    posts.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    var headers = <String, String>{};
    if (posts.isNotEmpty) {
      headers = generatePaginationHeaders(
        items: posts,
        requestUri: context.request.uri,
        nextCursor: nextCursor ?? '',
        getId: (post) => BigInt.parse(post.id),
      );
    }

    print('Favourites: Returning ${posts.length} posts with headers: $headers');
    return threadedJsonResponse(body: posts, headers: headers);
  } catch (e, stackTrace) {
    print('Favourites endpoint error: $e');
    print('Stack trace: $stackTrace');
    // Return 500 error instead of empty array to signal the problem to the client
    return Response(
      statusCode: HttpStatus.internalServerError,
      body: '{"error": "Failed to fetch favourites: $e"}',
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
    );
  }
}
