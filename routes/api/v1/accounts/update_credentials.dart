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
/// Bluesky profile editing requires a different ATProto API call
/// (com.atproto.repo.putRecord on app.bsky.actor.profile). We read the
/// existing profile record, merge in the fields Ivory sent, and write
/// it back so the change actually persists.
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.patch) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final session = await sessionFromContext(context);
  if (session == null) return authError();
  final bluesky = bsky.Bluesky.fromSession(session);

  // Ivory sends profile updates as multipart/form-data.
  final form = await context.request.formData();
  final newDisplayName = form.fields['display_name'];
  final newNote = form.fields['note'];

  // Fetch the current profile record so we only overwrite the fields
  // that were actually sent, preserving everything else (avatar,
  // banner, existing description/displayName, etc).
  final currentProfile = await bluesky.actor.getProfile(actor: session.did!);

  final record = await bluesky.atproto.repo.getRecord(
    repo: session.did!,
    collection: 'app.bsky.actor.profile',
    rKey: 'self',
  );

  final updatedRecord = Map<String, dynamic>.from(record.data.value)
    ..['displayName'] =
        newDisplayName ?? currentProfile.data.displayName ?? ''
    ..['description'] = newNote ?? currentProfile.data.description ?? '';

  await bluesky.atproto.repo.putRecord(
    repo: session.did!,
    collection: 'app.bsky.actor.profile',
    rKey: 'self',
    record: updatedRecord,
  );

  // Re-fetch the profile so the response reflects the saved changes.
  final profile = await bluesky.actor.getProfile(actor: session.did!);
  final account = await databaseTransaction(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  account
    ..source = AccountSource(
      note: await processProfileDescription(profile.data.description ?? ''),
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
