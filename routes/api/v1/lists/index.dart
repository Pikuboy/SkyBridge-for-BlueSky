import 'dart:io';

import 'package:atproto/core.dart' as at;
import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_list.dart';
import 'package:sky_bridge/util.dart';

/// Create a new list.
/// This is used to create custom feed entries in Bluesky's case.
/// GET /api/v1/lists HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/lists/#get
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.get) {
    // Get a bluesky connection/session from the a provided bearer token.
    // If the token is invalid, bail out and return an error.
    final bluesky = await blueskyFromContext(context);
    if (bluesky == null) return authError();

    var lists = <MastodonList>[];

    // Add "Following" timeline (maps to Mastodon's Local timeline)
    lists.add(MastodonList(
      id: 'following',
      title: 'Following',
      repliesPolicy: RepliesPolicy.list,
    ));

    // Get saved/pinned feeds from the user's preferences.
    final response = await bluesky.actor.getPreferences();
    
    List<at.AtUri> pinnedFeeds = [];
    List<at.AtUri> savedFeeds = [];
    
    for (final preference in response.data.preferences) {
      try {
        final data = preference.data;
        final typeName = data.runtimeType.toString();
        
        // Get pinned feeds
        if (typeName.contains('SavedFeedsPref')) {
          final pinned = (data as dynamic).pinned as List?;
          if (pinned != null && pinned.isNotEmpty) {
            pinnedFeeds = pinned.cast<at.AtUri>();
          }
          
          final saved = (data as dynamic).saved as List?;
          if (saved != null && saved.isNotEmpty) {
            savedFeeds = saved.cast<at.AtUri>();
          }
        }
      } catch (e) {
        continue;
      }
    }

    // Combine pinned and saved feeds, prioritizing pinned
    final allFeeds = <at.AtUri>{...pinnedFeeds, ...savedFeeds}.toList();
    
    if (allFeeds.isNotEmpty) {
      // Get the feed generator views for each feed
      final result = await chunkResults(
        items: allFeeds,
        callback: (chunk) async {
          final response = await bluesky.feed.getFeedGenerators(
            feeds: chunk,
          );
          return response.data.feeds;
        },
      );

      // Get current feed URIs to track which ones are still active
      final currentFeedUris = result.map((feed) => feed.uri.toString()).toSet();

      // Delete feeds that are no longer in the user's preferences
      final allDbFeeds = await db.feedRecord.findMany();
      for (final dbFeed in allDbFeeds) {
        if (dbFeed.uri != null && !currentFeedUris.contains(dbFeed.uri)) {
          await db.feedRecord.delete(
            where: FeedRecordWhereUniqueInput(id: dbFeed.id),
          );
        }
      }

      // Convert the feed generator views to [MastodonList]'s
      final userLists = await databaseTransaction(() async {
        final listFutures = result.map(
          MastodonList.fromFeedGenerator,
        ).cast<Future<MastodonList>>();
        return Future.wait(listFutures);
      }) as List<MastodonList>;
      
      lists.addAll(userLists);
    } else {
      // No feeds in preferences, delete all feeds from database
      await db.feedRecord.deleteMany(where: const FeedRecordWhereInput());
    }

    return threadedJsonResponse(
      body: lists,
    );
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
