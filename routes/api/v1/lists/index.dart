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
        
        // Get pinned feeds from V2 (the current version used by Bluesky app)
        if (typeName.contains('SavedFeedsPrefV2')) {
          final items = (data as dynamic).items as List?;
          
          if (items != null && items.isNotEmpty) {
            for (final item in items) {
              try {
                final isPinned = (item as dynamic).pinned as bool? ?? false;
                if (!isPinned) continue;
                
                final type = (item as dynamic).type.toString();
                final value = (item as dynamic).value;
                
                // Handle timeline type (e.g., "following")
                if (type.contains('timeline')) {
                  // Skip timeline feeds, we handle "following" separately
                  continue;
                }
                
                // Handle feed and list types
                if (type.contains('feed') || type.contains('list')) {
                  if (value is String) {
                    pinnedFeeds.add(at.AtUri.parse(value));
                  } else if (value is at.AtUri) {
                    pinnedFeeds.add(value);
                  }
                }
              } catch (e) {
                print('[DEBUG] Error processing item: $e');
                continue;
              }
            }
          }
          
          break; // Stop after processing V2
        }
      } catch (e) {
        print('[DEBUG] Error processing preference: $e');
        continue;
      }
    }
    
    // Use pinnedFeeds for both pinned and saved (V2 only uses pinned)
    savedFeeds = pinnedFeeds;

    // Combine pinned and saved feeds, prioritizing pinned
    final allFeeds = <at.AtUri>{...pinnedFeeds, ...savedFeeds}.toList();
    
    // Separate feeds from lists
    final feedUris = <at.AtUri>[];
    final listUris = <at.AtUri>[];
    
    for (final uri in allFeeds) {
      if (uri.toString().contains('app.bsky.graph.list')) {
        listUris.add(uri);
      } else if (uri.toString().contains('app.bsky.feed.generator')) {
        feedUris.add(uri);
      }
    }
    
    print('[DEBUG] Feed generators count: ${feedUris.length}');
    print('[DEBUG] Lists count: ${listUris.length}');
    
    if (feedUris.isNotEmpty || listUris.isNotEmpty) {
      List<dynamic> allItems = [];
      
      // Get feed generators
      if (feedUris.isNotEmpty) {
        final feedResult = await chunkResults(
          items: feedUris,
          callback: (chunk) async {
            final response = await bluesky.feed.getFeedGenerators(
              feeds: chunk,
            );
            return response.data.feeds;
          },
        );
        allItems.addAll(feedResult);
      }
      
      // Get lists
      if (listUris.isNotEmpty) {
        for (final listUri in listUris) {
          try {
            final listResponse = await bluesky.graph.getList(
              list: listUri,
            );
            allItems.add(listResponse.data.list);
          } catch (e) {
            print('[DEBUG] Error fetching list $listUri: $e');
          }
        }
      }

      // Get current feed/list CIDs to track which ones should be kept
      final currentCids = allItems.map((item) => (item as dynamic).cid).toSet();
      
      print('[DEBUG] Current CIDs: $currentCids');
      
      // Delete feeds that are no longer in the user's preferences
      final allDbFeeds = await db.feedRecord.findMany();
      print('[DEBUG] Feeds in database: ${allDbFeeds.length}');
      
      for (final dbFeed in allDbFeeds) {
        print('[DEBUG] DB Feed CID: ${dbFeed.cid}, should keep: ${currentCids.contains(dbFeed.cid)}');
        if (dbFeed.cid != null && !currentCids.contains(dbFeed.cid)) {
          print('[DEBUG] Deleting feed with CID: ${dbFeed.cid}');
          await db.feedRecord.delete(
            where: FeedRecordWhereUniqueInput(id: dbFeed.id),
          );
        }
      }

      // Convert items to MastodonList
      final userLists = await databaseTransaction(() async {
        final listFutures = <Future<MastodonList>>[];
        
        for (final item in allItems) {
          // Check if it's a feed generator or a list
          final itemType = (item as dynamic).runtimeType.toString();
          if (itemType.contains('GeneratorView')) {
            listFutures.add(MastodonList.fromFeedGenerator(item));
          } else if (itemType.contains('ListView')) {
            listFutures.add(MastodonList.fromListView(item));
          }
        }
        
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
