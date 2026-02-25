import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// Streaming endpoint stub.
/// GET /api/v1/streaming HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/streaming/
///
/// Real streaming (Server-Sent Events or WebSocket) would require connecting
/// to the Bluesky Firehose. This stub returns a health-check OK so clients
/// that probe this endpoint before connecting don't error out.
Future<Response> onRequest(RequestContext context) async {
  // Return a minimal health-check response.
  // Clients that need actual streaming will fall back to polling.
  return Response(
    statusCode: HttpStatus.ok,
    body: '{}',
    headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
  );
}
