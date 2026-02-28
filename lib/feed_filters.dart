import 'dart:convert';
import 'dart:io';

import 'package:sky_bridge/models/mastodon/mastodon_post.dart';

/// Path to the filters configuration file.
/// Place this file at the root of your Skybridge installation.
const _filtersPath = 'filters.json';

/// Cached filters to avoid re-reading the file on every request.
/// The cache is invalidated when the file modification time changes.
DateTime? _lastModified;
FeedFilters? _cachedFilters;

/// Loads and returns the current [FeedFilters] from [_filtersPath].
/// The file is re-read automatically whenever it changes on disk.
/// If the file does not exist, returns empty (no-op) filters.
FeedFilters loadFeedFilters() {
  final file = File(_filtersPath);

  if (!file.existsSync()) {
    return const FeedFilters();
  }

  final modified = file.lastModifiedSync();
  if (_cachedFilters != null && _lastModified == modified) {
    return _cachedFilters!;
  }

  try {
    final content = file.readAsStringSync();
    final json = jsonDecode(content) as Map<String, dynamic>;
    _cachedFilters = FeedFilters.fromJson(json);
    _lastModified = modified;
    print('[FeedFilters] Loaded filters from $_filtersPath');
    return _cachedFilters!;
  } catch (e) {
    print('[FeedFilters] Error reading $_filtersPath: $e');
    return const FeedFilters();
  }
}

/// Represents the content of filters.json.
///
/// Example filters.json:
/// ```json
/// {
///   "hide_replies_from": ["somehandle.bsky.social", "did:plc:abc123"],
///   "hide_keywords": ["mot1", "mot2"],
///   "hide_reposts_from": ["spammer.bsky.social"]
/// }
/// ```
class FeedFilters {
  const FeedFilters({
    this.hideRepliesFrom = const [],
    this.hideKeywords = const [],
    this.hideRepostsFrom = const [],
  });

  factory FeedFilters.fromJson(Map<String, dynamic> json) {
    List<String> parseList(String key) {
      final raw = json[key];
      if (raw == null) return const [];
      return (raw as List<dynamic>)
          .map((e) => (e as String).toLowerCase().trim())
          .toList();
    }

    return FeedFilters(
      hideRepliesFrom: parseList('hide_replies_from'),
      hideKeywords: parseList('hide_keywords'),
      hideRepostsFrom: parseList('hide_reposts_from'),
    );
  }

  /// Accounts (handle or DID) whose replies should be hidden.
  final List<String> hideRepliesFrom;

  /// Keywords: any post whose content contains one of these strings is hidden.
  final List<String> hideKeywords;

  /// Accounts (handle or DID) whose reposts should be hidden.
  final List<String> hideRepostsFrom;

  /// Returns true if this post should be removed from the feed.
  bool shouldHide(MastodonPost post) {
    // --- Keyword filter (applies to all posts) ---
    if (hideKeywords.isNotEmpty) {
      final contentLower = _stripHtml(post.content).toLowerCase();
      if (hideKeywords.any((kw) => contentLower.contains(kw))) return true;
    }

    // --- Reply filter ---
    if (post.inReplyToId != null && hideRepliesFrom.isNotEmpty) {
      if (_accountMatches(post.account, hideRepliesFrom)) return true;
    }

    // --- Repost filter ---
    if (post.reblog != null && hideRepostsFrom.isNotEmpty) {
      if (_accountMatches(post.account, hideRepostsFrom)) return true;
    }

    return false;
  }

  bool _accountMatches(dynamic account, List<String> targets) {
    final id = (account.id as String? ?? '').toLowerCase();
    final acct = (account.acct as String? ?? '').toLowerCase();
    final username = (account.username as String? ?? '').toLowerCase();
    return targets.contains(id) ||
        targets.contains(acct) ||
        targets.contains(username);
  }

  /// Very basic HTML tag stripper for keyword matching.
  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), ' ');
  }
}
