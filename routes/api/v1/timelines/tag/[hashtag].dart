import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/timeline_params.dart';
import 'package:sky_bridge/util.dart';

/// View public statuses containing the given hashtag.
/// GET /api/v1/timelines/tag/:hashtag HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/timelines/#tag
Future<Response> onRequest(RequestContext context, String hashtag) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final params = context.request.uri.queryParameters;
  final encodedParams = TimelineParams.fromJson(params);

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Strip leading # if the client included it.
  final tag = hashtag.startsWith('#') ? hashtag.substring(1) : hashtag;
  final limit = encodedParams.limit.clamp(1, 40);

  List<MastodonPost> posts;
  String? nextCursor;

  try {
    // Use Bluesky's post search to find posts tagged with this hashtag.
    final results = await bluesky.feed.searchPosts('#$tag', limit: limit);

    posts = await databaseTransaction(() async {
      final futures =
          results.data.posts.map(MastodonPost.fromBlueSkyPost).toList();
      return Future.wait(futures);
    });

    // searchPosts doesn't return a cursor, so we leave it null.
    nextCursor = null;
  } catch (e) {
    print('Hashtag timeline error for #$tag: $e');
    return threadedJsonResponse(body: <MastodonPost>[]);
  }

  // Resolve parent posts for replies.
  final processedPosts = await processParentPosts(bluesky, posts);

  var headers = <String, String>{};
  if (processedPosts.isNotEmpty && nextCursor != null) {
    headers = generatePaginationHeaders(
      items: processedPosts,
      requestUri: context.request.uri,
      nextCursor: nextCursor,
      getId: (post) => BigInt.parse(post.id),
    );
  }

  return threadedJsonResponse(body: processedPosts, headers: headers);
}
