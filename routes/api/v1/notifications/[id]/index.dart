import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_notification.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Get a single notification.
/// GET /api/v1/notifications/:id HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/notifications/#get-one
Future<Response> onRequest<T>(RequestContext context, String id) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final idNumber = BigInt.parse(id);
  final record = await db.notificationRecord.findUnique(
    where: NotificationRecordWhereUniqueInput(id: idNumber),
  );
  if (record == null) return Response(statusCode: HttpStatus.notFound);

  // Re-fetch the notification from Bluesky to build a full Mastodon object.
  // We fetch a small batch and find the matching one.
  try {
    final response = await bluesky.notification.listNotifications(limit: 50);
    final matching = response.data.notifications.where(
      (n) => n.uri.toString() == record.uri,
    );

    if (matching.isEmpty) {
      return Response(statusCode: HttpStatus.notFound);
    }

    final notifs = await MastodonNotification.fromNotificationList(
      [matching.first],
      bluesky,
    );

    if (notifs.isEmpty) return Response(statusCode: HttpStatus.notFound);
    return threadedJsonResponse(body: notifs.first);
  } catch (e) {
    print('Single notification error: $e');
    return Response(statusCode: HttpStatus.internalServerError);
  }
}
