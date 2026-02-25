import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// Streaming health check endpoint.
/// GET /api/v1/streaming/health HTTP/1.1
Future<Response> onRequest(RequestContext context) async {
  return Response(
    statusCode: HttpStatus.ok,
    body: 'OK',
    headers: {HttpHeaders.contentTypeHeader: 'text/plain'},
  );
}
