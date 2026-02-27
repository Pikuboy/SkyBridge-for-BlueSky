import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart' as http;
import 'package:sky_bridge/util.dart';

/// Video proxy endpoint.
/// Proxies video content from video.bsky.app, handling CORS and rewriting
/// m3u8 manifest segment URLs to also go through this proxy.
///
/// No authentication is required on this endpoint because video.bsky.app
/// serves content publicly once you have the correct CDN URL.
///
/// GET /api/v1/video_proxy?url=<encoded_url>
Future<Response> onRequest(RequestContext context) async {
  // Allow preflight CORS requests from web clients.
  if (context.request.method == HttpMethod.options) {
    return Response(
      statusCode: HttpStatus.ok,
      headers: _corsHeaders,
    );
  }

  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final rawUrl = context.request.uri.queryParameters['url'];
  if (rawUrl == null || rawUrl.isEmpty) {
    return Response(statusCode: HttpStatus.badRequest);
  }

  // Only allow proxying to video.bsky.app for security.
  // Decode the URL in case it was double-encoded by the client.
  Uri targetUri;
  try {
    final decodedUrl = Uri.decodeFull(rawUrl);
    targetUri = Uri.parse(decodedUrl);
    if (targetUri.host != 'video.bsky.app') {
      return Response(statusCode: HttpStatus.forbidden);
    }
  } catch (_) {
    return Response(statusCode: HttpStatus.badRequest);
  }

  // Forward Range header if present (needed for video seeking/streaming).
  final rangeHeader = context.request.headers['range'];
  final requestHeaders = <String, String>{
    if (rangeHeader != null) 'Range': rangeHeader,
  };

  print('[video_proxy] Fetching: $targetUri');
  final http.Response response;
  try {
    response = await http
        .get(targetUri, headers: requestHeaders)
        .timeout(const Duration(seconds: 15));
  } catch (_) {
    return Response(statusCode: HttpStatus.gatewayTimeout);
  }

  print(
    '[video_proxy] Status: ${response.statusCode}, '
    'Content-Type: ${response.headers['content-type']}',
  );

  if (response.statusCode != HttpStatus.ok &&
      response.statusCode != HttpStatus.partialContent) {
    return Response(statusCode: response.statusCode);
  }

  final contentType = response.headers['content-type'] ?? '';

  // Detect M3U8 playlists by Content-Type, URL pattern, or body content.
  final isM3u8 = contentType.contains('mpegurl') ||
      contentType.contains('x-mpegurl') ||
      rawUrl.contains('.m3u8') ||
      rawUrl.contains('playlist') ||
      response.body.trimLeft().startsWith('#EXTM3U');

  if (isM3u8) {
    final manifest = response.body;
    // Use SKYBRIDGE_BASEURL from env — stable across all player contexts
    // (miniature, plein écran, restart). Ne jamais utiliser les headers
    // de la requête (host/x-forwarded-proto) qui peuvent être instables
    // lors des transitions plein écran dans Ivory/AVPlayer.
    final baseUrl = _getBaseUrlFromEnv();
    final rewritten = _rewriteM3u8(manifest, targetUri, baseUrl);
    return Response(
      statusCode: HttpStatus.ok,
      body: rewritten,
      headers: {
        ..._corsHeaders,
        // application/x-mpegurl est le type standard reconnu par AVPlayer
        // et les clients Mastodon natifs (Ivory, Ice Cubes...).
        'Content-Type': 'application/x-mpegurl',
        'Cache-Control': 'no-cache',
        'Accept-Ranges': 'bytes',
      },
    );
  }

  // For video segments and other binary content, pass through as-is.
  final extraHeaders = <String, String>{};
  final contentRange = response.headers['content-range'];
  final contentLength = response.headers['content-length'];
  if (contentRange != null) extraHeaders['Content-Range'] = contentRange;
  if (contentLength != null) extraHeaders['Content-Length'] = contentLength;

  return Response.bytes(
    statusCode: response.statusCode,
    body: response.bodyBytes,
    headers: {
      ..._corsHeaders,
      ...extraHeaders,
      'Content-Type': contentType.isNotEmpty ? contentType : 'video/mp2t',
      'Cache-Control': 'public, max-age=3600',
      'Accept-Ranges': 'bytes',
    },
  );
}

/// CORS headers added to every response.
const _corsHeaders = <String, String>{
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, OPTIONS',
  'Access-Control-Allow-Headers': 'Range, Origin, Accept',
  'Access-Control-Expose-Headers': 'Content-Length, Content-Range',
};

/// Retourne la base URL stable depuis la variable d'environnement
/// SKYBRIDGE_BASEURL, en ajoutant le scheme https:// si absent.
/// Cette approche est fiable même lors des transitions plein écran
/// où les headers HTTP de la requête peuvent changer.
String _getBaseUrlFromEnv() {
  var baseUrl = env.getOrElse(
    'SKYBRIDGE_BASEURL',
    () => 'localhost',
  );
  if (!baseUrl.startsWith('http://') && !baseUrl.startsWith('https://')) {
    baseUrl = 'https://$baseUrl';
  }
  // Supprimer le slash final si présent.
  return baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
}

/// Rewrites segment URLs in an m3u8 manifest to go through this proxy.
/// Also strips session_id query parameters from sub-playlist URLs to ensure
/// stable URLs that work across player restarts and fullscreen transitions.
String _rewriteM3u8(String manifest, Uri baseUri, String baseUrl) {
  final lines = manifest!.split('\n');
  final rewritten = <String>[];

  for (final line in lines) {
    final trimmed = line.trim();

    if (trimmed.isEmpty) {
      rewritten.add(line);
      continue;
    }

    if (trimmed.startsWith('#')) {
      // Rewrite URI="..." attributes inside HLS tags.
      final rewrittenTag = _rewriteTagUris(trimmed, baseUri, baseUrl);
      rewritten.add(rewrittenTag);
      continue;
    }

    // Resolve relative or absolute segment/sub-playlist URLs.
    String segmentUrl;
    if (trimmed.startsWith('http')) {
      segmentUrl = trimmed;
    } else {
      segmentUrl = baseUri.resolve(trimmed).toString();
    }

    // Strip session_id query parameter — Bluesky's CDN serves content
    // publicly without it, and keeping it causes fullscreen playback to
    // fail when Ivory restarts the player with a stale session_id.
    segmentUrl = _stripSessionId(segmentUrl);

    final proxied =
        '$baseUrl/api/v1/video_proxy?url=${Uri.encodeComponent(segmentUrl)}';
    rewritten.add(proxied);
  }

  return rewritten.join('\n');
}

/// Removes the session_id query parameter from a URL.
String _stripSessionId(String url) {
  try {
    final uri = Uri.parse(url);
    if (!uri.queryParameters.containsKey('session_id')) return url;
    final params = Map<String, String>.from(uri.queryParameters)
      ..remove('session_id');
    return uri.replace(queryParameters: params.isEmpty ? null : params)
        .toString();
  } catch (_) {
    return url;
  }
}

/// Rewrites URI="..." occurrences inside an HLS tag line.
String _rewriteTagUris(String tag, Uri baseUri, String baseUrl) {
  final uriPattern = RegExp(r'URI="([^"]+)"');
  return tag.replaceAllMapped(uriPattern, (match) {
    final original = match.group(1)!;
    String resolved;
    if (original.startsWith('http')) {
      resolved = original;
    } else {
      resolved = baseUri.resolve(original).toString();
    }
    resolved = _stripSessionId(resolved);
    final proxied =
        '$baseUrl/api/v1/video_proxy?url=${Uri.encodeComponent(resolved)}';
    return 'URI="$proxied"';
  });
}
