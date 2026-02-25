import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/models/mastodon/mastodon_notification.dart';
import 'package:sky_bridge/models/params/notification_params.dart';
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

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final limit = encodedParams.limit.clamp(1, 100);

  final response = await bluesky.notification.listNotifications(
    limit: limit,
    cursor: encodedParams.cursor,
  );
  final nextCursor = response.data.cursor;

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

  var headers = <String, String>{};
  if (notifs.isNotEmpty) {
    headers = generatePaginationHeaders(
      items: notifs,
      requestUri: context.request.uri,
      nextCursor: nextCursor ?? '',
      getId: (notification) => BigInt.parse(notification.id),
    );
  }

  return threadedJsonResponse(body: notifs, headers: headers);
}
