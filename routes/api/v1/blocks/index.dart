import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/util.dart';

/// View accounts that the user has blocked.
/// GET /api/v1/blocks HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/blocks/
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  try {
    final response = await bluesky.graph.getBlocks(limit: 50);
    final handles =
        response.data.blocks.map((actor) => actor.handle).toList();

    if (handles.isEmpty) return threadedJsonResponse(body: <MastodonAccount>[]);

    final profiles = await chunkResults<bsky.ActorProfile, String>(
      items: handles,
      callback: (chunk) async {
        final r = await bluesky.actor.getProfiles(actors: chunk);
        return r.data.profiles;
      },
    );

    final accounts = await databaseTransaction(
      () => Future.wait(profiles.map(MastodonAccount.fromActorProfile)),
    );
    return threadedJsonResponse(body: accounts);
  } catch (e) {
    print('Blocks list error: $e');
    return threadedJsonResponse(body: <MastodonAccount>[]);
  }
}
