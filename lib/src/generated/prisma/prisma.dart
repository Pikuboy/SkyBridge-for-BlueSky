// ignore_for_file: argument_type_not_assignable, not_enough_positional_arguments
// ignore_for_file: non_constant_identifier_names

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:orm/orm.dart' as _i1;

import 'prisma.dart' as _i2;

class NestedBigIntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedBigIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? equals;

  final Iterable<BigInt>? $in;

  final Iterable<BigInt>? notIn;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? lt;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? lte;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? gt;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? gte;

  final _i1.PrismaUnion<BigInt, _i2.NestedBigIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class BigIntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const BigIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? equals;

  final Iterable<BigInt>? $in;

  final Iterable<BigInt>? notIn;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? lt;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? lte;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? gt;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? gte;

  final _i1.PrismaUnion<BigInt, _i2.NestedBigIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class NestedStringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
  };
}

class StringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
  };
}

class NestedIntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class IntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class UserRecordWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i1.PrismaUnion<
    _i2.UserRecordWhereInput,
    Iterable<_i2.UserRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.UserRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.UserRecordWhereInput,
    Iterable<_i2.UserRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? did;

  final _i1.PrismaUnion<_i2.StringFilter, String>? banner;

  final _i1.PrismaUnion<_i2.IntFilter, int>? followersCount;

  final _i1.PrismaUnion<_i2.IntFilter, int>? followsCount;

  final _i1.PrismaUnion<_i2.IntFilter, int>? postsCount;

  final _i1.PrismaUnion<_i2.StringFilter, String>? description;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'did': did,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
  };
}

class UserRecordWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordWhereUniqueInput({
    this.id,
    this.did,
    this.AND,
    this.OR,
    this.NOT,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final BigInt? id;

  final String? did;

  final _i1.PrismaUnion<
    _i2.UserRecordWhereInput,
    Iterable<_i2.UserRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.UserRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.UserRecordWhereInput,
    Iterable<_i2.UserRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? banner;

  final _i1.PrismaUnion<_i2.IntFilter, int>? followersCount;

  final _i1.PrismaUnion<_i2.IntFilter, int>? followsCount;

  final _i1.PrismaUnion<_i2.IntFilter, int>? postsCount;

  final _i1.PrismaUnion<_i2.StringFilter, String>? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
  };
}

class UserRecordSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordSelect({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final bool? id;

  final bool? did;

  final bool? banner;

  final bool? followersCount;

  final bool? followsCount;

  final bool? postsCount;

  final bool? description;

  @override
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

enum SortOrder implements _i1.PrismaEnum {
  asc._('asc'),
  desc._('desc');

  const SortOrder._(this.name);

  @override
  final String name;
}

class UserRecordOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordOrderByWithRelationInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? banner;

  final _i2.SortOrder? followersCount;

  final _i2.SortOrder? followsCount;

  final _i2.SortOrder? postsCount;

  final _i2.SortOrder? description;

  @override
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

enum UserRecordScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<BigInt>('id', 'UserRecord'),
  did<String>('did', 'UserRecord'),
  banner<String>('banner', 'UserRecord'),
  followersCount<int>('followers_count', 'UserRecord'),
  followsCount<int>('follows_count', 'UserRecord'),
  postsCount<int>('posts_count', 'UserRecord'),
  description<String>('description', 'UserRecord');

  const UserRecordScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class UserRecordCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordCreateInput({
    required this.id,
    required this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final BigInt id;

  final String did;

  final String? banner;

  final int? followersCount;

  final int? followsCount;

  final int? postsCount;

  final String? description;

  @override
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

class UserRecordUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordUncheckedCreateInput({
    required this.id,
    required this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final BigInt id;

  final String did;

  final String? banner;

  final int? followersCount;

  final int? followsCount;

  final int? postsCount;

  final String? description;

  @override
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

class BigIntFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const BigIntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  final BigInt? set;

  final BigInt? increment;

  final BigInt? decrement;

  final BigInt? multiply;

  final BigInt? divide;

  @override
  Map<String, dynamic> toJson() => {
    'set': set,
    'increment': increment,
    'decrement': decrement,
    'multiply': multiply,
    'divide': divide,
  };
}

class StringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFieldUpdateOperationsInput({this.set});

  final String? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class IntFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => {
    'set': set,
    'increment': increment,
    'decrement': decrement,
    'multiply': multiply,
    'divide': divide,
  };
}

class UserRecordUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordUpdateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? did;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? banner;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? followersCount;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? followsCount;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? postsCount;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  description;

  @override
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

class UserRecordUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordUncheckedUpdateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? did;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? banner;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? followersCount;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? followsCount;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? postsCount;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  description;

  @override
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

class AffectedRowsOutput {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map json) =>
      AffectedRowsOutput(count: json['count']);

  final int? count;

  Map<String, dynamic> toJson() => {'count': count};
}

class UserRecordUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordUpdateManyMutationInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? did;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? banner;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? followersCount;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? followsCount;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? postsCount;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  description;

  @override
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

class UserRecordUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordUncheckedUpdateManyInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? did;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? banner;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? followersCount;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? followsCount;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? postsCount;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  description;

  @override
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

class UserRecordCountAggregateOutputType {
  const UserRecordCountAggregateOutputType({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
    this.$all,
  });

  factory UserRecordCountAggregateOutputType.fromJson(Map json) =>
      UserRecordCountAggregateOutputType(
        id: json['id'],
        did: json['did'],
        banner: json['banner'],
        followersCount: json['followers_count'],
        followsCount: json['follows_count'],
        postsCount: json['posts_count'],
        description: json['description'],
        $all: json['_all'],
      );

  final int? id;

  final int? did;

  final int? banner;

  final int? followersCount;

  final int? followsCount;

  final int? postsCount;

  final int? description;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
    '_all': $all,
  };
}

class UserRecordAvgAggregateOutputType {
  const UserRecordAvgAggregateOutputType({
    this.id,
    this.followersCount,
    this.followsCount,
    this.postsCount,
  });

  factory UserRecordAvgAggregateOutputType.fromJson(Map json) =>
      UserRecordAvgAggregateOutputType(
        id: json['id'],
        followersCount: json['followers_count'],
        followsCount: json['follows_count'],
        postsCount: json['posts_count'],
      );

  final double? id;

  final double? followersCount;

  final double? followsCount;

  final double? postsCount;

  Map<String, dynamic> toJson() => {
    'id': id,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
  };
}

class UserRecordSumAggregateOutputType {
  const UserRecordSumAggregateOutputType({
    this.id,
    this.followersCount,
    this.followsCount,
    this.postsCount,
  });

  factory UserRecordSumAggregateOutputType.fromJson(Map json) =>
      UserRecordSumAggregateOutputType(
        id: json['id'],
        followersCount: json['followers_count'],
        followsCount: json['follows_count'],
        postsCount: json['posts_count'],
      );

  final BigInt? id;

  final int? followersCount;

  final int? followsCount;

  final int? postsCount;

  Map<String, dynamic> toJson() => {
    'id': id,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
  };
}

class UserRecordMinAggregateOutputType {
  const UserRecordMinAggregateOutputType({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordMinAggregateOutputType.fromJson(Map json) =>
      UserRecordMinAggregateOutputType(
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

class UserRecordMaxAggregateOutputType {
  const UserRecordMaxAggregateOutputType({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordMaxAggregateOutputType.fromJson(Map json) =>
      UserRecordMaxAggregateOutputType(
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

class UserRecordGroupByOutputType {
  const UserRecordGroupByOutputType({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory UserRecordGroupByOutputType.fromJson(Map json) =>
      UserRecordGroupByOutputType(
        id: json['id'],
        did: json['did'],
        banner: json['banner'],
        followersCount: json['followers_count'],
        followsCount: json['follows_count'],
        postsCount: json['posts_count'],
        description: json['description'],
        $count: json['_count'] is Map
            ? _i2.UserRecordCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.UserRecordAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.UserRecordSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.UserRecordMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.UserRecordMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final BigInt? id;

  final String? did;

  final String? banner;

  final int? followersCount;

  final int? followsCount;

  final int? postsCount;

  final String? description;

  final _i2.UserRecordCountAggregateOutputType? $count;

  final _i2.UserRecordAvgAggregateOutputType? $avg;

  final _i2.UserRecordSumAggregateOutputType? $sum;

  final _i2.UserRecordMinAggregateOutputType? $min;

  final _i2.UserRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class UserRecordCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordCountOrderByAggregateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? banner;

  final _i2.SortOrder? followersCount;

  final _i2.SortOrder? followsCount;

  final _i2.SortOrder? postsCount;

  final _i2.SortOrder? description;

  @override
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

class UserRecordAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordAvgOrderByAggregateInput({
    this.id,
    this.followersCount,
    this.followsCount,
    this.postsCount,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? followersCount;

  final _i2.SortOrder? followsCount;

  final _i2.SortOrder? postsCount;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
  };
}

class UserRecordMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordMaxOrderByAggregateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? banner;

  final _i2.SortOrder? followersCount;

  final _i2.SortOrder? followsCount;

  final _i2.SortOrder? postsCount;

  final _i2.SortOrder? description;

  @override
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

class UserRecordMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordMinOrderByAggregateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? banner;

  final _i2.SortOrder? followersCount;

  final _i2.SortOrder? followsCount;

  final _i2.SortOrder? postsCount;

  final _i2.SortOrder? description;

  @override
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

class UserRecordSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordSumOrderByAggregateInput({
    this.id,
    this.followersCount,
    this.followsCount,
    this.postsCount,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? followersCount;

  final _i2.SortOrder? followsCount;

  final _i2.SortOrder? postsCount;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
  };
}

class UserRecordOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordOrderByWithAggregationInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? banner;

  final _i2.SortOrder? followersCount;

  final _i2.SortOrder? followsCount;

  final _i2.SortOrder? postsCount;

  final _i2.SortOrder? description;

  final _i2.UserRecordCountOrderByAggregateInput? $count;

  final _i2.UserRecordAvgOrderByAggregateInput? $avg;

  final _i2.UserRecordMaxOrderByAggregateInput? $max;

  final _i2.UserRecordMinOrderByAggregateInput? $min;

  final _i2.UserRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class NestedFloatFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<double, _i1.Reference<double>>? equals;

  final Iterable<double>? $in;

  final Iterable<double>? notIn;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? lt;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? lte;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? gt;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? gte;

  final _i1.PrismaUnion<double, _i2.NestedFloatFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class NestedBigIntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedBigIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? equals;

  final Iterable<BigInt>? $in;

  final Iterable<BigInt>? notIn;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? lt;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? lte;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? gt;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? gte;

  final _i1.PrismaUnion<BigInt, _i2.NestedBigIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedBigIntFilter? $sum;

  final _i2.NestedBigIntFilter? $min;

  final _i2.NestedBigIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class BigIntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const BigIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? equals;

  final Iterable<BigInt>? $in;

  final Iterable<BigInt>? notIn;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? lt;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? lte;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? gt;

  final _i1.PrismaUnion<BigInt, _i1.Reference<BigInt>>? gte;

  final _i1.PrismaUnion<BigInt, _i2.NestedBigIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedBigIntFilter? $sum;

  final _i2.NestedBigIntFilter? $min;

  final _i2.NestedBigIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class NestedStringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class StringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class NestedIntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedIntFilter? $sum;

  final _i2.NestedIntFilter? $min;

  final _i2.NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class IntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedIntFilter? $sum;

  final _i2.NestedIntFilter? $min;

  final _i2.NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class UserRecordScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final _i1.PrismaUnion<
    _i2.UserRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.UserRecordScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.UserRecordScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.UserRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.UserRecordScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntWithAggregatesFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? did;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? banner;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? followersCount;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? followsCount;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? postsCount;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? description;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'did': did,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
  };
}

class UserRecordCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordCountAggregateOutputTypeSelect({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
    this.$all,
  });

  final bool? id;

  final bool? did;

  final bool? banner;

  final bool? followersCount;

  final bool? followsCount;

  final bool? postsCount;

  final bool? description;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
    '_all': $all,
  };
}

class UserRecordGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordGroupByOutputTypeCountArgs({this.select});

  final _i2.UserRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserRecordAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordAvgAggregateOutputTypeSelect({
    this.id,
    this.followersCount,
    this.followsCount,
    this.postsCount,
  });

  final bool? id;

  final bool? followersCount;

  final bool? followsCount;

  final bool? postsCount;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
  };
}

class UserRecordGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordGroupByOutputTypeAvgArgs({this.select});

  final _i2.UserRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserRecordSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordSumAggregateOutputTypeSelect({
    this.id,
    this.followersCount,
    this.followsCount,
    this.postsCount,
  });

  final bool? id;

  final bool? followersCount;

  final bool? followsCount;

  final bool? postsCount;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
  };
}

class UserRecordGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordGroupByOutputTypeSumArgs({this.select});

  final _i2.UserRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserRecordMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordMinAggregateOutputTypeSelect({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final bool? id;

  final bool? did;

  final bool? banner;

  final bool? followersCount;

  final bool? followsCount;

  final bool? postsCount;

  final bool? description;

  @override
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

class UserRecordGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordGroupByOutputTypeMinArgs({this.select});

  final _i2.UserRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserRecordMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordMaxAggregateOutputTypeSelect({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  final bool? id;

  final bool? did;

  final bool? banner;

  final bool? followersCount;

  final bool? followsCount;

  final bool? postsCount;

  final bool? description;

  @override
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

class UserRecordGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordGroupByOutputTypeMaxArgs({this.select});

  final _i2.UserRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserRecordGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordGroupByOutputTypeSelect({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? did;

  final bool? banner;

  final bool? followersCount;

  final bool? followsCount;

  final bool? postsCount;

  final bool? description;

  final _i1.PrismaUnion<bool, _i2.UserRecordGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.UserRecordGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.UserRecordGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.UserRecordGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.UserRecordGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'banner': banner,
    'followers_count': followersCount,
    'follows_count': followsCount,
    'posts_count': postsCount,
    'description': description,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateUserRecord {
  const AggregateUserRecord({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateUserRecord.fromJson(Map json) => AggregateUserRecord(
    $count: json['_count'] is Map
        ? _i2.UserRecordCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.UserRecordAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.UserRecordSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.UserRecordMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.UserRecordMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.UserRecordCountAggregateOutputType? $count;

  final _i2.UserRecordAvgAggregateOutputType? $avg;

  final _i2.UserRecordSumAggregateOutputType? $sum;

  final _i2.UserRecordMinAggregateOutputType? $min;

  final _i2.UserRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateUserRecordCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserRecordCountArgs({this.select});

  final _i2.UserRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserRecordAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserRecordAvgArgs({this.select});

  final _i2.UserRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserRecordSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserRecordSumArgs({this.select});

  final _i2.UserRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserRecordMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserRecordMinArgs({this.select});

  final _i2.UserRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserRecordMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserRecordMaxArgs({this.select});

  final _i2.UserRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserRecordSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateUserRecordCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateUserRecordAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateUserRecordSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateUserRecordMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateUserRecordMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class PostRecordCountOutputType {
  const PostRecordCountOutputType({this.reposts});

  factory PostRecordCountOutputType.fromJson(Map json) =>
      PostRecordCountOutputType(reposts: json['reposts']);

  final int? reposts;

  Map<String, dynamic> toJson() => {'reposts': reposts};
}

class PostRecordRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordRelationFilter({this.$is, this.isNot});

  final _i2.PostRecordWhereInput? $is;

  final _i2.PostRecordWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => {'is': $is, 'isNot': isNot};
}

class RepostRecordWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.hashId,
    this.originalPostId,
    this.originalPost,
  });

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereInput,
    Iterable<_i2.RepostRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.RepostRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereInput,
    Iterable<_i2.RepostRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? hashId;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? originalPostId;

  final _i1.PrismaUnion<_i2.PostRecordRelationFilter, _i2.PostRecordWhereInput>?
  originalPost;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    'original_post': originalPost,
  };
}

class RepostRecordListRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordListRelationFilter({this.every, this.some, this.none});

  final _i2.RepostRecordWhereInput? every;

  final _i2.RepostRecordWhereInput? some;

  final _i2.RepostRecordWhereInput? none;

  @override
  Map<String, dynamic> toJson() => {'every': every, 'some': some, 'none': none};
}

class PostRecordWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  final _i1.PrismaUnion<
    _i2.PostRecordWhereInput,
    Iterable<_i2.PostRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.PostRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.PostRecordWhereInput,
    Iterable<_i2.PostRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? cid;

  final _i1.PrismaUnion<_i2.StringFilter, String>? uri;

  final _i1.PrismaUnion<_i2.StringFilter, String>? authorDid;

  final _i2.RepostRecordListRelationFilter? reposts;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts,
  };
}

class PostRecordWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordWhereUniqueInput({
    this.id,
    this.cid,
    this.AND,
    this.OR,
    this.NOT,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  final BigInt? id;

  final String? cid;

  final _i1.PrismaUnion<
    _i2.PostRecordWhereInput,
    Iterable<_i2.PostRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.PostRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.PostRecordWhereInput,
    Iterable<_i2.PostRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? uri;

  final _i1.PrismaUnion<_i2.StringFilter, String>? authorDid;

  final _i2.RepostRecordListRelationFilter? reposts;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts,
  };
}

class RepostRecordOriginalPostArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordOriginalPostArgs({this.select, this.include});

  final _i2.PostRecordSelect? select;

  final _i2.PostRecordInclude? include;

  @override
  Map<String, dynamic> toJson() => {'select': select, 'include': include};
}

class RepostRecordInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordInclude({this.originalPost});

  final _i1.PrismaUnion<bool, _i2.RepostRecordOriginalPostArgs>? originalPost;

  @override
  Map<String, dynamic> toJson() => {'original_post': originalPost};
}

class RepostRecordOrderByRelationAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordOrderByRelationAggregateInput({this.$count});

  final _i2.SortOrder? $count;

  @override
  Map<String, dynamic> toJson() => {'_count': $count};
}

class PostRecordOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordOrderByWithRelationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.SortOrder? authorDid;

  final _i2.RepostRecordOrderByRelationAggregateInput? reposts;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts,
  };
}

class RepostRecordOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordOrderByWithRelationInput({
    this.id,
    this.hashId,
    this.originalPostId,
    this.originalPost,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? hashId;

  final _i2.SortOrder? originalPostId;

  final _i2.PostRecordOrderByWithRelationInput? originalPost;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    'original_post': originalPost,
  };
}

class RepostRecordWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordWhereUniqueInput({
    this.id,
    this.hashId,
    this.AND,
    this.OR,
    this.NOT,
    this.originalPostId,
    this.originalPost,
  });

  final BigInt? id;

  final String? hashId;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereInput,
    Iterable<_i2.RepostRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.RepostRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereInput,
    Iterable<_i2.RepostRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? originalPostId;

  final _i1.PrismaUnion<_i2.PostRecordRelationFilter, _i2.PostRecordWhereInput>?
  originalPost;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'original_post_id': originalPostId,
    'original_post': originalPost,
  };
}

enum RepostRecordScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<BigInt>('id', 'RepostRecord'),
  hashId<String>('hash_id', 'RepostRecord'),
  originalPostId<BigInt>('original_post_id', 'RepostRecord');

  const RepostRecordScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class PostRecordRepostsArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordRepostsArgs({
    this.where,
    this.orderBy,
    this.cursor,
    this.take,
    this.skip,
    this.distinct,
    this.select,
    this.include,
  });

  final _i2.RepostRecordWhereInput? where;

  final _i1.PrismaUnion<
    Iterable<_i2.RepostRecordOrderByWithRelationInput>,
    _i2.RepostRecordOrderByWithRelationInput
  >?
  orderBy;

  final _i2.RepostRecordWhereUniqueInput? cursor;

  final int? take;

  final int? skip;

  final _i1.PrismaUnion<
    _i2.RepostRecordScalar,
    Iterable<_i2.RepostRecordScalar>
  >?
  distinct;

  final _i2.RepostRecordSelect? select;

  final _i2.RepostRecordInclude? include;

  @override
  Map<String, dynamic> toJson() => {
    'where': where,
    'orderBy': orderBy,
    'cursor': cursor,
    'take': take,
    'skip': skip,
    'distinct': distinct,
    'select': select,
    'include': include,
  };
}

class PostRecordCountOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordCountOutputTypeSelect({this.reposts});

  final bool? reposts;

  @override
  Map<String, dynamic> toJson() => {'reposts': reposts};
}

class PostRecordCountArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordCountArgs({this.select});

  final _i2.PostRecordCountOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostRecordInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordInclude({this.reposts, this.$count});

  final _i1.PrismaUnion<bool, _i2.PostRecordRepostsArgs>? reposts;

  final _i1.PrismaUnion<bool, _i2.PostRecordCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {'reposts': reposts, '_count': $count};
}

class RepostRecordSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordSelect({
    this.id,
    this.hashId,
    this.originalPostId,
    this.originalPost,
  });

  final bool? id;

  final bool? hashId;

  final bool? originalPostId;

  final _i1.PrismaUnion<bool, _i2.RepostRecordOriginalPostArgs>? originalPost;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    'original_post': originalPost,
  };
}

class PostRecordSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
    this.$count,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  final _i1.PrismaUnion<bool, _i2.PostRecordRepostsArgs>? reposts;

  final _i1.PrismaUnion<bool, _i2.PostRecordCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts,
    '_count': $count,
  };
}

enum PostRecordScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<BigInt>('id', 'PostRecord'),
  cid<String>('cid', 'PostRecord'),
  uri<String>('uri', 'PostRecord'),
  authorDid<String>('author_did', 'PostRecord');

  const PostRecordScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class RepostRecordCreateWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordCreateWithoutOriginalPostInput({
    required this.id,
    required this.hashId,
  });

  final BigInt id;

  final String hashId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'hash_id': hashId};
}

class RepostRecordUncheckedCreateWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUncheckedCreateWithoutOriginalPostInput({
    required this.id,
    required this.hashId,
  });

  final BigInt id;

  final String hashId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'hash_id': hashId};
}

class RepostRecordCreateOrConnectWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordCreateOrConnectWithoutOriginalPostInput({
    required this.where,
    required this.create,
  });

  final _i2.RepostRecordWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateWithoutOriginalPostInput,
    _i2.RepostRecordUncheckedCreateWithoutOriginalPostInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'create': create};
}

class RepostRecordCreateNestedManyWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordCreateNestedManyWithoutOriginalPostInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateWithoutOriginalPostInput,
    _i1.PrismaUnion<
      Iterable<_i2.RepostRecordCreateWithoutOriginalPostInput>,
      _i1.PrismaUnion<
        _i2.RepostRecordUncheckedCreateWithoutOriginalPostInput,
        Iterable<_i2.RepostRecordUncheckedCreateWithoutOriginalPostInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateOrConnectWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordCreateOrConnectWithoutOriginalPostInput>
  >?
  connectOrCreate;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'connect': connect,
  };
}

class PostRecordCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
    this.reposts,
  });

  final BigInt id;

  final String cid;

  final String uri;

  final String authorDid;

  final _i2.RepostRecordCreateNestedManyWithoutOriginalPostInput? reposts;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts,
  };
}

class RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateWithoutOriginalPostInput,
    _i1.PrismaUnion<
      Iterable<_i2.RepostRecordCreateWithoutOriginalPostInput>,
      _i1.PrismaUnion<
        _i2.RepostRecordUncheckedCreateWithoutOriginalPostInput,
        Iterable<_i2.RepostRecordUncheckedCreateWithoutOriginalPostInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateOrConnectWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordCreateOrConnectWithoutOriginalPostInput>
  >?
  connectOrCreate;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'connect': connect,
  };
}

class PostRecordUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUncheckedCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
    this.reposts,
  });

  final BigInt id;

  final String cid;

  final String uri;

  final String authorDid;

  final _i2.RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput?
  reposts;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts,
  };
}

class RepostRecordUpdateWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUpdateWithoutOriginalPostInput({this.id, this.hashId});

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? hashId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'hash_id': hashId};
}

class RepostRecordUncheckedUpdateWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUncheckedUpdateWithoutOriginalPostInput({
    this.id,
    this.hashId,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? hashId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'hash_id': hashId};
}

class RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput({
    required this.where,
    required this.update,
    required this.create,
  });

  final _i2.RepostRecordWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpdateWithoutOriginalPostInput,
    _i2.RepostRecordUncheckedUpdateWithoutOriginalPostInput
  >
  update;

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateWithoutOriginalPostInput,
    _i2.RepostRecordUncheckedCreateWithoutOriginalPostInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {
    'where': where,
    'update': update,
    'create': create,
  };
}

class RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput({
    required this.where,
    required this.data,
  });

  final _i2.RepostRecordWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpdateWithoutOriginalPostInput,
    _i2.RepostRecordUncheckedUpdateWithoutOriginalPostInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class RepostRecordScalarWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final _i1.PrismaUnion<
    _i2.RepostRecordScalarWhereInput,
    Iterable<_i2.RepostRecordScalarWhereInput>
  >?
  AND;

  final Iterable<_i2.RepostRecordScalarWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.RepostRecordScalarWhereInput,
    Iterable<_i2.RepostRecordScalarWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? hashId;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUpdateManyMutationInput({this.id, this.hashId});

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? hashId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'hash_id': hashId};
}

class RepostRecordUncheckedUpdateManyWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUncheckedUpdateManyWithoutOriginalPostInput({
    this.id,
    this.hashId,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? hashId;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'hash_id': hashId};
}

class RepostRecordUpdateManyWithWhereWithoutOriginalPostInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUpdateManyWithWhereWithoutOriginalPostInput({
    required this.where,
    required this.data,
  });

  final _i2.RepostRecordScalarWhereInput where;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpdateManyMutationInput,
    _i2.RepostRecordUncheckedUpdateManyWithoutOriginalPostInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class RepostRecordUpdateManyWithoutOriginalPostNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUpdateManyWithoutOriginalPostNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateWithoutOriginalPostInput,
    _i1.PrismaUnion<
      Iterable<_i2.RepostRecordCreateWithoutOriginalPostInput>,
      _i1.PrismaUnion<
        _i2.RepostRecordUncheckedCreateWithoutOriginalPostInput,
        Iterable<_i2.RepostRecordUncheckedCreateWithoutOriginalPostInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateOrConnectWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordCreateOrConnectWithoutOriginalPostInput>
  >?
  connectOrCreate;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput>
  >?
  upsert;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  set;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  disconnect;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  delete;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  connect;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput>
  >?
  update;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpdateManyWithWhereWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordUpdateManyWithWhereWithoutOriginalPostInput>
  >?
  updateMany;

  final _i1.PrismaUnion<
    _i2.RepostRecordScalarWhereInput,
    Iterable<_i2.RepostRecordScalarWhereInput>
  >?
  deleteMany;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'set': set,
    'disconnect': disconnect,
    'delete': delete,
    'connect': connect,
    'update': update,
    'updateMany': updateMany,
    'deleteMany': deleteMany,
  };
}

class PostRecordUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUpdateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  authorDid;

  final _i2.RepostRecordUpdateManyWithoutOriginalPostNestedInput? reposts;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts,
  };
}

class RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateWithoutOriginalPostInput,
    _i1.PrismaUnion<
      Iterable<_i2.RepostRecordCreateWithoutOriginalPostInput>,
      _i1.PrismaUnion<
        _i2.RepostRecordUncheckedCreateWithoutOriginalPostInput,
        Iterable<_i2.RepostRecordUncheckedCreateWithoutOriginalPostInput>
      >
    >
  >?
  create;

  final _i1.PrismaUnion<
    _i2.RepostRecordCreateOrConnectWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordCreateOrConnectWithoutOriginalPostInput>
  >?
  connectOrCreate;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput>
  >?
  upsert;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  set;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  disconnect;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  delete;

  final _i1.PrismaUnion<
    _i2.RepostRecordWhereUniqueInput,
    Iterable<_i2.RepostRecordWhereUniqueInput>
  >?
  connect;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput>
  >?
  update;

  final _i1.PrismaUnion<
    _i2.RepostRecordUpdateManyWithWhereWithoutOriginalPostInput,
    Iterable<_i2.RepostRecordUpdateManyWithWhereWithoutOriginalPostInput>
  >?
  updateMany;

  final _i1.PrismaUnion<
    _i2.RepostRecordScalarWhereInput,
    Iterable<_i2.RepostRecordScalarWhereInput>
  >?
  deleteMany;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'set': set,
    'disconnect': disconnect,
    'delete': delete,
    'connect': connect,
    'update': update,
    'updateMany': updateMany,
    'deleteMany': deleteMany,
  };
}

class PostRecordUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUncheckedUpdateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  authorDid;

  final _i2.RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput?
  reposts;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    'reposts': reposts,
  };
}

class PostRecordUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUpdateManyMutationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUncheckedUpdateManyInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordCountAggregateOutputType {
  const PostRecordCountAggregateOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$all,
  });

  factory PostRecordCountAggregateOutputType.fromJson(Map json) =>
      PostRecordCountAggregateOutputType(
        id: json['id'],
        cid: json['cid'],
        uri: json['uri'],
        authorDid: json['author_did'],
        $all: json['_all'],
      );

  final int? id;

  final int? cid;

  final int? uri;

  final int? authorDid;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_all': $all,
  };
}

class PostRecordAvgAggregateOutputType {
  const PostRecordAvgAggregateOutputType({this.id});

  factory PostRecordAvgAggregateOutputType.fromJson(Map json) =>
      PostRecordAvgAggregateOutputType(id: json['id']);

  final double? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class PostRecordSumAggregateOutputType {
  const PostRecordSumAggregateOutputType({this.id});

  factory PostRecordSumAggregateOutputType.fromJson(Map json) =>
      PostRecordSumAggregateOutputType(id: json['id']);

  final BigInt? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class PostRecordMinAggregateOutputType {
  const PostRecordMinAggregateOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordMinAggregateOutputType.fromJson(Map json) =>
      PostRecordMinAggregateOutputType(
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

class PostRecordMaxAggregateOutputType {
  const PostRecordMaxAggregateOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordMaxAggregateOutputType.fromJson(Map json) =>
      PostRecordMaxAggregateOutputType(
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

class PostRecordGroupByOutputType {
  const PostRecordGroupByOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory PostRecordGroupByOutputType.fromJson(Map json) =>
      PostRecordGroupByOutputType(
        id: json['id'],
        cid: json['cid'],
        uri: json['uri'],
        authorDid: json['author_did'],
        $count: json['_count'] is Map
            ? _i2.PostRecordCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.PostRecordAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.PostRecordSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.PostRecordMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.PostRecordMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final BigInt? id;

  final String? cid;

  final String? uri;

  final String? authorDid;

  final _i2.PostRecordCountAggregateOutputType? $count;

  final _i2.PostRecordAvgAggregateOutputType? $avg;

  final _i2.PostRecordSumAggregateOutputType? $sum;

  final _i2.PostRecordMinAggregateOutputType? $min;

  final _i2.PostRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class PostRecordCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordCountOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordAvgOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class PostRecordMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordMaxOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordMinOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordSumOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class PostRecordOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordOrderByWithAggregationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.SortOrder? authorDid;

  final _i2.PostRecordCountOrderByAggregateInput? $count;

  final _i2.PostRecordAvgOrderByAggregateInput? $avg;

  final _i2.PostRecordMaxOrderByAggregateInput? $max;

  final _i2.PostRecordMinOrderByAggregateInput? $min;

  final _i2.PostRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class PostRecordScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<
    _i2.PostRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.PostRecordScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.PostRecordScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.PostRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.PostRecordScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntWithAggregatesFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? cid;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? uri;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordCountAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$all,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_all': $all,
  };
}

class PostRecordGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordGroupByOutputTypeCountArgs({this.select});

  final _i2.PostRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostRecordAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordAvgAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class PostRecordGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordGroupByOutputTypeAvgArgs({this.select});

  final _i2.PostRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostRecordSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordSumAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class PostRecordGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordGroupByOutputTypeSumArgs({this.select});

  final _i2.PostRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostRecordMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordMinAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordGroupByOutputTypeMinArgs({this.select});

  final _i2.PostRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostRecordMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordMaxAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordGroupByOutputTypeMaxArgs({this.select});

  final _i2.PostRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PostRecordGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordGroupByOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  final _i1.PrismaUnion<bool, _i2.PostRecordGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.PostRecordGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.PostRecordGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.PostRecordGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.PostRecordGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregatePostRecord {
  const AggregatePostRecord({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregatePostRecord.fromJson(Map json) => AggregatePostRecord(
    $count: json['_count'] is Map
        ? _i2.PostRecordCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.PostRecordAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.PostRecordSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.PostRecordMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.PostRecordMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.PostRecordCountAggregateOutputType? $count;

  final _i2.PostRecordAvgAggregateOutputType? $avg;

  final _i2.PostRecordSumAggregateOutputType? $sum;

  final _i2.PostRecordMinAggregateOutputType? $min;

  final _i2.PostRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregatePostRecordCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostRecordCountArgs({this.select});

  final _i2.PostRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostRecordAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostRecordAvgArgs({this.select});

  final _i2.PostRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostRecordSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostRecordSumArgs({this.select});

  final _i2.PostRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostRecordMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostRecordMinArgs({this.select});

  final _i2.PostRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostRecordMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostRecordMaxArgs({this.select});

  final _i2.PostRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePostRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePostRecordSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregatePostRecordCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregatePostRecordAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregatePostRecordSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregatePostRecordMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregatePostRecordMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class PostRecordCreateWithoutRepostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordCreateWithoutRepostsInput({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
  });

  final BigInt id;

  final String cid;

  final String uri;

  final String authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordUncheckedCreateWithoutRepostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUncheckedCreateWithoutRepostsInput({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
  });

  final BigInt id;

  final String cid;

  final String uri;

  final String authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordCreateOrConnectWithoutRepostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordCreateOrConnectWithoutRepostsInput({
    required this.where,
    required this.create,
  });

  final _i2.PostRecordWhereUniqueInput where;

  final _i1.PrismaUnion<
    _i2.PostRecordCreateWithoutRepostsInput,
    _i2.PostRecordUncheckedCreateWithoutRepostsInput
  >
  create;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'create': create};
}

class PostRecordCreateNestedOneWithoutRepostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordCreateNestedOneWithoutRepostsInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<
    _i2.PostRecordCreateWithoutRepostsInput,
    _i2.PostRecordUncheckedCreateWithoutRepostsInput
  >?
  create;

  final _i2.PostRecordCreateOrConnectWithoutRepostsInput? connectOrCreate;

  final _i2.PostRecordWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'connect': connect,
  };
}

class RepostRecordCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordCreateInput({
    required this.id,
    required this.hashId,
    required this.originalPost,
  });

  final BigInt id;

  final String hashId;

  final _i2.PostRecordCreateNestedOneWithoutRepostsInput originalPost;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post': originalPost,
  };
}

class RepostRecordUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUncheckedCreateInput({
    required this.id,
    required this.hashId,
    required this.originalPostId,
  });

  final BigInt id;

  final String hashId;

  final BigInt originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class PostRecordUpdateWithoutRepostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUpdateWithoutRepostsInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordUncheckedUpdateWithoutRepostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUncheckedUpdateWithoutRepostsInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class PostRecordUpsertWithoutRepostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUpsertWithoutRepostsInput({
    required this.update,
    required this.create,
    this.where,
  });

  final _i1.PrismaUnion<
    _i2.PostRecordUpdateWithoutRepostsInput,
    _i2.PostRecordUncheckedUpdateWithoutRepostsInput
  >
  update;

  final _i1.PrismaUnion<
    _i2.PostRecordCreateWithoutRepostsInput,
    _i2.PostRecordUncheckedCreateWithoutRepostsInput
  >
  create;

  final _i2.PostRecordWhereInput? where;

  @override
  Map<String, dynamic> toJson() => {
    'update': update,
    'create': create,
    'where': where,
  };
}

class PostRecordUpdateToOneWithWhereWithoutRepostsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUpdateToOneWithWhereWithoutRepostsInput({
    this.where,
    required this.data,
  });

  final _i2.PostRecordWhereInput? where;

  final _i1.PrismaUnion<
    _i2.PostRecordUpdateWithoutRepostsInput,
    _i2.PostRecordUncheckedUpdateWithoutRepostsInput
  >
  data;

  @override
  Map<String, dynamic> toJson() => {'where': where, 'data': data};
}

class PostRecordUpdateOneRequiredWithoutRepostsNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PostRecordUpdateOneRequiredWithoutRepostsNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  final _i1.PrismaUnion<
    _i2.PostRecordCreateWithoutRepostsInput,
    _i2.PostRecordUncheckedCreateWithoutRepostsInput
  >?
  create;

  final _i2.PostRecordCreateOrConnectWithoutRepostsInput? connectOrCreate;

  final _i2.PostRecordUpsertWithoutRepostsInput? upsert;

  final _i2.PostRecordWhereUniqueInput? connect;

  final _i1.PrismaUnion<
    _i2.PostRecordUpdateToOneWithWhereWithoutRepostsInput,
    _i1.PrismaUnion<
      _i2.PostRecordUpdateWithoutRepostsInput,
      _i2.PostRecordUncheckedUpdateWithoutRepostsInput
    >
  >?
  update;

  @override
  Map<String, dynamic> toJson() => {
    'create': create,
    'connectOrCreate': connectOrCreate,
    'upsert': upsert,
    'connect': connect,
    'update': update,
  };
}

class RepostRecordUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUpdateInput({this.id, this.hashId, this.originalPost});

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? hashId;

  final _i2.PostRecordUpdateOneRequiredWithoutRepostsNestedInput? originalPost;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post': originalPost,
  };
}

class RepostRecordUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUncheckedUpdateInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? hashId;

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>?
  originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordUncheckedUpdateManyInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? hashId;

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>?
  originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordCountAggregateOutputType {
  const RepostRecordCountAggregateOutputType({
    this.id,
    this.hashId,
    this.originalPostId,
    this.$all,
  });

  factory RepostRecordCountAggregateOutputType.fromJson(Map json) =>
      RepostRecordCountAggregateOutputType(
        id: json['id'],
        hashId: json['hash_id'],
        originalPostId: json['original_post_id'],
        $all: json['_all'],
      );

  final int? id;

  final int? hashId;

  final int? originalPostId;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    '_all': $all,
  };
}

class RepostRecordAvgAggregateOutputType {
  const RepostRecordAvgAggregateOutputType({this.id, this.originalPostId});

  factory RepostRecordAvgAggregateOutputType.fromJson(Map json) =>
      RepostRecordAvgAggregateOutputType(
        id: json['id'],
        originalPostId: json['original_post_id'],
      );

  final double? id;

  final double? originalPostId;

  Map<String, dynamic> toJson() => {
    'id': id,
    'original_post_id': originalPostId,
  };
}

class RepostRecordSumAggregateOutputType {
  const RepostRecordSumAggregateOutputType({this.id, this.originalPostId});

  factory RepostRecordSumAggregateOutputType.fromJson(Map json) =>
      RepostRecordSumAggregateOutputType(
        id: json['id'],
        originalPostId: json['original_post_id'],
      );

  final BigInt? id;

  final BigInt? originalPostId;

  Map<String, dynamic> toJson() => {
    'id': id,
    'original_post_id': originalPostId,
  };
}

class RepostRecordMinAggregateOutputType {
  const RepostRecordMinAggregateOutputType({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordMinAggregateOutputType.fromJson(Map json) =>
      RepostRecordMinAggregateOutputType(
        id: json['id'],
        hashId: json['hash_id'],
        originalPostId: json['original_post_id'],
      );

  final BigInt? id;

  final String? hashId;

  final BigInt? originalPostId;

  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordMaxAggregateOutputType {
  const RepostRecordMaxAggregateOutputType({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordMaxAggregateOutputType.fromJson(Map json) =>
      RepostRecordMaxAggregateOutputType(
        id: json['id'],
        hashId: json['hash_id'],
        originalPostId: json['original_post_id'],
      );

  final BigInt? id;

  final String? hashId;

  final BigInt? originalPostId;

  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordGroupByOutputType {
  const RepostRecordGroupByOutputType({
    this.id,
    this.hashId,
    this.originalPostId,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory RepostRecordGroupByOutputType.fromJson(Map json) =>
      RepostRecordGroupByOutputType(
        id: json['id'],
        hashId: json['hash_id'],
        originalPostId: json['original_post_id'],
        $count: json['_count'] is Map
            ? _i2.RepostRecordCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.RepostRecordAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.RepostRecordSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.RepostRecordMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.RepostRecordMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final BigInt? id;

  final String? hashId;

  final BigInt? originalPostId;

  final _i2.RepostRecordCountAggregateOutputType? $count;

  final _i2.RepostRecordAvgAggregateOutputType? $avg;

  final _i2.RepostRecordSumAggregateOutputType? $sum;

  final _i2.RepostRecordMinAggregateOutputType? $min;

  final _i2.RepostRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class RepostRecordCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordCountOrderByAggregateInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? hashId;

  final _i2.SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordAvgOrderByAggregateInput({this.id, this.originalPostId});

  final _i2.SortOrder? id;

  final _i2.SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'original_post_id': originalPostId,
  };
}

class RepostRecordMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordMaxOrderByAggregateInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? hashId;

  final _i2.SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordMinOrderByAggregateInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? hashId;

  final _i2.SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordSumOrderByAggregateInput({this.id, this.originalPostId});

  final _i2.SortOrder? id;

  final _i2.SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'original_post_id': originalPostId,
  };
}

class RepostRecordOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordOrderByWithAggregationInput({
    this.id,
    this.hashId,
    this.originalPostId,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? hashId;

  final _i2.SortOrder? originalPostId;

  final _i2.RepostRecordCountOrderByAggregateInput? $count;

  final _i2.RepostRecordAvgOrderByAggregateInput? $avg;

  final _i2.RepostRecordMaxOrderByAggregateInput? $max;

  final _i2.RepostRecordMinOrderByAggregateInput? $min;

  final _i2.RepostRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class RepostRecordScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final _i1.PrismaUnion<
    _i2.RepostRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.RepostRecordScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.RepostRecordScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.RepostRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.RepostRecordScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntWithAggregatesFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? hashId;

  final _i1.PrismaUnion<_i2.BigIntWithAggregatesFilter, BigInt>? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordCountAggregateOutputTypeSelect({
    this.id,
    this.hashId,
    this.originalPostId,
    this.$all,
  });

  final bool? id;

  final bool? hashId;

  final bool? originalPostId;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    '_all': $all,
  };
}

class RepostRecordGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordGroupByOutputTypeCountArgs({this.select});

  final _i2.RepostRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class RepostRecordAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordAvgAggregateOutputTypeSelect({
    this.id,
    this.originalPostId,
  });

  final bool? id;

  final bool? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'original_post_id': originalPostId,
  };
}

class RepostRecordGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordGroupByOutputTypeAvgArgs({this.select});

  final _i2.RepostRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class RepostRecordSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordSumAggregateOutputTypeSelect({
    this.id,
    this.originalPostId,
  });

  final bool? id;

  final bool? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'original_post_id': originalPostId,
  };
}

class RepostRecordGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordGroupByOutputTypeSumArgs({this.select});

  final _i2.RepostRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class RepostRecordMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordMinAggregateOutputTypeSelect({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final bool? id;

  final bool? hashId;

  final bool? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordGroupByOutputTypeMinArgs({this.select});

  final _i2.RepostRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class RepostRecordMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordMaxAggregateOutputTypeSelect({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  final bool? id;

  final bool? hashId;

  final bool? originalPostId;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
  };
}

class RepostRecordGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordGroupByOutputTypeMaxArgs({this.select});

  final _i2.RepostRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class RepostRecordGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RepostRecordGroupByOutputTypeSelect({
    this.id,
    this.hashId,
    this.originalPostId,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? hashId;

  final bool? originalPostId;

  final _i1.PrismaUnion<bool, _i2.RepostRecordGroupByOutputTypeCountArgs>?
  $count;

  final _i1.PrismaUnion<bool, _i2.RepostRecordGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.RepostRecordGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.RepostRecordGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.RepostRecordGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'hash_id': hashId,
    'original_post_id': originalPostId,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateRepostRecord {
  const AggregateRepostRecord({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateRepostRecord.fromJson(Map json) => AggregateRepostRecord(
    $count: json['_count'] is Map
        ? _i2.RepostRecordCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.RepostRecordAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.RepostRecordSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.RepostRecordMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.RepostRecordMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.RepostRecordCountAggregateOutputType? $count;

  final _i2.RepostRecordAvgAggregateOutputType? $avg;

  final _i2.RepostRecordSumAggregateOutputType? $sum;

  final _i2.RepostRecordMinAggregateOutputType? $min;

  final _i2.RepostRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateRepostRecordCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRepostRecordCountArgs({this.select});

  final _i2.RepostRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateRepostRecordAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRepostRecordAvgArgs({this.select});

  final _i2.RepostRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateRepostRecordSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRepostRecordSumArgs({this.select});

  final _i2.RepostRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateRepostRecordMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRepostRecordMinArgs({this.select});

  final _i2.RepostRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateRepostRecordMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRepostRecordMaxArgs({this.select});

  final _i2.RepostRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateRepostRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRepostRecordSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateRepostRecordCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateRepostRecordAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateRepostRecordSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateRepostRecordMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateRepostRecordMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class NotificationRecordWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
  });

  final _i1.PrismaUnion<
    _i2.NotificationRecordWhereInput,
    Iterable<_i2.NotificationRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.NotificationRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.NotificationRecordWhereInput,
    Iterable<_i2.NotificationRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? cid;

  final _i1.PrismaUnion<_i2.StringFilter, String>? uri;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'cid': cid,
    'uri': uri,
  };
}

class NotificationRecordWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.cid,
    this.uri,
  });

  final BigInt? id;

  final _i1.PrismaUnion<
    _i2.NotificationRecordWhereInput,
    Iterable<_i2.NotificationRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.NotificationRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.NotificationRecordWhereInput,
    Iterable<_i2.NotificationRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? cid;

  final _i1.PrismaUnion<_i2.StringFilter, String>? uri;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'cid': cid,
    'uri': uri,
  };
}

class NotificationRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordSelect({this.id, this.cid, this.uri});

  final bool? id;

  final bool? cid;

  final bool? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordOrderByWithRelationInput({
    this.id,
    this.cid,
    this.uri,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

enum NotificationRecordScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<BigInt>('id', 'NotificationRecord'),
  cid<String>('cid', 'NotificationRecord'),
  uri<String>('uri', 'NotificationRecord');

  const NotificationRecordScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class NotificationRecordCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
  });

  final BigInt id;

  final String cid;

  final String uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordUncheckedCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
  });

  final BigInt id;

  final String cid;

  final String uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordUpdateInput({this.id, this.cid, this.uri});

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordUncheckedUpdateInput({this.id, this.cid, this.uri});

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordUpdateManyMutationInput({
    this.id,
    this.cid,
    this.uri,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordUncheckedUpdateManyInput({
    this.id,
    this.cid,
    this.uri,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordCountAggregateOutputType {
  const NotificationRecordCountAggregateOutputType({
    this.id,
    this.cid,
    this.uri,
    this.$all,
  });

  factory NotificationRecordCountAggregateOutputType.fromJson(Map json) =>
      NotificationRecordCountAggregateOutputType(
        id: json['id'],
        cid: json['cid'],
        uri: json['uri'],
        $all: json['_all'],
      );

  final int? id;

  final int? cid;

  final int? uri;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    '_all': $all,
  };
}

class NotificationRecordAvgAggregateOutputType {
  const NotificationRecordAvgAggregateOutputType({this.id});

  factory NotificationRecordAvgAggregateOutputType.fromJson(Map json) =>
      NotificationRecordAvgAggregateOutputType(id: json['id']);

  final double? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class NotificationRecordSumAggregateOutputType {
  const NotificationRecordSumAggregateOutputType({this.id});

  factory NotificationRecordSumAggregateOutputType.fromJson(Map json) =>
      NotificationRecordSumAggregateOutputType(id: json['id']);

  final BigInt? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class NotificationRecordMinAggregateOutputType {
  const NotificationRecordMinAggregateOutputType({this.id, this.cid, this.uri});

  factory NotificationRecordMinAggregateOutputType.fromJson(Map json) =>
      NotificationRecordMinAggregateOutputType(
        id: json['id'],
        cid: json['cid'],
        uri: json['uri'],
      );

  final BigInt? id;

  final String? cid;

  final String? uri;

  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordMaxAggregateOutputType {
  const NotificationRecordMaxAggregateOutputType({this.id, this.cid, this.uri});

  factory NotificationRecordMaxAggregateOutputType.fromJson(Map json) =>
      NotificationRecordMaxAggregateOutputType(
        id: json['id'],
        cid: json['cid'],
        uri: json['uri'],
      );

  final BigInt? id;

  final String? cid;

  final String? uri;

  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordGroupByOutputType {
  const NotificationRecordGroupByOutputType({
    this.id,
    this.cid,
    this.uri,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory NotificationRecordGroupByOutputType.fromJson(
    Map json,
  ) => NotificationRecordGroupByOutputType(
    id: json['id'],
    cid: json['cid'],
    uri: json['uri'],
    $count: json['_count'] is Map
        ? _i2.NotificationRecordCountAggregateOutputType.fromJson(
            json['_count'],
          )
        : null,
    $avg: json['_avg'] is Map
        ? _i2.NotificationRecordAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.NotificationRecordSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.NotificationRecordMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.NotificationRecordMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final BigInt? id;

  final String? cid;

  final String? uri;

  final _i2.NotificationRecordCountAggregateOutputType? $count;

  final _i2.NotificationRecordAvgAggregateOutputType? $avg;

  final _i2.NotificationRecordSumAggregateOutputType? $sum;

  final _i2.NotificationRecordMinAggregateOutputType? $min;

  final _i2.NotificationRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class NotificationRecordCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordCountOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordAvgOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class NotificationRecordMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordMaxOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordMinOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordSumOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class NotificationRecordOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordOrderByWithAggregationInput({
    this.id,
    this.cid,
    this.uri,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.NotificationRecordCountOrderByAggregateInput? $count;

  final _i2.NotificationRecordAvgOrderByAggregateInput? $avg;

  final _i2.NotificationRecordMaxOrderByAggregateInput? $max;

  final _i2.NotificationRecordMinOrderByAggregateInput? $min;

  final _i2.NotificationRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class NotificationRecordScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
  });

  final _i1.PrismaUnion<
    _i2.NotificationRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.NotificationRecordScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.NotificationRecordScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.NotificationRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.NotificationRecordScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntWithAggregatesFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? cid;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? uri;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'cid': cid,
    'uri': uri,
  };
}

class NotificationRecordCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordCountAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.$all,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    '_all': $all,
  };
}

class NotificationRecordGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordGroupByOutputTypeCountArgs({this.select});

  final _i2.NotificationRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class NotificationRecordAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordAvgAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class NotificationRecordGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordGroupByOutputTypeAvgArgs({this.select});

  final _i2.NotificationRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class NotificationRecordSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordSumAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class NotificationRecordGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordGroupByOutputTypeSumArgs({this.select});

  final _i2.NotificationRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class NotificationRecordMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordMinAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordGroupByOutputTypeMinArgs({this.select});

  final _i2.NotificationRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class NotificationRecordMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordMaxAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'cid': cid, 'uri': uri};
}

class NotificationRecordGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordGroupByOutputTypeMaxArgs({this.select});

  final _i2.NotificationRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class NotificationRecordGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NotificationRecordGroupByOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final _i1.PrismaUnion<bool, _i2.NotificationRecordGroupByOutputTypeCountArgs>?
  $count;

  final _i1.PrismaUnion<bool, _i2.NotificationRecordGroupByOutputTypeAvgArgs>?
  $avg;

  final _i1.PrismaUnion<bool, _i2.NotificationRecordGroupByOutputTypeSumArgs>?
  $sum;

  final _i1.PrismaUnion<bool, _i2.NotificationRecordGroupByOutputTypeMinArgs>?
  $min;

  final _i1.PrismaUnion<bool, _i2.NotificationRecordGroupByOutputTypeMaxArgs>?
  $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateNotificationRecord {
  const AggregateNotificationRecord({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateNotificationRecord.fromJson(
    Map json,
  ) => AggregateNotificationRecord(
    $count: json['_count'] is Map
        ? _i2.NotificationRecordCountAggregateOutputType.fromJson(
            json['_count'],
          )
        : null,
    $avg: json['_avg'] is Map
        ? _i2.NotificationRecordAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.NotificationRecordSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.NotificationRecordMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.NotificationRecordMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.NotificationRecordCountAggregateOutputType? $count;

  final _i2.NotificationRecordAvgAggregateOutputType? $avg;

  final _i2.NotificationRecordSumAggregateOutputType? $sum;

  final _i2.NotificationRecordMinAggregateOutputType? $min;

  final _i2.NotificationRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateNotificationRecordCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateNotificationRecordCountArgs({this.select});

  final _i2.NotificationRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateNotificationRecordAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateNotificationRecordAvgArgs({this.select});

  final _i2.NotificationRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateNotificationRecordSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateNotificationRecordSumArgs({this.select});

  final _i2.NotificationRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateNotificationRecordMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateNotificationRecordMinArgs({this.select});

  final _i2.NotificationRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateNotificationRecordMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateNotificationRecordMaxArgs({this.select});

  final _i2.NotificationRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateNotificationRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateNotificationRecordSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateNotificationRecordCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateNotificationRecordAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateNotificationRecordSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateNotificationRecordMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateNotificationRecordMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class MediaRecordWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i1.PrismaUnion<
    _i2.MediaRecordWhereInput,
    Iterable<_i2.MediaRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.MediaRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.MediaRecordWhereInput,
    Iterable<_i2.MediaRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? type;

  final _i1.PrismaUnion<_i2.StringFilter, String>? mimeType;

  final _i1.PrismaUnion<_i2.IntFilter, int>? size;

  final _i1.PrismaUnion<_i2.StringFilter, String>? link;

  final _i1.PrismaUnion<_i2.StringFilter, String>? description;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final BigInt? id;

  final _i1.PrismaUnion<
    _i2.MediaRecordWhereInput,
    Iterable<_i2.MediaRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.MediaRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.MediaRecordWhereInput,
    Iterable<_i2.MediaRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? type;

  final _i1.PrismaUnion<_i2.StringFilter, String>? mimeType;

  final _i1.PrismaUnion<_i2.IntFilter, int>? size;

  final _i1.PrismaUnion<_i2.StringFilter, String>? link;

  final _i1.PrismaUnion<_i2.StringFilter, String>? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordSelect({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final bool? id;

  final bool? type;

  final bool? mimeType;

  final bool? size;

  final bool? link;

  final bool? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordOrderByWithRelationInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? mimeType;

  final _i2.SortOrder? size;

  final _i2.SortOrder? link;

  final _i2.SortOrder? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

enum MediaRecordScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<BigInt>('id', 'MediaRecord'),
  type<String>('type', 'MediaRecord'),
  mimeType<String>('mime_type', 'MediaRecord'),
  size<int>('size', 'MediaRecord'),
  link<String>('link', 'MediaRecord'),
  description<String>('description', 'MediaRecord');

  const MediaRecordScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class MediaRecordCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordCreateInput({
    required this.id,
    required this.type,
    required this.mimeType,
    required this.size,
    required this.link,
    required this.description,
  });

  final BigInt id;

  final String type;

  final String mimeType;

  final int size;

  final String link;

  final String description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordUncheckedCreateInput({
    required this.id,
    required this.type,
    required this.mimeType,
    required this.size,
    required this.link,
    required this.description,
  });

  final BigInt id;

  final String type;

  final String mimeType;

  final int size;

  final String link;

  final String description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordUpdateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? mimeType;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? size;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? link;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordUncheckedUpdateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? mimeType;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? size;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? link;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordUpdateManyMutationInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? mimeType;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? size;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? link;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordUncheckedUpdateManyInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? type;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? mimeType;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? size;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? link;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordCountAggregateOutputType {
  const MediaRecordCountAggregateOutputType({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
    this.$all,
  });

  factory MediaRecordCountAggregateOutputType.fromJson(Map json) =>
      MediaRecordCountAggregateOutputType(
        id: json['id'],
        type: json['type'],
        mimeType: json['mime_type'],
        size: json['size'],
        link: json['link'],
        description: json['description'],
        $all: json['_all'],
      );

  final int? id;

  final int? type;

  final int? mimeType;

  final int? size;

  final int? link;

  final int? description;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
    '_all': $all,
  };
}

class MediaRecordAvgAggregateOutputType {
  const MediaRecordAvgAggregateOutputType({this.id, this.size});

  factory MediaRecordAvgAggregateOutputType.fromJson(Map json) =>
      MediaRecordAvgAggregateOutputType(id: json['id'], size: json['size']);

  final double? id;

  final double? size;

  Map<String, dynamic> toJson() => {'id': id, 'size': size};
}

class MediaRecordSumAggregateOutputType {
  const MediaRecordSumAggregateOutputType({this.id, this.size});

  factory MediaRecordSumAggregateOutputType.fromJson(Map json) =>
      MediaRecordSumAggregateOutputType(id: json['id'], size: json['size']);

  final BigInt? id;

  final int? size;

  Map<String, dynamic> toJson() => {'id': id, 'size': size};
}

class MediaRecordMinAggregateOutputType {
  const MediaRecordMinAggregateOutputType({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordMinAggregateOutputType.fromJson(Map json) =>
      MediaRecordMinAggregateOutputType(
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

class MediaRecordMaxAggregateOutputType {
  const MediaRecordMaxAggregateOutputType({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordMaxAggregateOutputType.fromJson(Map json) =>
      MediaRecordMaxAggregateOutputType(
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

class MediaRecordGroupByOutputType {
  const MediaRecordGroupByOutputType({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory MediaRecordGroupByOutputType.fromJson(Map json) =>
      MediaRecordGroupByOutputType(
        id: json['id'],
        type: json['type'],
        mimeType: json['mime_type'],
        size: json['size'],
        link: json['link'],
        description: json['description'],
        $count: json['_count'] is Map
            ? _i2.MediaRecordCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.MediaRecordAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.MediaRecordSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.MediaRecordMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.MediaRecordMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final BigInt? id;

  final String? type;

  final String? mimeType;

  final int? size;

  final String? link;

  final String? description;

  final _i2.MediaRecordCountAggregateOutputType? $count;

  final _i2.MediaRecordAvgAggregateOutputType? $avg;

  final _i2.MediaRecordSumAggregateOutputType? $sum;

  final _i2.MediaRecordMinAggregateOutputType? $min;

  final _i2.MediaRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class MediaRecordCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordCountOrderByAggregateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? mimeType;

  final _i2.SortOrder? size;

  final _i2.SortOrder? link;

  final _i2.SortOrder? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordAvgOrderByAggregateInput({this.id, this.size});

  final _i2.SortOrder? id;

  final _i2.SortOrder? size;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'size': size};
}

class MediaRecordMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordMaxOrderByAggregateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? mimeType;

  final _i2.SortOrder? size;

  final _i2.SortOrder? link;

  final _i2.SortOrder? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordMinOrderByAggregateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? mimeType;

  final _i2.SortOrder? size;

  final _i2.SortOrder? link;

  final _i2.SortOrder? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordSumOrderByAggregateInput({this.id, this.size});

  final _i2.SortOrder? id;

  final _i2.SortOrder? size;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'size': size};
}

class MediaRecordOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordOrderByWithAggregationInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? type;

  final _i2.SortOrder? mimeType;

  final _i2.SortOrder? size;

  final _i2.SortOrder? link;

  final _i2.SortOrder? description;

  final _i2.MediaRecordCountOrderByAggregateInput? $count;

  final _i2.MediaRecordAvgOrderByAggregateInput? $avg;

  final _i2.MediaRecordMaxOrderByAggregateInput? $max;

  final _i2.MediaRecordMinOrderByAggregateInput? $min;

  final _i2.MediaRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class MediaRecordScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final _i1.PrismaUnion<
    _i2.MediaRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.MediaRecordScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.MediaRecordScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.MediaRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.MediaRecordScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntWithAggregatesFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? type;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? mimeType;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? size;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? link;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? description;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordCountAggregateOutputTypeSelect({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
    this.$all,
  });

  final bool? id;

  final bool? type;

  final bool? mimeType;

  final bool? size;

  final bool? link;

  final bool? description;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
    '_all': $all,
  };
}

class MediaRecordGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordGroupByOutputTypeCountArgs({this.select});

  final _i2.MediaRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class MediaRecordAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordAvgAggregateOutputTypeSelect({this.id, this.size});

  final bool? id;

  final bool? size;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'size': size};
}

class MediaRecordGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordGroupByOutputTypeAvgArgs({this.select});

  final _i2.MediaRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class MediaRecordSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordSumAggregateOutputTypeSelect({this.id, this.size});

  final bool? id;

  final bool? size;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'size': size};
}

class MediaRecordGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordGroupByOutputTypeSumArgs({this.select});

  final _i2.MediaRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class MediaRecordMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordMinAggregateOutputTypeSelect({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final bool? id;

  final bool? type;

  final bool? mimeType;

  final bool? size;

  final bool? link;

  final bool? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordGroupByOutputTypeMinArgs({this.select});

  final _i2.MediaRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class MediaRecordMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordMaxAggregateOutputTypeSelect({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  final bool? id;

  final bool? type;

  final bool? mimeType;

  final bool? size;

  final bool? link;

  final bool? description;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
  };
}

class MediaRecordGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordGroupByOutputTypeMaxArgs({this.select});

  final _i2.MediaRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class MediaRecordGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const MediaRecordGroupByOutputTypeSelect({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? type;

  final bool? mimeType;

  final bool? size;

  final bool? link;

  final bool? description;

  final _i1.PrismaUnion<bool, _i2.MediaRecordGroupByOutputTypeCountArgs>?
  $count;

  final _i1.PrismaUnion<bool, _i2.MediaRecordGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.MediaRecordGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.MediaRecordGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.MediaRecordGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'mime_type': mimeType,
    'size': size,
    'link': link,
    'description': description,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateMediaRecord {
  const AggregateMediaRecord({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateMediaRecord.fromJson(Map json) => AggregateMediaRecord(
    $count: json['_count'] is Map
        ? _i2.MediaRecordCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.MediaRecordAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.MediaRecordSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.MediaRecordMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.MediaRecordMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.MediaRecordCountAggregateOutputType? $count;

  final _i2.MediaRecordAvgAggregateOutputType? $avg;

  final _i2.MediaRecordSumAggregateOutputType? $sum;

  final _i2.MediaRecordMinAggregateOutputType? $min;

  final _i2.MediaRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateMediaRecordCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateMediaRecordCountArgs({this.select});

  final _i2.MediaRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateMediaRecordAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateMediaRecordAvgArgs({this.select});

  final _i2.MediaRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateMediaRecordSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateMediaRecordSumArgs({this.select});

  final _i2.MediaRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateMediaRecordMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateMediaRecordMinArgs({this.select});

  final _i2.MediaRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateMediaRecordMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateMediaRecordMaxArgs({this.select});

  final _i2.MediaRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateMediaRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateMediaRecordSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateMediaRecordCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateMediaRecordAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateMediaRecordSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateMediaRecordMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateMediaRecordMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class NestedStringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>
  >?
  not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
  };
}

class StringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>
  >?
  not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
  };
}

class FeedRecordWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<
    _i2.FeedRecordWhereInput,
    Iterable<_i2.FeedRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.FeedRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.FeedRecordWhereInput,
    Iterable<_i2.FeedRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? cid;

  final _i1.PrismaUnion<_i2.StringFilter, String>? uri;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final BigInt? id;

  final _i1.PrismaUnion<
    _i2.FeedRecordWhereInput,
    Iterable<_i2.FeedRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.FeedRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.FeedRecordWhereInput,
    Iterable<_i2.FeedRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? cid;

  final _i1.PrismaUnion<_i2.StringFilter, String>? uri;

  final _i1.PrismaUnion<
    _i2.StringNullableFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordSelect({this.id, this.cid, this.uri, this.authorDid});

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

enum NullsOrder implements _i1.PrismaEnum {
  first._('first'),
  last._('last');

  const NullsOrder._(this.name);

  @override
  final String name;
}

class SortOrderInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SortOrderInput({required this.sort, this.nulls});

  final _i2.SortOrder sort;

  final _i2.NullsOrder? nulls;

  @override
  Map<String, dynamic> toJson() => {'sort': sort, 'nulls': nulls};
}

class FeedRecordOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordOrderByWithRelationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

enum FeedRecordScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<BigInt>('id', 'FeedRecord'),
  cid<String>('cid', 'FeedRecord'),
  uri<String>('uri', 'FeedRecord'),
  authorDid<String>('author_did', 'FeedRecord');

  const FeedRecordScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class FeedRecordCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
    this.authorDid,
  });

  final BigInt id;

  final String cid;

  final String uri;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordUncheckedCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
    this.authorDid,
  });

  final BigInt id;

  final String cid;

  final String uri;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class NullableStringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NullableStringFieldUpdateOperationsInput({this.set});

  final _i1.PrismaUnion<String, _i1.PrismaNull>? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class FeedRecordUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordUpdateInput({this.id, this.cid, this.uri, this.authorDid});

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordUncheckedUpdateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordUpdateManyMutationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordUncheckedUpdateManyInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<BigInt, _i2.BigIntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? cid;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? uri;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NullableStringFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordCountAggregateOutputType {
  const FeedRecordCountAggregateOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$all,
  });

  factory FeedRecordCountAggregateOutputType.fromJson(Map json) =>
      FeedRecordCountAggregateOutputType(
        id: json['id'],
        cid: json['cid'],
        uri: json['uri'],
        authorDid: json['author_did'],
        $all: json['_all'],
      );

  final int? id;

  final int? cid;

  final int? uri;

  final int? authorDid;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_all': $all,
  };
}

class FeedRecordAvgAggregateOutputType {
  const FeedRecordAvgAggregateOutputType({this.id});

  factory FeedRecordAvgAggregateOutputType.fromJson(Map json) =>
      FeedRecordAvgAggregateOutputType(id: json['id']);

  final double? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class FeedRecordSumAggregateOutputType {
  const FeedRecordSumAggregateOutputType({this.id});

  factory FeedRecordSumAggregateOutputType.fromJson(Map json) =>
      FeedRecordSumAggregateOutputType(id: json['id']);

  final BigInt? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class FeedRecordMinAggregateOutputType {
  const FeedRecordMinAggregateOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordMinAggregateOutputType.fromJson(Map json) =>
      FeedRecordMinAggregateOutputType(
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

class FeedRecordMaxAggregateOutputType {
  const FeedRecordMaxAggregateOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordMaxAggregateOutputType.fromJson(Map json) =>
      FeedRecordMaxAggregateOutputType(
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

class FeedRecordGroupByOutputType {
  const FeedRecordGroupByOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory FeedRecordGroupByOutputType.fromJson(Map json) =>
      FeedRecordGroupByOutputType(
        id: json['id'],
        cid: json['cid'],
        uri: json['uri'],
        authorDid: json['author_did'],
        $count: json['_count'] is Map
            ? _i2.FeedRecordCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.FeedRecordAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.FeedRecordSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.FeedRecordMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.FeedRecordMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final BigInt? id;

  final String? cid;

  final String? uri;

  final String? authorDid;

  final _i2.FeedRecordCountAggregateOutputType? $count;

  final _i2.FeedRecordAvgAggregateOutputType? $avg;

  final _i2.FeedRecordSumAggregateOutputType? $sum;

  final _i2.FeedRecordMinAggregateOutputType? $min;

  final _i2.FeedRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class FeedRecordCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordCountOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordAvgOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class FeedRecordMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordMaxOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordMinOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i2.SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordSumOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class FeedRecordOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordOrderByWithAggregationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? cid;

  final _i2.SortOrder? uri;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? authorDid;

  final _i2.FeedRecordCountOrderByAggregateInput? $count;

  final _i2.FeedRecordAvgOrderByAggregateInput? $avg;

  final _i2.FeedRecordMaxOrderByAggregateInput? $max;

  final _i2.FeedRecordMinOrderByAggregateInput? $min;

  final _i2.FeedRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class NestedIntNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<
    int,
    _i1.PrismaUnion<_i1.Reference<int>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<int>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<int>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<
    int,
    _i1.PrismaUnion<_i2.NestedIntNullableFilter, _i1.PrismaNull>
  >?
  not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class NestedStringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NestedStringNullableWithAggregatesFilter,
      _i1.PrismaNull
    >
  >?
  not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class StringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
    String,
    _i1.PrismaUnion<
      _i2.NestedStringNullableWithAggregatesFilter,
      _i1.PrismaNull
    >
  >?
  not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'contains': contains,
    'startsWith': startsWith,
    'endsWith': endsWith,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class FeedRecordScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final _i1.PrismaUnion<
    _i2.FeedRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.FeedRecordScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.FeedRecordScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.FeedRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.FeedRecordScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.BigIntWithAggregatesFilter, BigInt>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? cid;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? uri;

  final _i1.PrismaUnion<
    _i2.StringNullableWithAggregatesFilter,
    _i1.PrismaUnion<String, _i1.PrismaNull>
  >?
  authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordCountAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$all,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_all': $all,
  };
}

class FeedRecordGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordGroupByOutputTypeCountArgs({this.select});

  final _i2.FeedRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class FeedRecordAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordAvgAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class FeedRecordGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordGroupByOutputTypeAvgArgs({this.select});

  final _i2.FeedRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class FeedRecordSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordSumAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class FeedRecordGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordGroupByOutputTypeSumArgs({this.select});

  final _i2.FeedRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class FeedRecordMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordMinAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordGroupByOutputTypeMinArgs({this.select});

  final _i2.FeedRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class FeedRecordMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordMaxAggregateOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
  };
}

class FeedRecordGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordGroupByOutputTypeMaxArgs({this.select});

  final _i2.FeedRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class FeedRecordGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const FeedRecordGroupByOutputTypeSelect({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? cid;

  final bool? uri;

  final bool? authorDid;

  final _i1.PrismaUnion<bool, _i2.FeedRecordGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.FeedRecordGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.FeedRecordGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.FeedRecordGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.FeedRecordGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'cid': cid,
    'uri': uri,
    'author_did': authorDid,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateFeedRecord {
  const AggregateFeedRecord({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateFeedRecord.fromJson(Map json) => AggregateFeedRecord(
    $count: json['_count'] is Map
        ? _i2.FeedRecordCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.FeedRecordAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.FeedRecordSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.FeedRecordMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.FeedRecordMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.FeedRecordCountAggregateOutputType? $count;

  final _i2.FeedRecordAvgAggregateOutputType? $avg;

  final _i2.FeedRecordSumAggregateOutputType? $sum;

  final _i2.FeedRecordMinAggregateOutputType? $min;

  final _i2.FeedRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateFeedRecordCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateFeedRecordCountArgs({this.select});

  final _i2.FeedRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateFeedRecordAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateFeedRecordAvgArgs({this.select});

  final _i2.FeedRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateFeedRecordSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateFeedRecordSumArgs({this.select});

  final _i2.FeedRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateFeedRecordMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateFeedRecordMinArgs({this.select});

  final _i2.FeedRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateFeedRecordMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateFeedRecordMaxArgs({this.select});

  final _i2.FeedRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateFeedRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateFeedRecordSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateFeedRecordCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateFeedRecordAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateFeedRecordSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateFeedRecordMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateFeedRecordMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class SessionRecordWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i1.PrismaUnion<
    _i2.SessionRecordWhereInput,
    Iterable<_i2.SessionRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.SessionRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.SessionRecordWhereInput,
    Iterable<_i2.SessionRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? did;

  final _i1.PrismaUnion<_i2.StringFilter, String>? session;

  final _i1.PrismaUnion<_i2.StringFilter, String>? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordWhereUniqueInput({
    this.id,
    this.did,
    this.AND,
    this.OR,
    this.NOT,
    this.session,
    this.pdsUrl,
  });

  final int? id;

  final String? did;

  final _i1.PrismaUnion<
    _i2.SessionRecordWhereInput,
    Iterable<_i2.SessionRecordWhereInput>
  >?
  AND;

  final Iterable<_i2.SessionRecordWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.SessionRecordWhereInput,
    Iterable<_i2.SessionRecordWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? session;

  final _i1.PrismaUnion<_i2.StringFilter, String>? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordSelect({this.id, this.did, this.session, this.pdsUrl});

  final bool? id;

  final bool? did;

  final bool? session;

  final bool? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordOrderByWithRelationInput({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? session;

  final _i2.SortOrder? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

enum SessionRecordScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'SessionRecord'),
  did<String>('did', 'SessionRecord'),
  session<String>('session', 'SessionRecord'),
  pdsUrl<String>('pds_url', 'SessionRecord');

  const SessionRecordScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class SessionRecordCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordCreateInput({
    required this.did,
    required this.session,
    this.pdsUrl,
  });

  final String did;

  final String session;

  final String? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordUncheckedCreateInput({
    this.id,
    required this.did,
    required this.session,
    this.pdsUrl,
  });

  final int? id;

  final String did;

  final String session;

  final String? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordUpdateInput({this.did, this.session, this.pdsUrl});

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? did;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? session;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordUncheckedUpdateInput({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? did;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? session;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordUpdateManyMutationInput({
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? did;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? session;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordUncheckedUpdateManyInput({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? did;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? session;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordCountAggregateOutputType {
  const SessionRecordCountAggregateOutputType({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
    this.$all,
  });

  factory SessionRecordCountAggregateOutputType.fromJson(Map json) =>
      SessionRecordCountAggregateOutputType(
        id: json['id'],
        did: json['did'],
        session: json['session'],
        pdsUrl: json['pds_url'],
        $all: json['_all'],
      );

  final int? id;

  final int? did;

  final int? session;

  final int? pdsUrl;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
    '_all': $all,
  };
}

class SessionRecordAvgAggregateOutputType {
  const SessionRecordAvgAggregateOutputType({this.id});

  factory SessionRecordAvgAggregateOutputType.fromJson(Map json) =>
      SessionRecordAvgAggregateOutputType(id: json['id']);

  final double? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class SessionRecordSumAggregateOutputType {
  const SessionRecordSumAggregateOutputType({this.id});

  factory SessionRecordSumAggregateOutputType.fromJson(Map json) =>
      SessionRecordSumAggregateOutputType(id: json['id']);

  final int? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class SessionRecordMinAggregateOutputType {
  const SessionRecordMinAggregateOutputType({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  factory SessionRecordMinAggregateOutputType.fromJson(Map json) =>
      SessionRecordMinAggregateOutputType(
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

class SessionRecordMaxAggregateOutputType {
  const SessionRecordMaxAggregateOutputType({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  factory SessionRecordMaxAggregateOutputType.fromJson(Map json) =>
      SessionRecordMaxAggregateOutputType(
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

class SessionRecordGroupByOutputType {
  const SessionRecordGroupByOutputType({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory SessionRecordGroupByOutputType.fromJson(Map json) =>
      SessionRecordGroupByOutputType(
        id: json['id'],
        did: json['did'],
        session: json['session'],
        pdsUrl: json['pds_url'],
        $count: json['_count'] is Map
            ? _i2.SessionRecordCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.SessionRecordAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.SessionRecordSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.SessionRecordMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.SessionRecordMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? did;

  final String? session;

  final String? pdsUrl;

  final _i2.SessionRecordCountAggregateOutputType? $count;

  final _i2.SessionRecordAvgAggregateOutputType? $avg;

  final _i2.SessionRecordSumAggregateOutputType? $sum;

  final _i2.SessionRecordMinAggregateOutputType? $min;

  final _i2.SessionRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class SessionRecordCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordCountOrderByAggregateInput({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? session;

  final _i2.SortOrder? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordAvgOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class SessionRecordMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordMaxOrderByAggregateInput({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? session;

  final _i2.SortOrder? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordMinOrderByAggregateInput({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? session;

  final _i2.SortOrder? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordSumOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class SessionRecordOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordOrderByWithAggregationInput({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? did;

  final _i2.SortOrder? session;

  final _i2.SortOrder? pdsUrl;

  final _i2.SessionRecordCountOrderByAggregateInput? $count;

  final _i2.SessionRecordAvgOrderByAggregateInput? $avg;

  final _i2.SessionRecordMaxOrderByAggregateInput? $max;

  final _i2.SessionRecordMinOrderByAggregateInput? $min;

  final _i2.SessionRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class SessionRecordScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final _i1.PrismaUnion<
    _i2.SessionRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.SessionRecordScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.SessionRecordScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.SessionRecordScalarWhereWithAggregatesInput,
    Iterable<_i2.SessionRecordScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? did;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? session;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordCountAggregateOutputTypeSelect({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
    this.$all,
  });

  final bool? id;

  final bool? did;

  final bool? session;

  final bool? pdsUrl;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
    '_all': $all,
  };
}

class SessionRecordGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordGroupByOutputTypeCountArgs({this.select});

  final _i2.SessionRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionRecordAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordAvgAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class SessionRecordGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordGroupByOutputTypeAvgArgs({this.select});

  final _i2.SessionRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionRecordSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordSumAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class SessionRecordGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordGroupByOutputTypeSumArgs({this.select});

  final _i2.SessionRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionRecordMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordMinAggregateOutputTypeSelect({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final bool? id;

  final bool? did;

  final bool? session;

  final bool? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordGroupByOutputTypeMinArgs({this.select});

  final _i2.SessionRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionRecordMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordMaxAggregateOutputTypeSelect({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
  });

  final bool? id;

  final bool? did;

  final bool? session;

  final bool? pdsUrl;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
  };
}

class SessionRecordGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordGroupByOutputTypeMaxArgs({this.select});

  final _i2.SessionRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SessionRecordGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SessionRecordGroupByOutputTypeSelect({
    this.id,
    this.did,
    this.session,
    this.pdsUrl,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? did;

  final bool? session;

  final bool? pdsUrl;

  final _i1.PrismaUnion<bool, _i2.SessionRecordGroupByOutputTypeCountArgs>?
  $count;

  final _i1.PrismaUnion<bool, _i2.SessionRecordGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.SessionRecordGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.SessionRecordGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.SessionRecordGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'did': did,
    'session': session,
    'pds_url': pdsUrl,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateSessionRecord {
  const AggregateSessionRecord({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateSessionRecord.fromJson(Map json) => AggregateSessionRecord(
    $count: json['_count'] is Map
        ? _i2.SessionRecordCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.SessionRecordAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.SessionRecordSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.SessionRecordMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.SessionRecordMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.SessionRecordCountAggregateOutputType? $count;

  final _i2.SessionRecordAvgAggregateOutputType? $avg;

  final _i2.SessionRecordSumAggregateOutputType? $sum;

  final _i2.SessionRecordMinAggregateOutputType? $min;

  final _i2.SessionRecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateSessionRecordCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionRecordCountArgs({this.select});

  final _i2.SessionRecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionRecordAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionRecordAvgArgs({this.select});

  final _i2.SessionRecordAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionRecordSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionRecordSumArgs({this.select});

  final _i2.SessionRecordSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionRecordMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionRecordMinArgs({this.select});

  final _i2.SessionRecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionRecordMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionRecordMaxArgs({this.select});

  final _i2.SessionRecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSessionRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSessionRecordSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateSessionRecordCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateSessionRecordAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateSessionRecordSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateSessionRecordMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateSessionRecordMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class NestedDateTimeNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedDateTimeNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<_i1.Reference<DateTime>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<_i2.NestedDateTimeNullableFilter, _i1.PrismaNull>
  >?
  not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class DateTimeNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<_i1.Reference<DateTime>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<_i2.NestedDateTimeNullableFilter, _i1.PrismaNull>
  >?
  not;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
  };
}

class AuthRateLimitWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i1.PrismaUnion<
    _i2.AuthRateLimitWhereInput,
    Iterable<_i2.AuthRateLimitWhereInput>
  >?
  AND;

  final Iterable<_i2.AuthRateLimitWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.AuthRateLimitWhereInput,
    Iterable<_i2.AuthRateLimitWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? ipAddress;

  final _i1.PrismaUnion<_i2.IntFilter, int>? attempts;

  final _i1.PrismaUnion<
    _i2.DateTimeNullableFilter,
    _i1.PrismaUnion<DateTime, _i1.PrismaNull>
  >?
  lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitWhereUniqueInput({
    this.id,
    this.ipAddress,
    this.AND,
    this.OR,
    this.NOT,
    this.attempts,
    this.lastAttempt,
  });

  final int? id;

  final String? ipAddress;

  final _i1.PrismaUnion<
    _i2.AuthRateLimitWhereInput,
    Iterable<_i2.AuthRateLimitWhereInput>
  >?
  AND;

  final Iterable<_i2.AuthRateLimitWhereInput>? OR;

  final _i1.PrismaUnion<
    _i2.AuthRateLimitWhereInput,
    Iterable<_i2.AuthRateLimitWhereInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? attempts;

  final _i1.PrismaUnion<
    _i2.DateTimeNullableFilter,
    _i1.PrismaUnion<DateTime, _i1.PrismaNull>
  >?
  lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitSelect({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final bool? id;

  final bool? ipAddress;

  final bool? attempts;

  final bool? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitOrderByWithRelationInput({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? ipAddress;

  final _i2.SortOrder? attempts;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

enum AuthRateLimitScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'AuthRateLimit'),
  ipAddress<String>('ip_address', 'AuthRateLimit'),
  attempts<int>('attempts', 'AuthRateLimit'),
  lastAttempt<DateTime>('last_attempt', 'AuthRateLimit');

  const AuthRateLimitScalar(this.name, this.model);

  @override
  final String name;

  @override
  final String model;
}

class AuthRateLimitCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitCreateInput({
    required this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final String ipAddress;

  final int? attempts;

  final _i1.PrismaUnion<DateTime, _i1.PrismaNull>? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitUncheckedCreateInput({
    this.id,
    required this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final int? id;

  final String ipAddress;

  final int? attempts;

  final _i1.PrismaUnion<DateTime, _i1.PrismaNull>? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class NullableDateTimeFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NullableDateTimeFieldUpdateOperationsInput({this.set});

  final _i1.PrismaUnion<DateTime, _i1.PrismaNull>? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class AuthRateLimitUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitUpdateInput({
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  ipAddress;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? attempts;

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<
      _i2.NullableDateTimeFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitUncheckedUpdateInput({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  ipAddress;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? attempts;

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<
      _i2.NullableDateTimeFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitUpdateManyMutationInput({
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  ipAddress;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? attempts;

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<
      _i2.NullableDateTimeFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitUncheckedUpdateManyInput({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
  ipAddress;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? attempts;

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<
      _i2.NullableDateTimeFieldUpdateOperationsInput,
      _i1.PrismaNull
    >
  >?
  lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitCountAggregateOutputType {
  const AuthRateLimitCountAggregateOutputType({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
    this.$all,
  });

  factory AuthRateLimitCountAggregateOutputType.fromJson(Map json) =>
      AuthRateLimitCountAggregateOutputType(
        id: json['id'],
        ipAddress: json['ip_address'],
        attempts: json['attempts'],
        lastAttempt: json['last_attempt'],
        $all: json['_all'],
      );

  final int? id;

  final int? ipAddress;

  final int? attempts;

  final int? lastAttempt;

  final int? $all;

  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
    '_all': $all,
  };
}

class AuthRateLimitAvgAggregateOutputType {
  const AuthRateLimitAvgAggregateOutputType({this.id, this.attempts});

  factory AuthRateLimitAvgAggregateOutputType.fromJson(Map json) =>
      AuthRateLimitAvgAggregateOutputType(
        id: json['id'],
        attempts: json['attempts'],
      );

  final double? id;

  final double? attempts;

  Map<String, dynamic> toJson() => {'id': id, 'attempts': attempts};
}

class AuthRateLimitSumAggregateOutputType {
  const AuthRateLimitSumAggregateOutputType({this.id, this.attempts});

  factory AuthRateLimitSumAggregateOutputType.fromJson(Map json) =>
      AuthRateLimitSumAggregateOutputType(
        id: json['id'],
        attempts: json['attempts'],
      );

  final int? id;

  final int? attempts;

  Map<String, dynamic> toJson() => {'id': id, 'attempts': attempts};
}

class AuthRateLimitMinAggregateOutputType {
  const AuthRateLimitMinAggregateOutputType({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  factory AuthRateLimitMinAggregateOutputType.fromJson(Map json) =>
      AuthRateLimitMinAggregateOutputType(
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

class AuthRateLimitMaxAggregateOutputType {
  const AuthRateLimitMaxAggregateOutputType({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  factory AuthRateLimitMaxAggregateOutputType.fromJson(Map json) =>
      AuthRateLimitMaxAggregateOutputType(
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

class AuthRateLimitGroupByOutputType {
  const AuthRateLimitGroupByOutputType({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AuthRateLimitGroupByOutputType.fromJson(Map json) =>
      AuthRateLimitGroupByOutputType(
        id: json['id'],
        ipAddress: json['ip_address'],
        attempts: json['attempts'],
        lastAttempt: switch (json['last_attempt']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['last_attempt'],
        },
        $count: json['_count'] is Map
            ? _i2.AuthRateLimitCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.AuthRateLimitAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.AuthRateLimitSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.AuthRateLimitMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.AuthRateLimitMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? ipAddress;

  final int? attempts;

  final DateTime? lastAttempt;

  final _i2.AuthRateLimitCountAggregateOutputType? $count;

  final _i2.AuthRateLimitAvgAggregateOutputType? $avg;

  final _i2.AuthRateLimitSumAggregateOutputType? $sum;

  final _i2.AuthRateLimitMinAggregateOutputType? $min;

  final _i2.AuthRateLimitMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt?.toIso8601String(),
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AuthRateLimitCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitCountOrderByAggregateInput({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? ipAddress;

  final _i2.SortOrder? attempts;

  final _i2.SortOrder? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitAvgOrderByAggregateInput({this.id, this.attempts});

  final _i2.SortOrder? id;

  final _i2.SortOrder? attempts;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'attempts': attempts};
}

class AuthRateLimitMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitMaxOrderByAggregateInput({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? ipAddress;

  final _i2.SortOrder? attempts;

  final _i2.SortOrder? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitMinOrderByAggregateInput({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? ipAddress;

  final _i2.SortOrder? attempts;

  final _i2.SortOrder? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitSumOrderByAggregateInput({this.id, this.attempts});

  final _i2.SortOrder? id;

  final _i2.SortOrder? attempts;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'attempts': attempts};
}

class AuthRateLimitOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitOrderByWithAggregationInput({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? ipAddress;

  final _i2.SortOrder? attempts;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? lastAttempt;

  final _i2.AuthRateLimitCountOrderByAggregateInput? $count;

  final _i2.AuthRateLimitAvgOrderByAggregateInput? $avg;

  final _i2.AuthRateLimitMaxOrderByAggregateInput? $max;

  final _i2.AuthRateLimitMinOrderByAggregateInput? $min;

  final _i2.AuthRateLimitSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
    '_count': $count,
    '_avg': $avg,
    '_max': $max,
    '_min': $min,
    '_sum': $sum,
  };
}

class NestedDateTimeNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedDateTimeNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<_i1.Reference<DateTime>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<
      _i2.NestedDateTimeNullableWithAggregatesFilter,
      _i1.PrismaNull
    >
  >?
  not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedDateTimeNullableFilter? $min;

  final _i2.NestedDateTimeNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class DateTimeNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<_i1.Reference<DateTime>, _i1.PrismaNull>
  >?
  equals;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<DateTime>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<
    DateTime,
    _i1.PrismaUnion<
      _i2.NestedDateTimeNullableWithAggregatesFilter,
      _i1.PrismaNull
    >
  >?
  not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedDateTimeNullableFilter? $min;

  final _i2.NestedDateTimeNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
    'equals': equals,
    'in': $in,
    'notIn': notIn,
    'lt': lt,
    'lte': lte,
    'gt': gt,
    'gte': gte,
    'not': not,
    '_count': $count,
    '_min': $min,
    '_max': $max,
  };
}

class AuthRateLimitScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final _i1.PrismaUnion<
    _i2.AuthRateLimitScalarWhereWithAggregatesInput,
    Iterable<_i2.AuthRateLimitScalarWhereWithAggregatesInput>
  >?
  AND;

  final Iterable<_i2.AuthRateLimitScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<
    _i2.AuthRateLimitScalarWhereWithAggregatesInput,
    Iterable<_i2.AuthRateLimitScalarWhereWithAggregatesInput>
  >?
  NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? ipAddress;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? attempts;

  final _i1.PrismaUnion<
    _i2.DateTimeNullableWithAggregatesFilter,
    _i1.PrismaUnion<DateTime, _i1.PrismaNull>
  >?
  lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'AND': AND,
    'OR': OR,
    'NOT': NOT,
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitCountAggregateOutputTypeSelect({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
    this.$all,
  });

  final bool? id;

  final bool? ipAddress;

  final bool? attempts;

  final bool? lastAttempt;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
    '_all': $all,
  };
}

class AuthRateLimitGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitGroupByOutputTypeCountArgs({this.select});

  final _i2.AuthRateLimitCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AuthRateLimitAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitAvgAggregateOutputTypeSelect({this.id, this.attempts});

  final bool? id;

  final bool? attempts;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'attempts': attempts};
}

class AuthRateLimitGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitGroupByOutputTypeAvgArgs({this.select});

  final _i2.AuthRateLimitAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AuthRateLimitSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitSumAggregateOutputTypeSelect({this.id, this.attempts});

  final bool? id;

  final bool? attempts;

  @override
  Map<String, dynamic> toJson() => {'id': id, 'attempts': attempts};
}

class AuthRateLimitGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitGroupByOutputTypeSumArgs({this.select});

  final _i2.AuthRateLimitSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AuthRateLimitMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitMinAggregateOutputTypeSelect({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final bool? id;

  final bool? ipAddress;

  final bool? attempts;

  final bool? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitGroupByOutputTypeMinArgs({this.select});

  final _i2.AuthRateLimitMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AuthRateLimitMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitMaxAggregateOutputTypeSelect({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
  });

  final bool? id;

  final bool? ipAddress;

  final bool? attempts;

  final bool? lastAttempt;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
  };
}

class AuthRateLimitGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitGroupByOutputTypeMaxArgs({this.select});

  final _i2.AuthRateLimitMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AuthRateLimitGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AuthRateLimitGroupByOutputTypeSelect({
    this.id,
    this.ipAddress,
    this.attempts,
    this.lastAttempt,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? ipAddress;

  final bool? attempts;

  final bool? lastAttempt;

  final _i1.PrismaUnion<bool, _i2.AuthRateLimitGroupByOutputTypeCountArgs>?
  $count;

  final _i1.PrismaUnion<bool, _i2.AuthRateLimitGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AuthRateLimitGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AuthRateLimitGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AuthRateLimitGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'ip_address': ipAddress,
    'attempts': attempts,
    'last_attempt': lastAttempt,
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}

class AggregateAuthRateLimit {
  const AggregateAuthRateLimit({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateAuthRateLimit.fromJson(Map json) => AggregateAuthRateLimit(
    $count: json['_count'] is Map
        ? _i2.AuthRateLimitCountAggregateOutputType.fromJson(json['_count'])
        : null,
    $avg: json['_avg'] is Map
        ? _i2.AuthRateLimitAvgAggregateOutputType.fromJson(json['_avg'])
        : null,
    $sum: json['_sum'] is Map
        ? _i2.AuthRateLimitSumAggregateOutputType.fromJson(json['_sum'])
        : null,
    $min: json['_min'] is Map
        ? _i2.AuthRateLimitMinAggregateOutputType.fromJson(json['_min'])
        : null,
    $max: json['_max'] is Map
        ? _i2.AuthRateLimitMaxAggregateOutputType.fromJson(json['_max'])
        : null,
  );

  final _i2.AuthRateLimitCountAggregateOutputType? $count;

  final _i2.AuthRateLimitAvgAggregateOutputType? $avg;

  final _i2.AuthRateLimitSumAggregateOutputType? $sum;

  final _i2.AuthRateLimitMinAggregateOutputType? $min;

  final _i2.AuthRateLimitMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
    '_count': $count?.toJson(),
    '_avg': $avg?.toJson(),
    '_sum': $sum?.toJson(),
    '_min': $min?.toJson(),
    '_max': $max?.toJson(),
  };
}

class AggregateAuthRateLimitCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAuthRateLimitCountArgs({this.select});

  final _i2.AuthRateLimitCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAuthRateLimitAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAuthRateLimitAvgArgs({this.select});

  final _i2.AuthRateLimitAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAuthRateLimitSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAuthRateLimitSumArgs({this.select});

  final _i2.AuthRateLimitSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAuthRateLimitMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAuthRateLimitMinArgs({this.select});

  final _i2.AuthRateLimitMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAuthRateLimitMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAuthRateLimitMaxArgs({this.select});

  final _i2.AuthRateLimitMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateAuthRateLimitSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateAuthRateLimitSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateAuthRateLimitCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateAuthRateLimitAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateAuthRateLimitSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateAuthRateLimitMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateAuthRateLimitMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
    '_count': $count,
    '_avg': $avg,
    '_sum': $sum,
    '_min': $min,
    '_max': $max,
  };
}
