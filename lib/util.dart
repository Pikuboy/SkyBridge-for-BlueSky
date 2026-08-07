import 'dart:io';
import 'dart:typed_data';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:bluesky/src/services/codegen/app/bsky/feed/getPostThread/union_main_thread.dart';
import 'package:bluesky/src/services/codegen/app/bsky/feed/defs/union_thread_view_post_replies.dart';
import 'package:bluesky/src/services/codegen/app/bsky/feed/defs/union_thread_view_post_parent.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';
import 'package:html/parser.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:yet_another_json_isolate/yet_another_json_isolate.dart';

/// Environment variables loaded from a .env file.
DotEnv env = DotEnv(includePlatformEnvironment: true);

/// Isolate used for JSON encoding/decoding.
YAJsonIsolate jsonIsolate = YAJsonIsolate()..initialize();

/// Encode a JSON [Response] in a separate isolate to avoid blocking the main
/// isolate.
Future<Response> threadedJsonResponse({
  int statusCode = 200,
  Object? body = const <String, dynamic>{},
  Map<String, Object> headers = const <String, Object>{},
}) async {
  final json = body != null ? await jsonIsolate.encode(body) : null;
  return Response(
    statusCode: statusCode,
    body: json,
    headers: {
      ...headers,
      if (!headers.containsKey(HttpHeaders.contentTypeHeader))
        HttpHeaders.contentTypeHeader: ContentType.json.value,
    },
  );
}

/// Returns a [DateTime] from a Unix epoch in seconds.
DateTime dateTimeFromEpoch(int epoch) {
  return DateTime.fromMillisecondsSinceEpoch(epoch * 1000).toUtc();
}

/// Returns a Unix epoch in seconds from a [DateTime].
int dateTimeToEpoch(DateTime date) {
  return (date.millisecondsSinceEpoch / 1000).floor();
}

/// Returns a [DateTime] from an ISO 8601 string.
DateTime dateTimeFromISO8601(String date) {
  return DateTime.parse(date).toUtc();
}

/// Returns a [DateTime] from an ISO 8601 string if [date] is not null.
DateTime? dateTimeFromNullableISO8601(String? date) {
  if (date == null) return null;
  return DateTime.parse(date).toUtc();
}

/// Returns an ISO 8601 string from a [DateTime].
String? dateTimeToISO8601(DateTime? date) {
  return date?.toUtc().toIso8601String();
}

/// Extends [String] to allow for rudimentary string formatting/templating.
extension StringFormatExtension on String {
  /// Formats the string using the provided [context].
  /// This is a very rudimentary implementation of string formatting/templating.
  String format(Map<String, dynamic> context) {
    return replaceAllMapped(
      RegExp(r'##(\w+)##'),
      (match) => context[match.group(1)]?.toString() ?? match.group(0)!,
    );
  }
}

/// Determines if the provided [password] is a valid app password.
void isValidAppPassword(String password) {
  final r = RegExp(
    r'^[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}$',
  );

  final isAppPassword = r.hasMatch(password);

  if (!isAppPassword) {
    throw Exception('Provided password is not an app password!');
  }
}

/// Takes a list of [K] and a function that processes the items in chunks,
/// returning a list of [T] for each chunk.
///
/// Returns a Future that resolves to a list of all results combined.
///
/// This is useful for getting around Bluesky API limits, where a lot of
/// endpoints will restrict the number of items you can query at once to 25.
Future<List<T>> chunkResults<T, K>({
  required List<K> items,
  required Future<List<T>> Function(List<K> results) callback,
  int limit = 25,
}) async {
  final results = <T>[];
  final tasks = <Future<List<T>>>[];

  for (var i = 0; i < items.length; i += limit) {
    // Process the current chunk of items.
    final chunk = items.sublist(i, i + limit.clamp(0, items.length - i));
    final task = callback(chunk);
    tasks.add(task);
  }

  // Perform all the tasks asynchronously.
  final chunkResults = await Future.wait(tasks);
  for (final chunkResult in chunkResults) {
    results.addAll(chunkResult);
  }

  return results;
}

/// Traverse the replies of a thread and return a list of
/// [MastodonPost]s with the correct reply IDs set, down to a certain [depth].
///
/// Creates a list of replies compatible with the Mastodon API
/// status context endpoint.
Future<List<MastodonPost>> traverseReplies(
  UFeedGetPostThreadThread view,
  int depth,
) async {
  final result = <MastodonPost>[];
  
  // Extract ThreadViewPost data from the union type
  final threadViewData = view.when(
    threadViewPost: (record) => record,
    notFoundPost: (_) => null,
    blockedPost: (_) => null,
    unknown: (_) => null,
  );
  
  // If this is not a ThreadViewPost, return empty list
  if (threadViewData == null) return result;
  
  // Get the current depth post and add it to the list.
  final currentPost = await MastodonPost.fromBlueSkyPost(threadViewData.post);
  // Skip the first post.
  if (depth > 0) result.add(currentPost);

  // We don't want to traverse too deep, 6 is just a number I pulled out
  // of thin air. Need to look into how deep Bluesky goes.
  if (depth < 6) {
    if (threadViewData.replies != null) {
      for (final reply in threadViewData.replies!) {
        // Extract ThreadViewPost from UThreadViewPostReplies
        final replyData = reply.threadViewPost;
        
        if (replyData != null) {
          // Convert to UFeedGetPostThreadThread
          final replyAsThread = UFeedGetPostThreadThread.threadViewPost(
            data: replyData,
          );
          // Step down and recursively traverse the replies.
          final list = await traverseReplies(replyAsThread, depth + 1);
          for (final childPost in list) {
            if (childPost.inReplyToId == null) {
              // We have a dangling reply which means they are replying to
              // this current post. Set the IDs accordingly.
              childPost
                ..inReplyToAccountId = currentPost.account.id
                ..inReplyToId = currentPost.id;
            }
            result.add(childPost);
          }
        }
      }
    }
  }

  return result;
}

/// Traverse the parents of a thread and return a list of
/// [MastodonPost]s with the correct reply IDs set, up to a certain [depth].
///
/// Creates a list of parents compatible with the Mastodon API
/// status context endpoint.
Future<List<MastodonPost>> traverseParents(
  UFeedGetPostThreadThread view,
  int depth,
) async {
  final result = <MastodonPost>[];
  
  // Extract ThreadViewPost data from the union type
  final threadViewData = view.when(
    threadViewPost: (record) => record,
    notFoundPost: (_) => null,
    blockedPost: (_) => null,
    unknown: (_) => null,
  );
  
  // If this is not a ThreadViewPost, return empty list
  if (threadViewData == null) return result;
  
  // Get the current depth post and add it to the list.
  final currentPost = await MastodonPost.fromBlueSkyPost(threadViewData.post);

  // We don't want to traverse too deep, 6 is just a number I pulled out
  // of thin air. Need to look into how deep Bluesky goes.
  if (depth < 6) {
    final parent = threadViewData.parent;
    if (parent != null) {
      // Extract ThreadViewPost from UThreadViewPostParent
      final parentData = parent.threadViewPost;
      
      if (parentData != null) {
        // Convert to UFeedGetPostThreadThread
        final parentAsThread = UFeedGetPostThreadThread.threadViewPost(
          data: parentData,
        );
        final list = await traverseParents(parentAsThread, depth + 1);
        for (final childPost in list) {
          if (childPost.inReplyToId == null) {
            // We have a dangling reply which means they are replying to
            // this current post. Set the IDs accordingly.
            currentPost
              ..inReplyToAccountId = childPost.account.id
              ..inReplyToId = childPost.id;
          }
          result.add(childPost);
        }
      }
    }
  }
  // Skip the first post.
  if (depth > 0) result.add(currentPost);

  return result;
}

/// Parameter conversion functions.

/// Convert a bool to an int. Used for converting parameter values.
// ignore: avoid_positional_boolean_parameters
String boolToInt(bool? value) => value ?? true ? '1' : '0';

/// Convert a string to an int. Used for converting parameter values.
int stringToInt(String? value) => int.parse(value ?? '0');

/// Convert an int to a string. Used for converting parameter values.
String intToString(int? value) => value?.toString() ?? '0';

/// Convert a string to a bool Used for converting parameter values.
bool stringToBool(String? value) => value == 'true';

/// Convert a bool to a string. Used for converting parameter values.
String boolToString(bool? value) => value?.toString() ?? 'false';

/// Convert a string to a bool. Used for converting parameter values.
bool handleBoolParameter(String? value) {
  return value == '1' || value == 'true' || value == 'on';
}

/// Get the file extension of an image from its bytes.
String? imageBytesToExtension(List<int> bytes) {
  final buffer = bytes is! Uint8List ? Uint8List.fromList(bytes) : bytes;
  final magic = buffer.length >= 2 ? ((buffer[0] << 8) | buffer[1]) : null;

  switch (magic) {
    case 0xFFD8:
      return 'jpeg';
    case 0x8950:
      return 'png';
    default:
      return null;
  }
}

/// Returns a string with all HTML tags removed.
String sanitizeText(String text) {
  final document = parseFragment(text);
  final sanitizedText = document.text;
  return sanitizedText ?? '';
}

/// [Uri.toString] lowercases the host, which breaks the URI
/// for some clients. This is just a simple function that preserves the casing.
String stringifyModifiedUri(Uri uri, String originalUri) {
  final host =
      originalUri.substring(0, uri.scheme.length + uri.host.length + 3);
  return host + uri.toString().substring(host.length);
}

/// Generates pagination headers for a Mastodon feed like a timeline or
/// notifications.
///
/// Ivory (and other Mastodon clients) use two distinct concepts:
/// - [max_id] / [min_id] : Snowflake IDs used internally by the client to
///   deduplicate and order posts in its local cache. These MUST be numeric.
/// - [cursor] : Bluesky's opaque pagination cursor, passed through as-is so
///   that SkyBridge can forward it to the Bluesky API on the next request.
///
/// Mixing the two caused posts to be marked as cached but never displayed:
/// Ivory received a non-numeric Bluesky cursor as [max_id], couldn't match it
/// against any Snowflake, and silently discarded the batch.
Map<String, String> generatePaginationHeaders<T>({
  required List<T> items,
  required Uri requestUri,
  required String nextCursor,
  required BigInt Function(T) getId,
}) {
  if (items.isEmpty) {
    return {};
  }

  return generatePaginationHeadersForIds(
    ids: items.map(getId).toList(),
    requestUri: requestUri,
    nextCursor: nextCursor,
  );
}

/// Same as [generatePaginationHeaders] but takes the boundary Snowflake IDs
/// directly instead of deriving them from a list of items.
///
/// This is used when the response body has been filtered (replies hidden,
/// filters.json, media-only, etc.) and no longer reflects the full range of
/// posts that were actually scanned from Bluesky for this page — using the
/// filtered list's own IDs would anchor `max_id` too high and could cause
/// SkyBridge to re-scan (and re-filter) the same hidden posts on every
/// subsequent page.
Map<String, String> generatePaginationHeadersForIds({
  required List<BigInt> ids,
  required Uri requestUri,
  required String nextCursor,
}) {
  if (ids.isEmpty) {
    return {};
  }

  final highestID = ids.reduce((a, b) => a > b ? a : b);
  final lowestID = ids.reduce((a, b) => a < b ? a : b);

  // prev link: newer items — min_id is the highest Snowflake ID we have.
  final prevParams = Map<String, String>.from(requestUri.queryParameters)
    ..['min_id'] = highestID.toString()
    ..remove('max_id')
    ..remove('cursor');

  // next link: older items.
  // - max_id is always the lowest Snowflake ID scanned for this page so that
  //   Ivory can correctly anchor its cache and avoid showing gaps.
  // - cursor carries the Bluesky opaque cursor so SkyBridge can fetch the
  //   right next page from the Bluesky API without re-deriving the position.
  final nextParams = Map<String, String>.from(requestUri.queryParameters)
    ..remove('min_id')
    ..['max_id'] = lowestID.toString();

  if (nextCursor.isNotEmpty) {
    nextParams['cursor'] = nextCursor;
  } else {
    nextParams.remove('cursor');
  }

  final prevURI = requestUri.replace(queryParameters: prevParams);
  final nextURI = requestUri.replace(queryParameters: nextParams);

  return {'Link': '<$nextURI>; rel="next", <$prevURI>; rel="prev"'};
}

/// The result of [fetchFilteredFeed]: the posts that survived filtering,
/// the Bluesky cursor to continue from, and the Snowflake IDs of *every*
/// post scanned during the fetch (kept or not), for accurate pagination
/// header anchoring.
class FilteredFeedResult {
  const FilteredFeedResult({
    required this.posts,
    required this.cursor,
    required this.scannedIds,
  });

  /// Posts that survived the `keep` predicate passed to [fetchFilteredFeed]
  /// — this is what gets sent back to the client.
  final List<MastodonPost> posts;

  /// The Bluesky opaque cursor to continue fetching from on the next page.
  final String? cursor;

  /// Snowflake IDs of every post scanned in this pass, kept or not.
  final List<BigInt> scannedIds;
}

/// Repeatedly fetches pages of posts via [fetchPage] and resolves parent
/// posts, accumulating only the ones that pass [keep], until at least
/// [targetLimit] posts survive filtering or a safety limit is hit.
///
/// SkyBridge applies Mastodon-side filtering (hidden replies, filters.json,
/// media-only, excluded reblogs, etc.) *after* fetching a fixed-size batch
/// from the Bluesky API. Without over-fetching, a single page can come back
/// almost empty in a Mastodon client like Ivory when a large fraction of the
/// underlying batch gets filtered out — most commonly because Bluesky
/// timelines are reply-heavy and replies are hidden by default.
///
/// [fetchPage] is called with the cursor to fetch from (null for the first
/// page) and must return the raw posts for that page plus the next cursor.
/// [keep] is evaluated on posts that have already had their parent post
/// resolved (`inReplyToId` / `inReplyToAccountId` are populated), so it is
/// safe to use those fields (as [FeedFilters.shouldHide] does).
Future<FilteredFeedResult> fetchFilteredFeed({
  required bsky.Bluesky bluesky,
  required Future<({List<MastodonPost> posts, String? cursor})> Function(
    String? cursor,
  ) fetchPage,
  required bool Function(MastodonPost post) keep,
  required int targetLimit,
  String? initialCursor,
  int maxScanned = 400,
  int minBatchSize = 10,
}) async {
  final kept = <MastodonPost>[];
  final scannedIds = <BigInt>[];
  String? cursor = initialCursor;
  var scanned = 0;

  while (true) {
    final page = await fetchPage(cursor);
    cursor = page.cursor;

    if (page.posts.isEmpty) break;

    final resolved = await processParentPosts(bluesky, page.posts);
    scanned += resolved.length;
    for (final post in resolved) {
      scannedIds.add(BigInt.parse(post.id));
      if (keep(post)) kept.add(post);
    }

    final gotEnough = kept.length >= targetLimit;
    final batchTooSmall = page.posts.length < minBatchSize;
    final noMoreCursor = cursor == null || cursor!.isEmpty;
    final scannedTooMuch = scanned >= maxScanned;

    if (gotEnough || batchTooSmall || noMoreCursor || scannedTooMuch) break;
  }

  return FilteredFeedResult(posts: kept, cursor: cursor, scannedIds: scannedIds);
}
