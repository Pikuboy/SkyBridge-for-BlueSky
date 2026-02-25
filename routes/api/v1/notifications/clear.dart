import 'dart:io';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Dismiss ALL notifications for this user.
/// POST /api/v1/notifications/clear HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/notifications/#clear
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final session = await sessionFromContext(context);
  if (session == null) return authError();

  try {
    final bluesky = await blueskyFromContext(context);
    if (bluesky != null) {
      final response =
          await bluesky.notification.listNotifications(limit: 100);

      for (final notif in response.data.notifications) {
        // Look up the DB record to get the snowflake ID.
        final record = await db.notificationRecord.findUnique(
          where: NotificationRecordWhereUniqueInput(
            uri: notif.uri.toString(),
          ),
        );
        if (record == null) continue;

        final notifId = record.id.toString();
        final hashInput =
            utf8.encode('dismissed_notif:${session.did}:$notifId');
        final hashBytes = sha256.convert(hashInput).bytes;
        final recordId = hashBytes
            .take(8)
            .fold(BigInt.zero, (acc, b) => (acc << 8) | BigInt.from(b))
            .toUnsigned(63);

        try {
          final existing = await db.mediaRecord.findUnique(
            where: MediaRecordWhereUniqueInput(id: recordId),
          );
          if (existing == null) {
            await db.mediaRecord.create(
              data: MediaRecordCreateInput(
                id: recordId,
                type: 'dismissed_notif',
                mimeType: session.did,
                size: 0,
                link: notifId,
                description: '',
              ),
            );
          }
        } catch (_) {}
      }
    }
  } catch (e) {
    print('Notifications clear error (non-fatal): $e');
  }

  return threadedJsonResponse(body: <String, dynamic>{});
}
