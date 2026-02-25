import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// Update the user's display name and bio.
/// PATCH /api/v1/accounts/update_credentials HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#update_credentials
///
/// Note: Bluesky profile editing requires a different ATProto API call
/// (com.atproto.repo.putRecord on app.bsky.actor.profile) which is not
/// directly exposed in bluesky ^0.15.1. We return the current profile so
/// clients that call this endpoint don't receive an error.
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.patch) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final session = await sessionFromContext(context);
  if (session == null) return authError();
  final bluesky = bsky.Bluesky.fromSession(session);

  // Return the current profile (read-only for now).
  final profile = await bluesky.actor.getProfile(actor: session.did);
  final account = await databaseTransaction(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  account
    ..source = AccountSource(
      note: profile.data.description ?? '',
      fields: [],
      privacy: PostVisibility.public,
      sensitive: false,
      language: 'en',
      followRequestsCount: 0,
    )
    ..role = AccountRole(
      id: 99,
      name: '',
      permissions: 65536,
      highlighted: false,
    );

  return threadedJsonResponse(body: account);
}
