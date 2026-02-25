import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart' as http;
import 'package:sky_bridge/util.dart';

/// Video proxy endpoint — version chemin (path-based).
///
/// Accepte les URLs de la forme :
///   GET /api/v1/video_proxy/video.bsky.app/watch/<did>/<cid>/playlist.m3u8
///   GET /api/v1/video_proxy/video.bsky.app/watch/<did>/<cid>/720p/video.m3u8
///   GET /api/v1/video_proxy/video.bsky.app/watch/<did>/<cid>/720p/video2.ts
///
/// Avantage : l'URL ne contient aucun query param encodé (%3A%2F%2F),
/// donc AVPlayer iOS peut la lire directement — y compris en plein écran.
Future<Response> onRequest(RequestContext context, String path) async {
  if (context.request.method == HttpMethod.options) {
    return Response(statusCode: HttpStatus.ok, headers: _corsHeaders);
  }

  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // Reconstruire l'URL cible depuis le chemin capturé.
  // ex: path = "video.bsky.app/watch/did:plc:.../playlist.m3u8"
  // On préserve les query params originaux de la requête (ex: session_id)
  // car ils sont nécessaires pour les segments .ts — le proxy les strippera
  // pour les sous-playlists mais les garde pour les segments binaires.
  final query = context.request.uri.query;
  final targetUrl = 'https://$path${query.isNotEmpty ? '?$query' : ''}';

  Uri targetUri;
  try {
    targetUri = Uri.parse(targetUrl);
    if (targetUri.host != 'video.bsky.app') {
      return Response(statusCode: HttpStatus.forbidden);
    }
  } catch (_) {
    return Response(statusCode: HttpStatus.badRequest);
  }

  // Forward Range header (seeking).
  final rangeHeader = context.request.headers['range'];
  final requestHeaders = <String, String>{
    if (rangeHeader != null) 'Range': rangeHeader,
  };

  print('[video_proxy/path] Fetching: $targetUri');
  final http.Response response;
  try {
    response = await http
        .get(targetUri, headers: requestHeaders)
        .timeout(const Duration(seconds: 15));
  } catch (_) {
    return Response(statusCode: HttpStatus.gatewayTimeout);
  }

  if (response.statusCode != HttpStatus.ok &&
      response.statusCode != HttpStatus.partialContent) {
    return Response(statusCode: response.statusCode);
  }

  final contentType = response.headers['content-type'] ?? '';
  final isM3u8 = contentType.contains('mpegurl') ||
      contentType.contains('x-mpegurl') ||
      path.contains('.m3u8') ||
      path.contains('playlist') ||
      response.body.trimLeft().startsWith('#EXTM3U');

  if (isM3u8) {
    final baseUrl = _getBaseUrlFromEnv();
    final rewritten = _rewriteM3u8(response.body, targetUri, baseUrl);
    return Response(
      statusCode: HttpStatus.ok,
      body: rewritten,
      headers: {
        ..._corsHeaders,
        'Content-Type': 'application/x-mpegurl',
        'Cache-Control': 'no-cache',
        'Accept-Ranges': 'bytes',
      },
    );
  }

  // Segments binaires (.ts) — pass-through.
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

const _corsHeaders = <String, String>{
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, OPTIONS',
  'Access-Control-Allow-Headers': 'Range, Origin, Accept',
  'Access-Control-Expose-Headers': 'Content-Length, Content-Range',
};

String _getBaseUrlFromEnv() {
  var baseUrl = env.getOrElse('SKYBRIDGE_BASEURL', () => 'localhost');
  if (!baseUrl.startsWith('http://') && !baseUrl.startsWith('https://')) {
    baseUrl = 'https://$baseUrl';
  }
  return baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
}

/// Réécrit les URLs dans le m3u8 pour pointer vers ce proxy (format chemin).
/// Strip le session_id des sous-playlists pour éviter les expirations.
String _rewriteM3u8(String manifest, Uri baseUri, String baseUrl) {
  final lines = manifest.split('\n');
  final rewritten = <String>[];

  for (final line in lines) {
    final trimmed = line.trim();

    if (trimmed.isEmpty) {
      rewritten.add(line);
      continue;
    }

    if (trimmed.startsWith('#')) {
      rewritten.add(_rewriteTagUris(trimmed, baseUri, baseUrl));
      continue;
    }

    // Résoudre l'URL du segment/sous-playlist.
    String segmentUrl;
    if (trimmed.startsWith('http')) {
      segmentUrl = trimmed;
    } else {
      segmentUrl = baseUri.resolve(trimmed).toString();
    }

    // Strip session_id uniquement pour les sous-playlists .m3u8
    // (les segments .ts en ont besoin pour l'authentification CDN).
    final isSubPlaylist = segmentUrl.contains('.m3u8');
    if (isSubPlaylist) {
      segmentUrl = _stripSessionId(segmentUrl);
    }

    // Convertir https://video.bsky.app/watch/... en chemin proxy
    // → /api/v1/video_proxy/video.bsky.app/watch/...
    final proxied = _toProxyPath(segmentUrl, baseUrl);
    rewritten.add(proxied);
  }

  return rewritten.join('\n');
}

/// Convertit une URL bsky en URL proxy format chemin.
String _toProxyPath(String url, String baseUrl) {
  try {
    final uri = Uri.parse(url);
    // Reconstruire : baseUrl/api/v1/video_proxy/<host><path>[?query]
    final proxyPath = '${uri.host}${uri.path}';
    final query = uri.query.isNotEmpty ? '?${uri.query}' : '';
    return '$baseUrl/api/v1/video_proxy/$proxyPath$query';
  } catch (_) {
    return url;
  }
}

String _rewriteTagUris(String tag, Uri baseUri, String baseUrl) {
  final uriPattern = RegExp(r'URI="([^"]+)"');
  return tag.replaceAllMapped(uriPattern, (match) {
    final original = match.group(1)!;
    String resolved = original.startsWith('http')
        ? original
        : baseUri.resolve(original).toString();
    resolved = _stripSessionId(resolved);
    return 'URI="${_toProxyPath(resolved, baseUrl)}"';
  });
}

String _stripSessionId(String url) {
  try {
    final uri = Uri.parse(url);
    if (!uri.queryParameters.containsKey('session_id')) return url;
    final params = Map<String, String>.from(uri.queryParameters)
      ..remove('session_id');
    return uri.replace(queryParameters: params.isEmpty ? null : params).toString();
  } catch (_) {
    return url;
  }
}
