import 'package:atproto/core.dart' as atp;
import 'package:bluesky/app_bsky_actor_defs.dart' show ActorProfile;
import 'package:bluesky/app_bsky_feed_post.dart' show PostRecord;
import 'package:bluesky/bluesky.dart' as bsky;
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

part 'mastodon_notification.g.dart';

/// Represents a notification of an event relevant to the user.
@JsonSerializable()
class MastodonNotification {
  /// Constructs an instance of [MastodonNotification].
  MastodonNotification({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.account,
    this.status,
  });

  /// Converts JSON into a [MastodonNotification] instance.
  factory MastodonNotification.fromJson(Map<String, dynamic> json) =>
      _$MastodonNotificationFromJson(json);

  /// Converts the [MastodonNotification] to JSON.
  Map<String, dynamic> toJson() => _$MastodonNotificationToJson(this);

  /// Takes a list of [bsky.Notification]s and converts them to a list of
  /// [MastodonNotification]s with the appropriate post data attached.
  ///
  /// DO NOT execute in a [db] transaction, this is handled internally.
  static Future<List<MastodonNotification>> fromNotificationList(
    List<bsky.Notification> notifs,
    bsky.Bluesky bluesky,
  ) async {
    final pairs = <bsky.Notification, atp.AtUri?>{};
    final postUris = <atp.AtUri>[];

    // Find the appropriate record for each notification.
    for (final notification in notifs) {
      try {
        final unknownRecord = notification.record ?? {};

        switch (notification.reason.name) {
          case 'repost':
          case 'like':
            final subject = unknownRecord['subject'] as Map<String, dynamic>?;
            if (subject != null) {
              final uriString = subject['uri'] as String?;
              if (uriString != null) {
                final uri = atp.AtUri.parse(uriString);
                pairs[notification] = uri;
                if (!postUris.contains(uri)) postUris.add(uri);
              } else {
                pairs[notification] = null;
              }
            } else {
              pairs[notification] = null;
            }

          case 'reply':
            final uri = notification.uri;
            pairs[notification] = uri;
            if (!postUris.contains(uri)) postUris.add(uri);
            try {
              final record = PostRecord.fromJson(unknownRecord);
              final reply = record.reply;
              if (reply != null) {
                if (!postUris.contains(reply.parent.uri)) {
                  postUris.add(reply.parent.uri);
                }
              }
            } catch (_) {}

          case 'quote':
            final uri = notification.uri;
            pairs[notification] = uri;
            if (!postUris.contains(uri)) postUris.add(uri);

          case 'mention':
            final uri = notification.uri;
            pairs[notification] = uri;
            if (!postUris.contains(uri)) postUris.add(uri);

          case 'follow':
            pairs[notification] = null;

          default:
            pairs[notification] = null;
        }
      } catch (e) {
        // If we can't parse a notification's record, skip its post but keep it.
        print('Notifications: skipping URI parse for ${notification.cid} — $e');
        pairs[notification] = null;
      }
    }

    // Fetch all required posts in efficient chunks.
    final posts = await chunkResults<bsky.Post, atp.AtUri>(
      items: postUris,
      callback: (chunk) async {
        try {
          final response = await bluesky.feed.getPosts(uris: chunk);
          return response.data.posts;
        } catch (e) {
          print('Notifications: getPosts chunk failed — $e');
          return [];
        }
      },
    );

    // Convert posts to Mastodon format, one by one with isolation.
    final mastodonPosts = <MastodonPost>[];
    for (final post in posts) {
      try {
        mastodonPosts.add(await MastodonPost.fromBlueSkyPost(post));
      } catch (e) {
        print('Notifications: skipping post conversion ${post.uri} — $e');
      }
    }

    // Resolve parent posts for replies.
    final processedPosts = await processParentPosts(bluesky, mastodonPosts);

    // Build each notification individually, skipping failures.
    final notifications = <MastodonNotification>[];

    for (final entry in pairs.entries) {
      final notification = entry.key;
      final uri = entry.value;
      try {
        final record = await databaseTransaction(
          () => notificationToDatabase(notification),
        );

        final post = uri != null
            ? processedPosts.firstWhereOrNull(
                (p) => p.bskyUri.toString() == uri.toString(),
              )
            : null;

        final type = NotificationType.fromBluesky(notification.reason.name);

        notifications.add(
          MastodonNotification(
            id: record.id.toString(),
            type: type,
            createdAt: notification.indexedAt.toUtc(),
            account: await MastodonAccount.fromActor(notification.author),
            status: post,
          ),
        );
      } catch (e) {
        print('Notifications: skipping notification ${notification.cid} — $e');
      }
    }

    // Sort newest-first.
    notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return notifications;
  }

  /// The id of the notification in the database.
  final String id;

  /// The type of event that resulted in a notification.
  final NotificationType type;

  /// The timestamp of the notification.
  @JsonKey(
    name: 'created_at',
    fromJson: dateTimeFromISO8601,
    toJson: dateTimeToISO8601,
  )
  final DateTime createdAt;

  /// The account that performed the action that generated the notification.
  final MastodonAccount account;

  /// [MastodonPost] that was the object of the notification.
  final MastodonPost? status;
}

/// The type of event that resulted in a notification.
enum NotificationType {
  /// Someone mentioned you in their status.
  @JsonValue('mention')
  mention,

  /// Someone you enable notifications for has created a post.
  @JsonValue('status')
  status,

  /// Someone reposted one of your statuses.
  @JsonValue('reblog')
  reblog,

  /// Someone followed you.
  @JsonValue('follow')
  follow,

  /// Someone requested to follow you.
  @JsonValue('follow_request')
  followRequest,

  /// Someone liked one of your posts.
  @JsonValue('favourite')
  favourite,

  /// A poll you have voted in or created has ended.
  @JsonValue('poll')
  poll,

  /// A post you interacted with has been edited.
  @JsonValue('update')
  update,

  /// Someone signed up (optionally sent to admins).
  @JsonValue('admin.sign_up')
  adminSignUp,

  /// A new report has been filed.
  @JsonValue('admin.report')
  adminReport;

  /// Maps Bluesky notification reason names to [NotificationType].
  static final _typeMap = {
    'like': NotificationType.favourite,
    'repost': NotificationType.reblog,
    'follow': NotificationType.follow,
    'reply': NotificationType.mention,
    'quote': NotificationType.mention,
    'mention': NotificationType.mention,
    'starterpack-joined': NotificationType.follow,
  };

  /// Types of notifications that have posts attached.
  static final typesThatHavePosts = [
    NotificationType.favourite,
    NotificationType.reblog,
    NotificationType.mention,
    NotificationType.poll,
    NotificationType.update,
  ];

  /// Whether or not the notification has a post attached.
  bool get hasPost => typesThatHavePosts.contains(this);

  /// Converts a Bluesky notification type to a [NotificationType].
  static NotificationType fromBluesky(String name) =>
      _typeMap[name] ?? NotificationType.mention;
}
