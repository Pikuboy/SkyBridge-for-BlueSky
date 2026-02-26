// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'model.dart' as _i1;
import 'prisma.dart' as _i2;

class UserRecord {
  const UserRecord({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecord.fromJson(Map json) => UserRecord(
    id: json['id'],
    did: json['did'],
    banner: json['banner'],
    followersCount: json['followers_count'],
    followsCount: json['follows_count'],
    postsCount: json['posts_count'],
    description: json['description'],
  );

  final BigInt? id;

  final String? did;

  final String? banner;

  final int? followersCount;

  final int? followsCount;

  final int? postsCount;

  final String? description;

  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
  };
}

class RepostRecord {
  const RepostRecord({
    this.id,
    this.hashId,
    this.originalPostId,
    this.originalPost,
  });

  factory RepostRecord.fromJson(Map json) => RepostRecord(
    id: json['id'],
    hashId: json['hash_id'],
    originalPostId: json['original_post_id'],
    originalPost: json['original_post'] is Map
        ? _i1.PostRecord.fromJson(json['original_post'])
        : null,
  );

  final BigInt? id;

  final String? hashId;

  final BigInt? originalPostId;

  final _i1.PostRecord? originalPost;

  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    'original_post': originalPost?.toJson(),
  };
}

class PostRecord {
  const PostRecord({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
    this.$count,
  });

  factory PostRecord.fromJson(Map json) => PostRecord(
    id: json['id'],
    cid: json['cid'],
    uri: json['uri'],
    authorDid: json['author_did'],
    reposts: (json['reposts'] as Iterable?)?.map(
      (json) => _i1.RepostRecord.fromJson(json),
    ),
    $count: json['_count'] is Map
        ? _i2.PostRecordCountOutputType.fromJson(json['_count'])
        : null,
  );

  final BigInt? id;

  final String? cid;

  final String? uri;

  final String? authorDid;

  final Iterable<_i1.RepostRecord>? reposts;

  final _i2.PostRecordCountOutputType? $count;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts?.map((e) => e.toJson()),
    '_count': $count?.toJson(),
  };
}

class NotificationRecord {
  const NotificationRecord({this.id, this.cid, this.uri});

  factory NotificationRecord.fromJson(Map json) =>
      NotificationRecord(id: json['id'], cid: json['cid'], uri: json['uri']);

  final BigInt? id;

  final String? cid;

  final String? uri;

  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class MediaRecord {
  const MediaRecord({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecord.fromJson(Map json) => MediaRecord(
    id: json['id'],
    type: json['type'],
    mimeType: json['mime_type'],
    size: json['size'],
    link: json['link'],
    description: json['description'],
  );

  final BigInt? id;

  final String? type;

  final String? mimeType;

  final int? size;

  final String? link;

  final String? description;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class FeedRecord {
  const FeedRecord({this.id, this.cid, this.uri, this.authorDid});

  factory FeedRecord.fromJson(Map json) => FeedRecord(
    id: json['id'],
    cid: json['cid'],
    uri: json['uri'],
    authorDid: json['author_did'],
  );

  final BigInt? id;

  final String? cid;

  final String? uri;

  final String? authorDid;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class SessionRecord {
  const SessionRecord({this.id, this.did, this.session, this.pdsUrl});

  factory SessionRecord.fromJson(Map json) => SessionRecord(
    id: json['id'],
    did: json['did'],
    session: json['session'],
    pdsUrl: json['pds_url'],
  );

  final int? id;

  final String? did;

  final String? session;

  final String? pdsUrl;

  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class AuthRateLimit {
  const AuthRateLimit({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  factory AuthRateLimit.fromJson(Map json) => AuthRateLimit(
    id: json['id'],
    ipAddress: json['ip_address'],
    attempts: json['attempts'],
    lastAttempt: switch (json['last_attempt']) {
      DateTime value => value,
      String value => DateTime.parse(value),
      _ => json['last_attempt'],
    },
  );

  final int? id;

  final String? ipAddress;

  final int? attempts;

  final DateTime? lastAttempt;

  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt?.toIso8601String(),
  };
}
