import 'dart:convert';
import 'dart:typed_data';

import 'package:atproto/core.dart' as atp;
import 'package:bluesky/app_bsky_actor_defs.dart';
import 'package:bluesky/app_bsky_embed_record.dart';
import 'package:bluesky/app_bsky_feed_defs.dart';
import 'package:bluesky/app_bsky_notification_listnotifications.dart';
import 'package:crypto/crypto.dart';
import 'package:orm/orm.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/src/generated/prisma/client.dart';
import 'package:sky_bridge/src/generated/prisma/prisma.dart';
import 'package:sky_bridge/src/generated/prisma/model.dart';

/// Global Isar database instance. Initialized in main.dart on startup.
/// Used to store 64-bit integer IDs for posts and accounts.
late final PrismaClient db;

/// Wrapper to execute a callback in a database transaction.
/// For now this does nothing and is a remnant of the now defunct
/// Isar database implementation.
Future<T> databaseTransaction<T>(Future<T> Function() callback) async {
  return callback();
}

/// The type of record with a unique index to generate a Snowflake ID for.
enum RecordType {
  /// A post.
  post(0),

  /// A repost.
  repost(1),

  /// A notification.
  notification(2),

  /// A media attachment.
  media(3),

  /// A feed.
  feed(4);

  const RecordType(this.value);

  /// The unique index for this record type.
  final int value;
}

/// Generates a 64bit time-sortable ID similar to Twitter/Mastodon's Snowflake
/// IDs. This is used to generate unique IDs for various records.
BigInt generateSnowflake({
  required DateTime date,
  required int workerId,
  required int sequence,
}) {
  final epoch = DateTime(2010).millisecondsSinceEpoch;
  final timestamp = date.millisecondsSinceEpoch - epoch;

  // 42 bits for time in milliseconds
  // 5 bits for a worker id (gives us up to 32 workers)
  // 5 bits for a custom value (0 in our case)
  // 12 bits for an auto-incrementing sequence
  var id = timestamp << 22;
  id |= workerId << 17;
  id |= 0 << 12;
  id |= sequence;

  return BigInt.from(id);
}

/// Generates a *unique* 64bit time-sortable ID similar to Twitter/Mastodon's
/// Snowflake IDs. This is used to generate unique IDs for various records.
Future<BigInt> generateUniqueSnowflake<T>({
  required Future<T?> Function(BigInt id) checkCallback,
  required DateTime date,
  required RecordType recordType,
}) async {
  var sequence = 0;
  while (sequence < 1024) {
    final id = generateSnowflake(
      date: date,
      workerId: recordType.value,
      sequence: sequence,
    );
    final existing = await checkCallback(id);
    if (existing != null) {
      sequence++;
    } else {
      return id;
    }
  }
  throw Exception('Failed to generate unique Snowflake ID, tried 1024 times.');
}

/// Checks if a post has been assigned a [PostRecord], and if not, gives
/// it one. Either the existing or the newly created [PostRecord] is returned.
Future<PostRecord> postToDatabase(PostView post) async {
  final existing = await db.postRecord.findUnique(
    where: PostRecordWhereUniqueInput(cid: post.cid),
  );
  if (existing == null) {
    final id = await generateUniqueSnowflake(
      date: post.indexedAt,
      recordType: RecordType.post,
      checkCallback: (id) => db.postRecord.findUnique(
        where: PostRecordWhereUniqueInput(id: id),
      ),
    );
    return db.postRecord.upsert(
      where: PostRecordWhereUniqueInput(cid: post.cid),
      create: PrismaUnion.$1(PostRecordCreateInput(
        id: id,
        cid: post.cid,
        uri: post.uri.toString(),
        authorDid: post.author.did,
      )),
      update: PrismaUnion.$1(const PostRecordUpdateInput()),
    );
  } else {
    return existing;
  }
}

/// Checks if a embed post has been assigned a [PostRecord], and if not, gives
/// it one. Either the existing or the newly created [PostRecord] is returned.
Future<PostRecord?> embedPostToDatabase(UEmbedRecordViewRecord view) async {
  return await view.when(
    embedRecordViewRecord: (record) async {
      final existing = await db.postRecord.findUnique(
        where: PostRecordWhereUniqueInput(cid: record.cid),
      );
      if (existing == null) {
        final id = await generateUniqueSnowflake(
          date: record.indexedAt,
          recordType: RecordType.post,
          checkCallback: (id) => db.postRecord.findUnique(
            where: PostRecordWhereUniqueInput(id: id),
          ),
        );
        return db.postRecord.upsert(
          where: PostRecordWhereUniqueInput(cid: record.cid),
          create: PrismaUnion.$1(PostRecordCreateInput(
            id: id,
            cid: record.cid,
            uri: record.uri.toString(),
            authorDid: record.author.did,
          )),
          update: PrismaUnion.$1(const PostRecordUpdateInput()),
        );
      } else {
        return existing;
      }
    },
    embedRecordViewNotFound: (_) => null,
    embedRecordViewBlocked: (_) => null,
    embedRecordViewDetached: (_) => null,
    generatorView: (_) => null,
    listView: (_) => null,
    labelerView: (_) => null,
    starterPackViewBasic: (_) => null,
    unknown: (_) => null,
  );
}

/// Checks if a repost has been assigned a [RepostRecord], and if not, gives
/// it one. Either the existing or the newly created [RepostRecord] is returned.
Future<RepostRecord> repostToDatabase(FeedViewPost view) async {
  final repostData = view.reason?.when(
    reasonRepost: (repost) => repost,
    reasonPin: (_) => null,
    unknown: (_) => null,
  );
  final isRepost = repostData != null;
  if (!isRepost) {
    throw ArgumentError('FeedView is not a repost');
  }

  final original = await db.postRecord.findUnique(
    where: PostRecordWhereUniqueInput(cid: view.post.cid),
  );

  if (original == null) {
    throw ArgumentError('Original post not found in database!');
  }

  final reposterDid = repostData.by.did;
  return original.repost(repostData.indexedAt, reposterDid);
}

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> actorToDatabase(ProfileView actor) async {
  final existing = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(did: actor.did),
  );
  if (existing == null) {
    final id = hashBlueskyToId(actor.did);
    return db.userRecord.upsert(
      where: UserRecordWhereUniqueInput(did: actor.did),
      create: PrismaUnion.$1(UserRecordCreateInput(id: id, did: actor.did)),
      update: PrismaUnion.$1(const UserRecordUpdateInput()),
    );
  } else {
    return existing;
  }
}

/// Checks if a ProfileViewBasic has been assigned a [UserRecord].
Future<UserRecord> actorBasicToDatabase(ProfileViewBasic actor) async {
  final existing = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(did: actor.did),
  );
  if (existing == null) {
    final id = hashBlueskyToId(actor.did);
    return db.userRecord.upsert(
      where: UserRecordWhereUniqueInput(did: actor.did),
      create: PrismaUnion.$1(UserRecordCreateInput(id: id, did: actor.did)),
      update: PrismaUnion.$1(const UserRecordUpdateInput()),
    );
  } else {
    return existing;
  }
}

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> actorProfileToDatabase(ProfileViewDetailed actor) async {
  final existing = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(did: actor.did),
  );
  if (existing == null) {
    final id = hashBlueskyToId(actor.did);
    final info = await ProfileInfo.fromActorProfile(actor);
    return db.userRecord.upsert(
      where: UserRecordWhereUniqueInput(did: actor.did),
      create: PrismaUnion.$1(UserRecordCreateInput(
        id: id,
        did: actor.did,
        banner: info.banner,
        followsCount: info.followsCount,
        followersCount: info.followersCount,
        postsCount: info.postsCount,
        description: info.description,
      )),
      update: PrismaUnion.$1(const UserRecordUpdateInput()),
    );
  } else {
    await db.userRecord.update(
      where: UserRecordWhereUniqueInput(did: actor.did),
      data: PrismaUnion.$1(UserRecordUpdateInput(
        banner: PrismaUnion.$2(StringFieldUpdateOperationsInput(set: actor.banner ?? '')),
        followsCount: PrismaUnion.$2(IntFieldUpdateOperationsInput(set: actor.followsCount)),
        followersCount: PrismaUnion.$2(IntFieldUpdateOperationsInput(set: actor.followersCount)),
        postsCount: PrismaUnion.$2(IntFieldUpdateOperationsInput(set: actor.postsCount)),
        description: PrismaUnion.$2(StringFieldUpdateOperationsInput(
          set: actor.description ?? '',
        )),
      )),
    );
    return existing;
  }
}

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> didToDatabase(String did) async {
  final existing = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(did: did),
  );
  if (existing == null) {
    final id = hashBlueskyToId(did);
    return db.userRecord.upsert(
      where: UserRecordWhereUniqueInput(did: did),
      create: PrismaUnion.$1(UserRecordCreateInput(id: id, did: did)),
      update: PrismaUnion.$1(const UserRecordUpdateInput()),
    );
  } else {
    return existing;
  }
}

/// Checks if a notification has been assigned a [NotificationRecord],
/// and if not, gives it one.
Future<NotificationRecord> notificationToDatabase(
  Notification notification,
) async {
  final existing = await db.notificationRecord.findFirst(
    where: NotificationRecordWhereInput(
      cid: PrismaUnion.$1(StringFilter(equals: PrismaUnion.$1(notification.cid))),
    ),
  );
  if (existing == null) {
    final id = await generateUniqueSnowflake(
      date: notification.indexedAt,
      recordType: RecordType.notification,
      checkCallback: (id) => db.notificationRecord.findUnique(
        where: NotificationRecordWhereUniqueInput(id: id),
      ),
    );
    final data = NotificationRecordCreateInput(
      id: id,
      cid: notification.cid,
      uri: notification.uri.toString(),
    );
    return db.notificationRecord.create(data: PrismaUnion.$1(data));
  } else {
    return existing;
  }
}

/// Checks if a feed has been assigned a [FeedRecord], and if not, gives
/// it one. Either the existing or the newly created [FeedRecord] is returned.
Future<FeedRecord> feedToDatabase(GeneratorView feed) async {
  final existing = await db.feedRecord.findFirst(
    where: FeedRecordWhereInput(
      cid: PrismaUnion.$1(StringFilter(equals: PrismaUnion.$1(feed.cid))),
    ),
  );
  if (existing == null) {
    final id = await generateUniqueSnowflake(
      date: feed.indexedAt,
      recordType: RecordType.feed,
      checkCallback: (id) => db.feedRecord.findUnique(
        where: FeedRecordWhereUniqueInput(id: id),
      ),
    );
    final data = FeedRecordCreateInput(
      id: id,
      cid: feed.cid,
      uri: feed.uri.toString(),
      authorDid: feed.did != null ? PrismaUnion.$1(feed.did!) : PrismaUnion.$2(PrismaNull()),
    );
    return await db.feedRecord.create(data: PrismaUnion.$1(data));
  } else {
    return existing;
  }
}

/// Constructs a SHA256 hash of the reposter's DID and the original post's CID.
String constructRepostHash(String reposterDid, String cid) {
  return sha256.convert(utf8.encode(reposterDid + cid)).toString();
}

/// Hash the DID and use the first 64 bits as the ID.
BigInt hashBlueskyToId(String bskyId) {
  final hashBytes = sha256.convert(utf8.encode(bskyId)).bytes;
  final hashUint8List = Uint8List.fromList(hashBytes);
  final hashData = ByteData.view(hashUint8List.buffer);
  final id = hashData.getUint64(0) & 0x7fffffffffffffff;
  return BigInt.from(id);
}

/// Extension on [PostRecord] to add a [repost] method.
extension RepostExtension on PostRecord {
  Future<RepostRecord> repost(DateTime createdAt, String reposterDid) async {
    final hash = constructRepostHash(reposterDid, cid!);
    final existing = await db.repostRecord.findUnique(
      where: RepostRecordWhereUniqueInput(hashId: hash),
    );
    if (existing != null) return existing;

    final id = await generateUniqueSnowflake(
      date: createdAt,
      recordType: RecordType.repost,
      checkCallback: (id) => db.repostRecord.findUnique(
        where: RepostRecordWhereUniqueInput(id: id),
      ),
    );
    return db.repostRecord.upsert(
      where: RepostRecordWhereUniqueInput(hashId: hash),
      create: PrismaUnion.$1(RepostRecordCreateInput(
        id: id,
        hashId: hash,
        originalPost: PostRecordCreateNestedOneWithoutRepostsInput(
          connect: PostRecordWhereUniqueInput(cid: cid)),
        ),
      ),
      update: PrismaUnion.$1(const RepostRecordUpdateInput()),
    );
  }
}

/// Extension methods for [MediaRecord] that convert back and forth between
/// [MediaRecord] and [atp.Blob].
extension BlobExtension on MediaRecord {
  static Future<MediaRecord> fromBlob(
    atp.Blob blob,
    String description, {
    String type = 'image',
  }) async {
    final id = await generateUniqueSnowflake(
      date: DateTime.now().toUtc(),
      recordType: RecordType.media,
      checkCallback: (id) => db.mediaRecord.findUnique(
        where: MediaRecordWhereUniqueInput(id: id),
      ),
    );
    return db.mediaRecord.create(
      data: PrismaUnion.$1(MediaRecordCreateInput(
        id: id,
        type: type,
        mimeType: blob.mimeType ?? '',
        size: blob.size,
        link: blob.ref.link ?? '',
        description: description,
      )),
    );
  }

  atp.Blob toBlob() {
    return atp.Blob(
      mimeType: mimeType ?? '',
      size: size ?? 0,
      ref: atp.BlobRef(link: link ?? ''),
    );
  }
}
