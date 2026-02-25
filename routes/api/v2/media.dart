import 'dart:io';
import 'dart:typed_data';

import 'package:dart_frog/dart_frog.dart';
import 'package:image_compression/image_compression.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/forms/media_upload_form.dart';
import 'package:sky_bridge/models/mastodon/mastodon_media_attachment.dart';
import 'package:sky_bridge/util.dart';

/// Creates a media attachment to be used with a new status.
/// POST /api/v2/media HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/media/#v2
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final formData = await context.request.formData();
  final formDataEncoded = MediaUploadForm.fromJson(formData.fields);

  final imageFile = formData.files['file'];
  if (imageFile == null) {
    print('No file found in form data.');
    return _invalidMedia();
  }

  var fileBytes = Uint8List.fromList(await imageFile.readAsBytes());
  final mimeType = imageFile.contentType.mimeType.toLowerCase();

  // Detect the actual type from magic bytes.
  final extension = _detectExtension(fileBytes, mimeType);
  if (extension == null) {
    print('Could not determine media type. First bytes: '
        '${fileBytes.sublist(0, fileBytes.length.clamp(0, 12))}');
    return _invalidMedia();
  }

  final isGif = extension == 'gif';
  final isImage = !isGif && (extension == 'jpeg' || extension == 'png' || extension == 'webp');

  // Compress JPEG/PNG images that exceed the Bluesky 976 KB limit.
  const bskyImageLimit = 976560;
  if (isImage && fileBytes.length > bskyImageLimit) {
    print('File size ${fileBytes.length} exceeds limit, compressing…');

    final file = ImageFile(
      rawBytes: fileBytes,
      filePath: '/tmp/${imageFile.name}',
      contentType: extension,
    );

    var compressed = false;
    for (var i = 0; i < 5; i++) {
      final quality = 80 - (i * 10);
      print('Compression attempt ${i + 1}/5, quality $quality');
      final config = ImageFileConfiguration(
        input: file,
        config: Configuration(jpgQuality: quality),
      );
      final result = await compressInQueue(config);
      if (result.sizeInBytes < bskyImageLimit) {
        fileBytes = result.rawBytes;
        compressed = true;
        break;
      }
    }

    if (!compressed) {
      print('Could not compress image within limits.');
      return _invalidMedia();
    }
  }

  // Upload to Bluesky.
  final response = await bluesky.atproto.repo.uploadBlob(fileBytes);
  final blob = response.data.blob;

  final description = formDataEncoded.description ?? '';
  final record = await databaseTransaction(
    () async => BlobExtension.fromBlob(blob, description),
  );

  final attachmentType = isGif ? MediaType.gifv : MediaType.image;

  return threadedJsonResponse(
    body: MastodonMediaAttachment(
      id: record.id.toString(),
      type: attachmentType,
      previewUrl: '',
      url: '',
      description: description,
      blurhash: '',
    ),
  );
}

/// Detect file extension from magic bytes, falling back to MIME type.
String? _detectExtension(List<int> bytes, String mimeType) {
  if (bytes.length >= 3) {
    if (bytes[0] == 0xFF && bytes[1] == 0xD8) return 'jpeg';
    if (bytes[0] == 0x89 && bytes[1] == 0x50 && bytes[2] == 0x4E) return 'png';
    if (bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46) return 'gif';
    // RIFF….WEBP
    if (bytes.length >= 12 &&
        bytes[0] == 0x52 && bytes[1] == 0x49 &&
        bytes[8] == 0x57 && bytes[9] == 0x45) return 'webp';
  }
  switch (mimeType) {
    case 'image/jpeg':
    case 'image/jpg':
      return 'jpeg';
    case 'image/png':
      return 'png';
    case 'image/gif':
      return 'gif';
    case 'image/webp':
      return 'webp';
    default:
      return null;
  }
}

Response _invalidMedia() {
  const e = 'Validation failed: File content type is invalid, File is invalid';
  return Response.json(
    statusCode: HttpStatus.unprocessableEntity,
    body: {'error': e},
  );
}
