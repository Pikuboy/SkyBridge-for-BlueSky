import 'dart:io';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Dismiss a single notification so it no longer appears.
/// POST /api/v1/notifications/:id/dismiss HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/notifications/#dismiss
///
/// Dismissed IDs are stored in MediaRecord (type="dismissed_notif").
Future<Response> onRequest<T>(RequestContext context, String id) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final session = await sessionFromContext(context);
  if (session == null) return authError();

  if (BigInt.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Derive a stable ID for this dismiss record.
  final hashInput = utf8.encode('dismissed_notif:${session.did}:$id');
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
          link: id,
          description: '',
        ),
      );
    }
  } catch (e) {
    print('Notification dismiss (non-fatal): $e');
  }

  return threadedJsonResponse(body: <String, dynamic>{});
}
