import 'dart:io';

import 'package:atproto/core.dart' as at;
import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_list.dart';
import 'package:sky_bridge/src/generated/prisma/prisma.dart';
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
        
        print('[DEBUG] Preference type: $typeName');
        
        // Get pinned feeds from V2 (the current version used by Bluesky app)
        if (typeName.contains('SavedFeedsPrefV2')) {
          final pinned = (data as dynamic).pinned as List?;
          if (pinned != null && pinned.isNotEmpty) {
            pinnedFeeds = pinned.cast<at.AtUri>();
            print('[DEBUG] Pinned feeds: ${pinnedFeeds.map((f) => f.toString()).toList()}');
          }
          
          final saved = (data as dynamic).saved as List?;
          if (saved != null && saved.isNotEmpty) {
            savedFeeds = saved.cast<at.AtUri>();
            print('[DEBUG] Saved feeds: ${savedFeeds.map((f) => f.toString()).toList()}');
          }
          
          // Stop after finding V2 preferences
          break;
        }
      } catch (e) {
        print('[DEBUG] Error processing preference: $e');
        continue;
      }
    }

    // Combine pinned and saved feeds, prioritizing pinned
    final allFeeds = <at.AtUri>{...pinnedFeeds, ...savedFeeds}.toList();
    
    print('[DEBUG] Pinned feeds count: ${pinnedFeeds.length}');
    print('[DEBUG] Saved feeds count: ${savedFeeds.length}');
    print('[DEBUG] Total feeds from Bluesky: ${allFeeds.length}');
    for (final feed in allFeeds) {
      print('[DEBUG] Feed URI: ${feed.toString()}');
    }
    
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

      // Get current feed CIDs to track which ones should be kept
      final currentFeedCids = result.map((feed) => feed.cid).toSet();
      
      print('[DEBUG] Current feed CIDs: $currentFeedCids');
      
      // Delete feeds that are no longer in the user's preferences
      final allDbFeeds = await db.feedRecord.findMany();
      print('[DEBUG] Feeds in database: ${allDbFeeds.length}');
      
      for (final dbFeed in allDbFeeds) {
        print('[DEBUG] DB Feed CID: ${dbFeed.cid}, should keep: ${currentFeedCids.contains(dbFeed.cid)}');
        if (dbFeed.cid != null && !currentFeedCids.contains(dbFeed.cid)) {
          print('[DEBUG] Deleting feed with CID: ${dbFeed.cid}');
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
      print('[DEBUG] No feeds in preferences, deleting all from database');
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
