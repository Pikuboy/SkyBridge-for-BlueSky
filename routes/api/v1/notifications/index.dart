import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_notification.dart';
import 'package:sky_bridge/models/params/notification_params.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Receive notifications for activity on your account or posts.
/// GET /api/v1/notifications HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/notifications/#get
Future<Response> onRequest<T>(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final params = context.request.uri.queryParameters;
  final encodedParams = NotificationParams.fromJson(params);

  final session = await sessionFromContext(context);
  if (session == null) return authError();
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final limit = encodedParams.limit.clamp(1, 100);

  // Support both cursor and max_id for pagination
  // max_id is used by Mastodon clients to fetch older items
  // We need to use it as cursor for Bluesky API
  String? cursor;
  if (params['max_id'] != null && params['max_id']!.isNotEmpty) {
    cursor = params['max_id'];
  } else if (encodedParams.cursor != null && encodedParams.cursor!.isNotEmpty) {
    cursor = encodedParams.cursor;
  }

  print('Notifications: Fetching with cursor=$cursor, limit=$limit');

  final response = await bluesky.notification.listNotifications(
    limit: limit,
    cursor: cursor,
  );
  
  print('Notifications: Received ${response.data.notifications.length} notifications, nextCursor=${response.data.cursor}');
  
  final nextCursor = response.data.cursor;

  // Mark all notifications as seen on Bluesky so the unread badge clears.
  // Fire-and-forget — don't block the response if this fails.
  bluesky.notification
      .updateSeen(seenAt: DateTime.now().toUtc())
      .catchError((_) => null);

  var notifs = await MastodonNotification.fromNotificationList(
    response.data.notifications,
    bluesky,
  );

  // Filter by min_id.
  if (encodedParams.minId != null) {
    final minId = BigInt.parse(encodedParams.minId!);
    notifs.removeWhere((notif) => BigInt.parse(notif.id) <= minId);
  }

  // Filter by types[] / exclude_types[] if provided.
  final rawParams = context.request.uri.queryParametersAll;
  final typeFilter = rawParams['types[]'] ?? rawParams['types'];
  if (typeFilter != null && typeFilter.isNotEmpty) {
    notifs = notifs.where((n) => typeFilter.contains(n.type.name)).toList();
  }
  final excludeFilter =
      rawParams['exclude_types[]'] ?? rawParams['exclude_types'];
  if (excludeFilter != null && excludeFilter.isNotEmpty) {
    notifs =
        notifs.where((n) => !excludeFilter.contains(n.type.name)).toList();
  }

  // Filter out dismissed notifications (stored as MediaRecord type=dismissed_notif).
  final dismissedRecords = await db.mediaRecord.findMany(
    where: MediaRecordWhereInput(
      type: StringFilter(equals: 'dismissed_notif'),
      mimeType: StringFilter(equals: session.did),
    ),
  );
  final dismissedIds = dismissedRecords.map((r) => r.link).toSet();
  notifs = notifs.where((n) => !dismissedIds.contains(n.id)).toList();

  var headers = <String, String>{};
  if (notifs.isNotEmpty) {
    headers = generatePaginationHeaders(
      items: notifs,
      requestUri: context.request.uri,
      nextCursor: nextCursor ?? '',
      getId: (notification) => BigInt.parse(notification.id),
    );
  }

  print('Notifications: Returning ${notifs.length} notifications with headers: $headers');
  return threadedJsonResponse(body: notifs, headers: headers);
}
