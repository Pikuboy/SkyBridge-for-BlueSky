import 'package:bluesky/bluesky.dart' as bsky;
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_media_attachment.g.dart';

/// Represents a file or media attachment that can be added to a post.
@JsonSerializable()
class MastodonMediaAttachment {
  /// Constructs an instance of [MastodonMediaAttachment].
  MastodonMediaAttachment({
    required this.id,
    required this.type,
    required this.previewUrl,
    required this.description,
    required this.blurhash,
    this.url,
    this.remoteUrl,
    this.meta,
  });

  /// Converts a [bsky.EmbedImagesViewImage] to a [MastodonMediaAttachment].
  factory MastodonMediaAttachment.fromEmbed(
    bsky.EmbedImagesViewImage embed,
  ) {
    final description = embed.alt.isEmpty ? null : embed.alt;

    final meta = MediaAttachmentMetadata(
      original: Metadata(
        width: embed.aspectRatio?.width ?? 1,
        height: embed.aspectRatio?.height ?? 1,
      ),
    );

    return MastodonMediaAttachment(
      id: '0',
      type: MediaType.image,
      url: embed.fullsize,
      previewUrl: embed.thumbnail,
      remoteUrl: embed.fullsize,
      description: description,
      meta: meta,
      blurhash: '0',
    );
  }

  /// Converts a Bluesky video embed view (app.bsky.embed.video#view)
  /// to a [MastodonMediaAttachment].
  ///
  /// [baseUrl] is the base URL of this SkyBridge instance. When provided,
  /// the HLS playlist URL is routed through the video proxy which:
  /// - Adds CORS headers for web clients
  /// - Strips the session_id query parameter from sub-playlist URLs so that
  ///   the player can restart (e.g. fullscreen transition) without hitting
  ///   stale session URLs
  ///
  /// Also fetches the HLS playlist to compute the total duration, since
  /// Bluesky does not include duration in embed metadata.
  static Future<MastodonMediaAttachment?> fromVideoEmbed(
    dynamic videoData, {
    String? baseUrl,
  }) async {
    try {
      final json = videoData.toJson() as Map<String, dynamic>;
      final playlist = json['playlist'] as String?;
      if (playlist == null || playlist.isEmpty) return null;

      final thumbnail = json['thumbnail'] as String?;
      final alt = json['alt'] as String?;
      final aspectRatio = json['aspectRatio'] as Map<String, dynamic>?;
      final width = (aspectRatio?['width'] as num?)?.toInt() ?? 16;
      final height = (aspectRatio?['height'] as num?)?.toInt() ?? 9;

      // Fetch the HLS master playlist to extract the total duration.
      // Bluesky does not provide duration in embed metadata.
      final duration = await _fetchHlsDuration(playlist);

      final meta = MediaAttachmentMetadata(
        original: Metadata(width: width, height: height, duration: duration),
      );

      // Route the playlist through the video proxy when a baseUrl is provided.
      // This strips the session_id from sub-playlist URLs, which is the root
      // cause of fullscreen playback failing in Ivory and similar clients.
      // Ensure baseUrl has a scheme prefix so AVPlayer gets a valid URL.
      String? effectiveBaseUrl = baseUrl;
      if (effectiveBaseUrl != null &&
          !effectiveBaseUrl.startsWith('http://') &&
          !effectiveBaseUrl.startsWith('https://')) {
        effectiveBaseUrl = 'https://$effectiveBaseUrl';
      }
      // Construire l'URL du proxy via Uri pour un encodage correct du
      // query param. Uri.encodeQueryComponent encode uniquement les caractères
      // interdits dans les query strings (:, /, ?, etc.) sans sur-encoder
      // Construire l'URL proxy au format CHEMIN (path-based) :
      //   https://ton-serveur/api/v1/video_proxy/video.bsky.app/watch/<did>/<cid>/playlist.m3u8
      //
      // Avantage vs query param (?url=https%3A%2F%2F...) :
      // L'URL ne contient aucun encodage %3A%2F%2F — AVPlayer iOS peut la
      // parser et la charger directement, y compris en mode plein écran.
      // Le proxy strip le session_id des sous-playlists pour éviter
      // les expirations lors des transitions miniature → plein écran.
      final decodedPlaylist = Uri.decodeFull(playlist);
      String proxiedUrl = playlist;
      if (effectiveBaseUrl != null) {
        try {
          final playlistUri = Uri.parse(decodedPlaylist);
          // /api/v1/video_proxy/video.bsky.app/watch/...
          proxiedUrl = '$effectiveBaseUrl/api/v1/video_proxy/${playlistUri.host}${playlistUri.path}';
        } catch (_) {
          proxiedUrl = playlist;
        }
      }

      return MastodonMediaAttachment(
        id: '0',
        type: MediaType.video,
        url: proxiedUrl,     // proxy chemin → AVPlayer lit sans problème
        previewUrl: thumbnail ?? '',
        remoteUrl: playlist, // URL directe bsky (référence originale)
        description: alt,
        meta: meta,
        blurhash: '0',
      );
    } catch (_) {
      return null;
    }
  }

  /// Fetches an HLS master playlist and sums segment durations
  /// from the first rendition playlist to get total video duration.
  static Future<double?> _fetchHlsDuration(String masterPlaylistUrl) async {
    try {
      final masterResp = await http
          .get(Uri.parse(masterPlaylistUrl))
          .timeout(const Duration(seconds: 8));
      if (masterResp.statusCode != 200) return null;

      final masterLines = masterResp.body.split('\n');

      // Find first rendition playlist URL.
      String? renditionUrl;
      bool nextIsRendition = false;
      for (final line in masterLines) {
        final trimmed = line.trim();
        if (trimmed.startsWith('#EXT-X-STREAM-INF')) {
          nextIsRendition = true;
          continue;
        }
        if (nextIsRendition && trimmed.isNotEmpty && !trimmed.startsWith('#')) {
          // Strip session_id for a stable URL.
          final raw = trimmed.startsWith('http')
              ? trimmed
              : Uri.parse(masterPlaylistUrl).resolve(trimmed).toString();
          final uri = Uri.parse(raw);
          final params = Map<String, String>.from(uri.queryParameters)
            ..remove('session_id');
          renditionUrl = uri
              .replace(queryParameters: params.isEmpty ? null : params)
              .toString();
          break;
        }
        if (trimmed.isNotEmpty && !trimmed.startsWith('#')) {
          nextIsRendition = false;
        }
      }

      if (renditionUrl == null) return null;

      // Fetch rendition playlist and sum #EXTINF durations.
      final renditionResp = await http
          .get(Uri.parse(renditionUrl))
          .timeout(const Duration(seconds: 8));
      if (renditionResp.statusCode != 200) return null;

      double total = 0.0;
      for (final line in renditionResp.body.split('\n')) {
        final trimmed = line.trim();
        if (trimmed.startsWith('#EXTINF:')) {
          final valueStr =
              trimmed.substring('#EXTINF:'.length).split(',').first;
          final value = double.tryParse(valueStr);
          if (value != null) total += value;
        }
      }

      return total > 0 ? total : null;
    } catch (_) {
      return null;
    }
  }

  /// Converts JSON into a [MastodonMediaAttachment] instance.
  factory MastodonMediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$MastodonMediaAttachmentFromJson(json);

  /// Converts the [MastodonMediaAttachment] to JSON.
  Map<String, dynamic> toJson() => _$MastodonMediaAttachmentToJson(this);

  final String id;
  final MediaType type;
  final String? url;

  @JsonKey(name: 'preview_url')
  final String previewUrl;

  @JsonKey(name: 'remote_url')
  final String? remoteUrl;

  final String? description;
  final String blurhash;
  final MediaAttachmentMetadata? meta;
}

/// The type of a [MastodonMediaAttachment].
enum MediaType {
  @JsonValue('image')
  image,

  @JsonValue('gifv')
  gifv,

  @JsonValue('video')
  video,

  @JsonValue('audio')
  audio,

  @JsonValue('unknown')
  unknown,
}

/// Represents metadata about a [MastodonMediaAttachment].
@JsonSerializable()
class MediaAttachmentMetadata {
  const MediaAttachmentMetadata({required this.original});

  factory MediaAttachmentMetadata.fromJson(Map<String, dynamic> json) =>
      _$MediaAttachmentMetadataFromJson(json);

  final Metadata original;

  Map<String, dynamic> toJson() => _$MediaAttachmentMetadataToJson(this);
}

/// Image/video metadata.
@JsonSerializable()
class Metadata {
  const Metadata({required this.width, required this.height, this.duration});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  final int width;
  final int height;

  /// Duration of the video in seconds.
  final double? duration;

  double get aspect => width / height;

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
