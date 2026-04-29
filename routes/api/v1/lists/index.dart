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

    // Add special built-in feeds that map to Mastodon's Local and Federated timelines
    // Fetch the feed generators to get the actual display names from Bluesky
    try {
      const followingUri = 'at://did:plc:z72i7hdynmk6r22z27h6tvur/app.bsky.feed.generator/following';
      const discoverUri = 'at://did:plc:z72i7hdynmk6r22z27h6tvur/app.bsky.feed.generator/whats-hot';
      
      final feedsResponse = await bluesky.feed.getFeedGenerators(
        feeds: [
          at.AtUri.parse(followingUri),
          at.AtUri.parse(discoverUri),
        ],
      );
      
      // Map feeds to their IDs
      final feedMap = {
        followingUri: 'local',
        discoverUri: 'federated',
      };
      
      for (final feed in feedsResponse.data.feeds) {
        final feedId = feedMap[feed.uri.toString()];
        if (feedId != null) {
          lists.add(MastodonList(
            id: feedId,
            title: feed.displayName,
            repliesPolicy: RepliesPolicy.list,
          ));
        }
      }
    } catch (e) {
      // Fallback to hardcoded names if API call fails
      lists.addAll([
        MastodonList(
          id: 'local',
          title: 'Following',
          repliesPolicy: RepliesPolicy.list,
        ),
        MastodonList(
          id: 'federated',
          title: 'Discover',
          repliesPolicy: RepliesPolicy.list,
        ),
      ]);
    }

    // Get saved feeds from the user's preferences.
    final response = await bluesky.actor.getPreferences();
    for (final preference in response.data.preferences) {
      // Check if this preference has savedUris property (SavedFeeds type)
      try {
        final data = preference.data;
        // Use reflection/dynamic access to check for savedUris
        if (data.runtimeType.toString().contains('SavedFeeds')) {
          // Access savedUris dynamically
          final feedUris = (data as dynamic).savedUris as List;
          if (feedUris.isEmpty) continue;
          
          // Get the feed generator views for each saved feed, giving us info
          // like the name of the feed and the accompanying IDs.
          final result = await chunkResults(
            items: feedUris.cast<at.AtUri>(),
            callback: (chunk) async {
              final response = await bluesky.feed.getFeedGenerators(
                feeds: chunk,
              );
              return response.data.feeds;
            },
          );

          // Convert the feed generator views to [MastodonList]'s, storing
          // any info in the database we might need to access later.
          final userLists = await databaseTransaction(() async {
            final listFutures = result.map(
              MastodonList.fromFeedGenerator,
            ).cast<Future<MastodonList>>();
            return Future.wait(listFutures);
          }) as List<MastodonList>;
          
          lists.addAll(userLists);
        }
      } catch (e) {
        // Skip preferences that don't match
        continue;
      }
    }

    return threadedJsonResponse(
      body: lists,
    );
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
