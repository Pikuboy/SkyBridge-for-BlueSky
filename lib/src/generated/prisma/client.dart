// ignore_for_file: argument_type_not_assignable, not_enough_positional_arguments
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:orm/dmmf.dart' as _i4;
import 'package:orm/engines/binary.dart' as _i5;
import 'package:orm/orm.dart' as _i1;

import 'model.dart' as _i2;
import 'prisma.dart' as _i3;

class UserRecordDelegate {
  const UserRecordDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.UserRecord?> findUnique({
    required _i3.UserRecordWhereUniqueInput where,
    _i3.UserRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.UserRecord?>(
      action: 'findUniqueUserRecord',
      result: result,
      factory: (e) => e != null ? _i2.UserRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.UserRecord> findUniqueOrThrow({
    required _i3.UserRecordWhereUniqueInput where,
    _i3.UserRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.UserRecord>(
      action: 'findUniqueUserRecordOrThrow',
      result: result,
      factory: (e) => _i2.UserRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.UserRecord?> findFirst({
    _i3.UserRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.UserRecordOrderByWithRelationInput>,
      _i3.UserRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.UserRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.UserRecordScalar, Iterable<_i3.UserRecordScalar>>?
    distinct,
    _i3.UserRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.UserRecord?>(
      action: 'findFirstUserRecord',
      result: result,
      factory: (e) => e != null ? _i2.UserRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.UserRecord> findFirstOrThrow({
    _i3.UserRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.UserRecordOrderByWithRelationInput>,
      _i3.UserRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.UserRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.UserRecordScalar, Iterable<_i3.UserRecordScalar>>?
    distinct,
    _i3.UserRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.UserRecord>(
      action: 'findFirstUserRecordOrThrow',
      result: result,
      factory: (e) => _i2.UserRecord.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.UserRecord>> findMany({
    _i3.UserRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.UserRecordOrderByWithRelationInput>,
      _i3.UserRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.UserRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.UserRecordScalar, Iterable<_i3.UserRecordScalar>>?
    distinct,
    _i3.UserRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.UserRecord>>(
      action: 'findManyUserRecord',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.UserRecord.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.UserRecord> create({
    required _i1.PrismaUnion<
      _i3.UserRecordCreateInput,
      _i3.UserRecordUncheckedCreateInput
    >
    data,
    _i3.UserRecordSelect? select,
  }) {
    final args = {'data': data, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.UserRecord>(
      action: 'createOneUserRecord',
      result: result,
      factory: (e) => _i2.UserRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.UserRecord?> update({
    required _i1.PrismaUnion<
      _i3.UserRecordUpdateInput,
      _i3.UserRecordUncheckedUpdateInput
    >
    data,
    required _i3.UserRecordWhereUniqueInput where,
    _i3.UserRecordSelect? select,
  }) {
    final args = {'data': data, 'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.UserRecord?>(
      action: 'updateOneUserRecord',
      result: result,
      factory: (e) => e != null ? _i2.UserRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.UserRecordUpdateManyMutationInput,
      _i3.UserRecordUncheckedUpdateManyInput
    >
    data,
    _i3.UserRecordWhereInput? where,
  }) {
    final args = {'data': data, 'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyUserRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.UserRecord> upsert({
    required _i3.UserRecordWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.UserRecordCreateInput,
      _i3.UserRecordUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.UserRecordUpdateInput,
      _i3.UserRecordUncheckedUpdateInput
    >
    update,
    _i3.UserRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.UserRecord>(
      action: 'upsertOneUserRecord',
      result: result,
      factory: (e) => _i2.UserRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.UserRecord?> delete({
    required _i3.UserRecordWhereUniqueInput where,
    _i3.UserRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.UserRecord?>(
      action: 'deleteOneUserRecord',
      result: result,
      factory: (e) => e != null ? _i2.UserRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.UserRecordWhereInput? where,
  }) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyUserRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.UserRecordGroupByOutputType>> groupBy({
    _i3.UserRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.UserRecordOrderByWithAggregationInput>,
      _i3.UserRecordOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.UserRecordScalar>,
      _i3.UserRecordScalar
    >
    by,
    _i3.UserRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.UserRecordGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.UserRecordGroupByOutputType>>(
      action: 'groupByUserRecord',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.UserRecordGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateUserRecord> aggregate({
    _i3.UserRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.UserRecordOrderByWithRelationInput>,
      _i3.UserRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.UserRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateUserRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'UserRecord',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateUserRecord>(
      action: 'aggregateUserRecord',
      result: result,
      factory: (e) => _i3.AggregateUserRecord.fromJson(e),
    );
  }
}

class PostRecordDelegate {
  const PostRecordDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.PostRecord?> findUnique({
    required _i3.PostRecordWhereUniqueInput where,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.PostRecord?>(
      action: 'findUniquePostRecord',
      result: result,
      factory: (e) => e != null ? _i2.PostRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.PostRecord> findUniqueOrThrow({
    required _i3.PostRecordWhereUniqueInput where,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.PostRecord>(
      action: 'findUniquePostRecordOrThrow',
      result: result,
      factory: (e) => _i2.PostRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.PostRecord?> findFirst({
    _i3.PostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.PostRecordOrderByWithRelationInput>,
      _i3.PostRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.PostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.PostRecordScalar, Iterable<_i3.PostRecordScalar>>?
    distinct,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.PostRecord?>(
      action: 'findFirstPostRecord',
      result: result,
      factory: (e) => e != null ? _i2.PostRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.PostRecord> findFirstOrThrow({
    _i3.PostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.PostRecordOrderByWithRelationInput>,
      _i3.PostRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.PostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.PostRecordScalar, Iterable<_i3.PostRecordScalar>>?
    distinct,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.PostRecord>(
      action: 'findFirstPostRecordOrThrow',
      result: result,
      factory: (e) => _i2.PostRecord.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.PostRecord>> findMany({
    _i3.PostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.PostRecordOrderByWithRelationInput>,
      _i3.PostRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.PostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.PostRecordScalar, Iterable<_i3.PostRecordScalar>>?
    distinct,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.PostRecord>>(
      action: 'findManyPostRecord',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.PostRecord.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.PostRecord> create({
    required _i1.PrismaUnion<
      _i3.PostRecordCreateInput,
      _i3.PostRecordUncheckedCreateInput
    >
    data,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {'data': data, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.PostRecord>(
      action: 'createOnePostRecord',
      result: result,
      factory: (e) => _i2.PostRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.PostRecord?> update({
    required _i1.PrismaUnion<
      _i3.PostRecordUpdateInput,
      _i3.PostRecordUncheckedUpdateInput
    >
    data,
    required _i3.PostRecordWhereUniqueInput where,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.PostRecord?>(
      action: 'updateOnePostRecord',
      result: result,
      factory: (e) => e != null ? _i2.PostRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.PostRecordUpdateManyMutationInput,
      _i3.PostRecordUncheckedUpdateManyInput
    >
    data,
    _i3.PostRecordWhereInput? where,
  }) {
    final args = {'data': data, 'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyPostRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.PostRecord> upsert({
    required _i3.PostRecordWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.PostRecordCreateInput,
      _i3.PostRecordUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.PostRecordUpdateInput,
      _i3.PostRecordUncheckedUpdateInput
    >
    update,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.PostRecord>(
      action: 'upsertOnePostRecord',
      result: result,
      factory: (e) => _i2.PostRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.PostRecord?> delete({
    required _i3.PostRecordWhereUniqueInput where,
    _i3.PostRecordSelect? select,
    _i3.PostRecordInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.PostRecord?>(
      action: 'deleteOnePostRecord',
      result: result,
      factory: (e) => e != null ? _i2.PostRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.PostRecordWhereInput? where,
  }) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyPostRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.PostRecordGroupByOutputType>> groupBy({
    _i3.PostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.PostRecordOrderByWithAggregationInput>,
      _i3.PostRecordOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.PostRecordScalar>,
      _i3.PostRecordScalar
    >
    by,
    _i3.PostRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.PostRecordGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.PostRecordGroupByOutputType>>(
      action: 'groupByPostRecord',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.PostRecordGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregatePostRecord> aggregate({
    _i3.PostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.PostRecordOrderByWithRelationInput>,
      _i3.PostRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.PostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregatePostRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'PostRecord',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregatePostRecord>(
      action: 'aggregatePostRecord',
      result: result,
      factory: (e) => _i3.AggregatePostRecord.fromJson(e),
    );
  }
}

class RepostRecordDelegate {
  const RepostRecordDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.RepostRecord?> findUnique({
    required _i3.RepostRecordWhereUniqueInput where,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.RepostRecord?>(
      action: 'findUniqueRepostRecord',
      result: result,
      factory: (e) => e != null ? _i2.RepostRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.RepostRecord> findUniqueOrThrow({
    required _i3.RepostRecordWhereUniqueInput where,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.RepostRecord>(
      action: 'findUniqueRepostRecordOrThrow',
      result: result,
      factory: (e) => _i2.RepostRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.RepostRecord?> findFirst({
    _i3.RepostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.RepostRecordOrderByWithRelationInput>,
      _i3.RepostRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.RepostRecordScalar, Iterable<_i3.RepostRecordScalar>>?
    distinct,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.RepostRecord?>(
      action: 'findFirstRepostRecord',
      result: result,
      factory: (e) => e != null ? _i2.RepostRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.RepostRecord> findFirstOrThrow({
    _i3.RepostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.RepostRecordOrderByWithRelationInput>,
      _i3.RepostRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.RepostRecordScalar, Iterable<_i3.RepostRecordScalar>>?
    distinct,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.RepostRecord>(
      action: 'findFirstRepostRecordOrThrow',
      result: result,
      factory: (e) => _i2.RepostRecord.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.RepostRecord>> findMany({
    _i3.RepostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.RepostRecordOrderByWithRelationInput>,
      _i3.RepostRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.RepostRecordScalar, Iterable<_i3.RepostRecordScalar>>?
    distinct,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.RepostRecord>>(
      action: 'findManyRepostRecord',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.RepostRecord.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.RepostRecord> create({
    required _i1.PrismaUnion<
      _i3.RepostRecordCreateInput,
      _i3.RepostRecordUncheckedCreateInput
    >
    data,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {'data': data, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.RepostRecord>(
      action: 'createOneRepostRecord',
      result: result,
      factory: (e) => _i2.RepostRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.RepostRecord?> update({
    required _i1.PrismaUnion<
      _i3.RepostRecordUpdateInput,
      _i3.RepostRecordUncheckedUpdateInput
    >
    data,
    required _i3.RepostRecordWhereUniqueInput where,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.RepostRecord?>(
      action: 'updateOneRepostRecord',
      result: result,
      factory: (e) => e != null ? _i2.RepostRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.RepostRecordUpdateManyMutationInput,
      _i3.RepostRecordUncheckedUpdateManyInput
    >
    data,
    _i3.RepostRecordWhereInput? where,
  }) {
    final args = {'data': data, 'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyRepostRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.RepostRecord> upsert({
    required _i3.RepostRecordWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.RepostRecordCreateInput,
      _i3.RepostRecordUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.RepostRecordUpdateInput,
      _i3.RepostRecordUncheckedUpdateInput
    >
    update,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.RepostRecord>(
      action: 'upsertOneRepostRecord',
      result: result,
      factory: (e) => _i2.RepostRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.RepostRecord?> delete({
    required _i3.RepostRecordWhereUniqueInput where,
    _i3.RepostRecordSelect? select,
    _i3.RepostRecordInclude? include,
  }) {
    final args = {'where': where, 'select': select, 'include': include};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.RepostRecord?>(
      action: 'deleteOneRepostRecord',
      result: result,
      factory: (e) => e != null ? _i2.RepostRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.RepostRecordWhereInput? where,
  }) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyRepostRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.RepostRecordGroupByOutputType>> groupBy({
    _i3.RepostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.RepostRecordOrderByWithAggregationInput>,
      _i3.RepostRecordOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.RepostRecordScalar>,
      _i3.RepostRecordScalar
    >
    by,
    _i3.RepostRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.RepostRecordGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.RepostRecordGroupByOutputType>>(
      action: 'groupByRepostRecord',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.RepostRecordGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateRepostRecord> aggregate({
    _i3.RepostRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.RepostRecordOrderByWithRelationInput>,
      _i3.RepostRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateRepostRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'RepostRecord',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateRepostRecord>(
      action: 'aggregateRepostRecord',
      result: result,
      factory: (e) => _i3.AggregateRepostRecord.fromJson(e),
    );
  }
}

class NotificationRecordDelegate {
  const NotificationRecordDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.NotificationRecord?> findUnique({
    required _i3.NotificationRecordWhereUniqueInput where,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.NotificationRecord?>(
      action: 'findUniqueNotificationRecord',
      result: result,
      factory: (e) => e != null ? _i2.NotificationRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.NotificationRecord> findUniqueOrThrow({
    required _i3.NotificationRecordWhereUniqueInput where,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.NotificationRecord>(
      action: 'findUniqueNotificationRecordOrThrow',
      result: result,
      factory: (e) => _i2.NotificationRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.NotificationRecord?> findFirst({
    _i3.NotificationRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.NotificationRecordOrderByWithRelationInput>,
      _i3.NotificationRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.NotificationRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<
      _i3.NotificationRecordScalar,
      Iterable<_i3.NotificationRecordScalar>
    >?
    distinct,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.NotificationRecord?>(
      action: 'findFirstNotificationRecord',
      result: result,
      factory: (e) => e != null ? _i2.NotificationRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.NotificationRecord> findFirstOrThrow({
    _i3.NotificationRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.NotificationRecordOrderByWithRelationInput>,
      _i3.NotificationRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.NotificationRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<
      _i3.NotificationRecordScalar,
      Iterable<_i3.NotificationRecordScalar>
    >?
    distinct,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.NotificationRecord>(
      action: 'findFirstNotificationRecordOrThrow',
      result: result,
      factory: (e) => _i2.NotificationRecord.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.NotificationRecord>> findMany({
    _i3.NotificationRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.NotificationRecordOrderByWithRelationInput>,
      _i3.NotificationRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.NotificationRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<
      _i3.NotificationRecordScalar,
      Iterable<_i3.NotificationRecordScalar>
    >?
    distinct,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.NotificationRecord>>(
      action: 'findManyNotificationRecord',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.NotificationRecord.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.NotificationRecord> create({
    required _i1.PrismaUnion<
      _i3.NotificationRecordCreateInput,
      _i3.NotificationRecordUncheckedCreateInput
    >
    data,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {'data': data, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.NotificationRecord>(
      action: 'createOneNotificationRecord',
      result: result,
      factory: (e) => _i2.NotificationRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.NotificationRecord?> update({
    required _i1.PrismaUnion<
      _i3.NotificationRecordUpdateInput,
      _i3.NotificationRecordUncheckedUpdateInput
    >
    data,
    required _i3.NotificationRecordWhereUniqueInput where,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {'data': data, 'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.NotificationRecord?>(
      action: 'updateOneNotificationRecord',
      result: result,
      factory: (e) => e != null ? _i2.NotificationRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.NotificationRecordUpdateManyMutationInput,
      _i3.NotificationRecordUncheckedUpdateManyInput
    >
    data,
    _i3.NotificationRecordWhereInput? where,
  }) {
    final args = {'data': data, 'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyNotificationRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.NotificationRecord> upsert({
    required _i3.NotificationRecordWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.NotificationRecordCreateInput,
      _i3.NotificationRecordUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.NotificationRecordUpdateInput,
      _i3.NotificationRecordUncheckedUpdateInput
    >
    update,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.NotificationRecord>(
      action: 'upsertOneNotificationRecord',
      result: result,
      factory: (e) => _i2.NotificationRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.NotificationRecord?> delete({
    required _i3.NotificationRecordWhereUniqueInput where,
    _i3.NotificationRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.NotificationRecord?>(
      action: 'deleteOneNotificationRecord',
      result: result,
      factory: (e) => e != null ? _i2.NotificationRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.NotificationRecordWhereInput? where,
  }) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyNotificationRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.NotificationRecordGroupByOutputType>> groupBy({
    _i3.NotificationRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.NotificationRecordOrderByWithAggregationInput>,
      _i3.NotificationRecordOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.NotificationRecordScalar>,
      _i3.NotificationRecordScalar
    >
    by,
    _i3.NotificationRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.NotificationRecordGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.NotificationRecordGroupByOutputType>>(
      action: 'groupByNotificationRecord',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.NotificationRecordGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateNotificationRecord> aggregate({
    _i3.NotificationRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.NotificationRecordOrderByWithRelationInput>,
      _i3.NotificationRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.NotificationRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateNotificationRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'NotificationRecord',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateNotificationRecord>(
      action: 'aggregateNotificationRecord',
      result: result,
      factory: (e) => _i3.AggregateNotificationRecord.fromJson(e),
    );
  }
}

class MediaRecordDelegate {
  const MediaRecordDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.MediaRecord?> findUnique({
    required _i3.MediaRecordWhereUniqueInput where,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.MediaRecord?>(
      action: 'findUniqueMediaRecord',
      result: result,
      factory: (e) => e != null ? _i2.MediaRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.MediaRecord> findUniqueOrThrow({
    required _i3.MediaRecordWhereUniqueInput where,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.MediaRecord>(
      action: 'findUniqueMediaRecordOrThrow',
      result: result,
      factory: (e) => _i2.MediaRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.MediaRecord?> findFirst({
    _i3.MediaRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.MediaRecordOrderByWithRelationInput>,
      _i3.MediaRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.MediaRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.MediaRecordScalar, Iterable<_i3.MediaRecordScalar>>?
    distinct,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.MediaRecord?>(
      action: 'findFirstMediaRecord',
      result: result,
      factory: (e) => e != null ? _i2.MediaRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.MediaRecord> findFirstOrThrow({
    _i3.MediaRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.MediaRecordOrderByWithRelationInput>,
      _i3.MediaRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.MediaRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.MediaRecordScalar, Iterable<_i3.MediaRecordScalar>>?
    distinct,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.MediaRecord>(
      action: 'findFirstMediaRecordOrThrow',
      result: result,
      factory: (e) => _i2.MediaRecord.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.MediaRecord>> findMany({
    _i3.MediaRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.MediaRecordOrderByWithRelationInput>,
      _i3.MediaRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.MediaRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.MediaRecordScalar, Iterable<_i3.MediaRecordScalar>>?
    distinct,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.MediaRecord>>(
      action: 'findManyMediaRecord',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.MediaRecord.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.MediaRecord> create({
    required _i1.PrismaUnion<
      _i3.MediaRecordCreateInput,
      _i3.MediaRecordUncheckedCreateInput
    >
    data,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {'data': data, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.MediaRecord>(
      action: 'createOneMediaRecord',
      result: result,
      factory: (e) => _i2.MediaRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.MediaRecord?> update({
    required _i1.PrismaUnion<
      _i3.MediaRecordUpdateInput,
      _i3.MediaRecordUncheckedUpdateInput
    >
    data,
    required _i3.MediaRecordWhereUniqueInput where,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {'data': data, 'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.MediaRecord?>(
      action: 'updateOneMediaRecord',
      result: result,
      factory: (e) => e != null ? _i2.MediaRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.MediaRecordUpdateManyMutationInput,
      _i3.MediaRecordUncheckedUpdateManyInput
    >
    data,
    _i3.MediaRecordWhereInput? where,
  }) {
    final args = {'data': data, 'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyMediaRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.MediaRecord> upsert({
    required _i3.MediaRecordWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.MediaRecordCreateInput,
      _i3.MediaRecordUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.MediaRecordUpdateInput,
      _i3.MediaRecordUncheckedUpdateInput
    >
    update,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.MediaRecord>(
      action: 'upsertOneMediaRecord',
      result: result,
      factory: (e) => _i2.MediaRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.MediaRecord?> delete({
    required _i3.MediaRecordWhereUniqueInput where,
    _i3.MediaRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.MediaRecord?>(
      action: 'deleteOneMediaRecord',
      result: result,
      factory: (e) => e != null ? _i2.MediaRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.MediaRecordWhereInput? where,
  }) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyMediaRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.MediaRecordGroupByOutputType>> groupBy({
    _i3.MediaRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.MediaRecordOrderByWithAggregationInput>,
      _i3.MediaRecordOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.MediaRecordScalar>,
      _i3.MediaRecordScalar
    >
    by,
    _i3.MediaRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.MediaRecordGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.MediaRecordGroupByOutputType>>(
      action: 'groupByMediaRecord',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.MediaRecordGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateMediaRecord> aggregate({
    _i3.MediaRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.MediaRecordOrderByWithRelationInput>,
      _i3.MediaRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.MediaRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateMediaRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'MediaRecord',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateMediaRecord>(
      action: 'aggregateMediaRecord',
      result: result,
      factory: (e) => _i3.AggregateMediaRecord.fromJson(e),
    );
  }
}

class FeedRecordDelegate {
  const FeedRecordDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.FeedRecord?> findUnique({
    required _i3.FeedRecordWhereUniqueInput where,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.FeedRecord?>(
      action: 'findUniqueFeedRecord',
      result: result,
      factory: (e) => e != null ? _i2.FeedRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.FeedRecord> findUniqueOrThrow({
    required _i3.FeedRecordWhereUniqueInput where,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.FeedRecord>(
      action: 'findUniqueFeedRecordOrThrow',
      result: result,
      factory: (e) => _i2.FeedRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.FeedRecord?> findFirst({
    _i3.FeedRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.FeedRecordOrderByWithRelationInput>,
      _i3.FeedRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.FeedRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.FeedRecordScalar, Iterable<_i3.FeedRecordScalar>>?
    distinct,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.FeedRecord?>(
      action: 'findFirstFeedRecord',
      result: result,
      factory: (e) => e != null ? _i2.FeedRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.FeedRecord> findFirstOrThrow({
    _i3.FeedRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.FeedRecordOrderByWithRelationInput>,
      _i3.FeedRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.FeedRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.FeedRecordScalar, Iterable<_i3.FeedRecordScalar>>?
    distinct,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.FeedRecord>(
      action: 'findFirstFeedRecordOrThrow',
      result: result,
      factory: (e) => _i2.FeedRecord.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.FeedRecord>> findMany({
    _i3.FeedRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.FeedRecordOrderByWithRelationInput>,
      _i3.FeedRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.FeedRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.FeedRecordScalar, Iterable<_i3.FeedRecordScalar>>?
    distinct,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.FeedRecord>>(
      action: 'findManyFeedRecord',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.FeedRecord.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.FeedRecord> create({
    required _i1.PrismaUnion<
      _i3.FeedRecordCreateInput,
      _i3.FeedRecordUncheckedCreateInput
    >
    data,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {'data': data, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.FeedRecord>(
      action: 'createOneFeedRecord',
      result: result,
      factory: (e) => _i2.FeedRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.FeedRecord?> update({
    required _i1.PrismaUnion<
      _i3.FeedRecordUpdateInput,
      _i3.FeedRecordUncheckedUpdateInput
    >
    data,
    required _i3.FeedRecordWhereUniqueInput where,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {'data': data, 'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.FeedRecord?>(
      action: 'updateOneFeedRecord',
      result: result,
      factory: (e) => e != null ? _i2.FeedRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.FeedRecordUpdateManyMutationInput,
      _i3.FeedRecordUncheckedUpdateManyInput
    >
    data,
    _i3.FeedRecordWhereInput? where,
  }) {
    final args = {'data': data, 'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyFeedRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.FeedRecord> upsert({
    required _i3.FeedRecordWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.FeedRecordCreateInput,
      _i3.FeedRecordUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.FeedRecordUpdateInput,
      _i3.FeedRecordUncheckedUpdateInput
    >
    update,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.FeedRecord>(
      action: 'upsertOneFeedRecord',
      result: result,
      factory: (e) => _i2.FeedRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.FeedRecord?> delete({
    required _i3.FeedRecordWhereUniqueInput where,
    _i3.FeedRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.FeedRecord?>(
      action: 'deleteOneFeedRecord',
      result: result,
      factory: (e) => e != null ? _i2.FeedRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.FeedRecordWhereInput? where,
  }) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyFeedRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.FeedRecordGroupByOutputType>> groupBy({
    _i3.FeedRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.FeedRecordOrderByWithAggregationInput>,
      _i3.FeedRecordOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.FeedRecordScalar>,
      _i3.FeedRecordScalar
    >
    by,
    _i3.FeedRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.FeedRecordGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.FeedRecordGroupByOutputType>>(
      action: 'groupByFeedRecord',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.FeedRecordGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateFeedRecord> aggregate({
    _i3.FeedRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.FeedRecordOrderByWithRelationInput>,
      _i3.FeedRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.FeedRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateFeedRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'FeedRecord',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateFeedRecord>(
      action: 'aggregateFeedRecord',
      result: result,
      factory: (e) => _i3.AggregateFeedRecord.fromJson(e),
    );
  }
}

class SessionRecordDelegate {
  const SessionRecordDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.SessionRecord?> findUnique({
    required _i3.SessionRecordWhereUniqueInput where,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.SessionRecord?>(
      action: 'findUniqueSessionRecord',
      result: result,
      factory: (e) => e != null ? _i2.SessionRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.SessionRecord> findUniqueOrThrow({
    required _i3.SessionRecordWhereUniqueInput where,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.SessionRecord>(
      action: 'findUniqueSessionRecordOrThrow',
      result: result,
      factory: (e) => _i2.SessionRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.SessionRecord?> findFirst({
    _i3.SessionRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionRecordOrderByWithRelationInput>,
      _i3.SessionRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.SessionRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SessionRecordScalar, Iterable<_i3.SessionRecordScalar>>?
    distinct,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.SessionRecord?>(
      action: 'findFirstSessionRecord',
      result: result,
      factory: (e) => e != null ? _i2.SessionRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.SessionRecord> findFirstOrThrow({
    _i3.SessionRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionRecordOrderByWithRelationInput>,
      _i3.SessionRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.SessionRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SessionRecordScalar, Iterable<_i3.SessionRecordScalar>>?
    distinct,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.SessionRecord>(
      action: 'findFirstSessionRecordOrThrow',
      result: result,
      factory: (e) => _i2.SessionRecord.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.SessionRecord>> findMany({
    _i3.SessionRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionRecordOrderByWithRelationInput>,
      _i3.SessionRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.SessionRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SessionRecordScalar, Iterable<_i3.SessionRecordScalar>>?
    distinct,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.SessionRecord>>(
      action: 'findManySessionRecord',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.SessionRecord.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.SessionRecord> create({
    required _i1.PrismaUnion<
      _i3.SessionRecordCreateInput,
      _i3.SessionRecordUncheckedCreateInput
    >
    data,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {'data': data, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.SessionRecord>(
      action: 'createOneSessionRecord',
      result: result,
      factory: (e) => _i2.SessionRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.SessionRecord?> update({
    required _i1.PrismaUnion<
      _i3.SessionRecordUpdateInput,
      _i3.SessionRecordUncheckedUpdateInput
    >
    data,
    required _i3.SessionRecordWhereUniqueInput where,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {'data': data, 'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.SessionRecord?>(
      action: 'updateOneSessionRecord',
      result: result,
      factory: (e) => e != null ? _i2.SessionRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.SessionRecordUpdateManyMutationInput,
      _i3.SessionRecordUncheckedUpdateManyInput
    >
    data,
    _i3.SessionRecordWhereInput? where,
  }) {
    final args = {'data': data, 'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManySessionRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.SessionRecord> upsert({
    required _i3.SessionRecordWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.SessionRecordCreateInput,
      _i3.SessionRecordUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.SessionRecordUpdateInput,
      _i3.SessionRecordUncheckedUpdateInput
    >
    update,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.SessionRecord>(
      action: 'upsertOneSessionRecord',
      result: result,
      factory: (e) => _i2.SessionRecord.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.SessionRecord?> delete({
    required _i3.SessionRecordWhereUniqueInput where,
    _i3.SessionRecordSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.SessionRecord?>(
      action: 'deleteOneSessionRecord',
      result: result,
      factory: (e) => e != null ? _i2.SessionRecord.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.SessionRecordWhereInput? where,
  }) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManySessionRecord',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.SessionRecordGroupByOutputType>> groupBy({
    _i3.SessionRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionRecordOrderByWithAggregationInput>,
      _i3.SessionRecordOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.SessionRecordScalar>,
      _i3.SessionRecordScalar
    >
    by,
    _i3.SessionRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.SessionRecordGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.SessionRecordGroupByOutputType>>(
      action: 'groupBySessionRecord',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.SessionRecordGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateSessionRecord> aggregate({
    _i3.SessionRecordWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.SessionRecordOrderByWithRelationInput>,
      _i3.SessionRecordOrderByWithRelationInput
    >?
    orderBy,
    _i3.SessionRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateSessionRecordSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'SessionRecord',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateSessionRecord>(
      action: 'aggregateSessionRecord',
      result: result,
      factory: (e) => _i3.AggregateSessionRecord.fromJson(e),
    );
  }
}

class AuthRateLimitDelegate {
  const AuthRateLimitDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.AuthRateLimit?> findUnique({
    required _i3.AuthRateLimitWhereUniqueInput where,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.AuthRateLimit?>(
      action: 'findUniqueAuthRateLimit',
      result: result,
      factory: (e) => e != null ? _i2.AuthRateLimit.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.AuthRateLimit> findUniqueOrThrow({
    required _i3.AuthRateLimitWhereUniqueInput where,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.AuthRateLimit>(
      action: 'findUniqueAuthRateLimitOrThrow',
      result: result,
      factory: (e) => _i2.AuthRateLimit.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.AuthRateLimit?> findFirst({
    _i3.AuthRateLimitWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AuthRateLimitOrderByWithRelationInput>,
      _i3.AuthRateLimitOrderByWithRelationInput
    >?
    orderBy,
    _i3.AuthRateLimitWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.AuthRateLimitScalar, Iterable<_i3.AuthRateLimitScalar>>?
    distinct,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.AuthRateLimit?>(
      action: 'findFirstAuthRateLimit',
      result: result,
      factory: (e) => e != null ? _i2.AuthRateLimit.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.AuthRateLimit> findFirstOrThrow({
    _i3.AuthRateLimitWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AuthRateLimitOrderByWithRelationInput>,
      _i3.AuthRateLimitOrderByWithRelationInput
    >?
    orderBy,
    _i3.AuthRateLimitWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.AuthRateLimitScalar, Iterable<_i3.AuthRateLimitScalar>>?
    distinct,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.AuthRateLimit>(
      action: 'findFirstAuthRateLimitOrThrow',
      result: result,
      factory: (e) => _i2.AuthRateLimit.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.AuthRateLimit>> findMany({
    _i3.AuthRateLimitWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AuthRateLimitOrderByWithRelationInput>,
      _i3.AuthRateLimitOrderByWithRelationInput
    >?
    orderBy,
    _i3.AuthRateLimitWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.AuthRateLimitScalar, Iterable<_i3.AuthRateLimitScalar>>?
    distinct,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.AuthRateLimit>>(
      action: 'findManyAuthRateLimit',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.AuthRateLimit.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.AuthRateLimit> create({
    required _i1.PrismaUnion<
      _i3.AuthRateLimitCreateInput,
      _i3.AuthRateLimitUncheckedCreateInput
    >
    data,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {'data': data, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.AuthRateLimit>(
      action: 'createOneAuthRateLimit',
      result: result,
      factory: (e) => _i2.AuthRateLimit.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.AuthRateLimit?> update({
    required _i1.PrismaUnion<
      _i3.AuthRateLimitUpdateInput,
      _i3.AuthRateLimitUncheckedUpdateInput
    >
    data,
    required _i3.AuthRateLimitWhereUniqueInput where,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {'data': data, 'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.AuthRateLimit?>(
      action: 'updateOneAuthRateLimit',
      result: result,
      factory: (e) => e != null ? _i2.AuthRateLimit.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<
      _i3.AuthRateLimitUpdateManyMutationInput,
      _i3.AuthRateLimitUncheckedUpdateManyInput
    >
    data,
    _i3.AuthRateLimitWhereInput? where,
  }) {
    final args = {'data': data, 'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyAuthRateLimit',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.AuthRateLimit> upsert({
    required _i3.AuthRateLimitWhereUniqueInput where,
    required _i1.PrismaUnion<
      _i3.AuthRateLimitCreateInput,
      _i3.AuthRateLimitUncheckedCreateInput
    >
    create,
    required _i1.PrismaUnion<
      _i3.AuthRateLimitUpdateInput,
      _i3.AuthRateLimitUncheckedUpdateInput
    >
    update,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.AuthRateLimit>(
      action: 'upsertOneAuthRateLimit',
      result: result,
      factory: (e) => _i2.AuthRateLimit.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.AuthRateLimit?> delete({
    required _i3.AuthRateLimitWhereUniqueInput where,
    _i3.AuthRateLimitSelect? select,
  }) {
    final args = {'where': where, 'select': select};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.AuthRateLimit?>(
      action: 'deleteOneAuthRateLimit',
      result: result,
      factory: (e) => e != null ? _i2.AuthRateLimit.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany({
    _i3.AuthRateLimitWhereInput? where,
  }) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyAuthRateLimit',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.AuthRateLimitGroupByOutputType>> groupBy({
    _i3.AuthRateLimitWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AuthRateLimitOrderByWithAggregationInput>,
      _i3.AuthRateLimitOrderByWithAggregationInput
    >?
    orderBy,
    required _i1.PrismaUnion<
      Iterable<_i3.AuthRateLimitScalar>,
      _i3.AuthRateLimitScalar
    >
    by,
    _i3.AuthRateLimitScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.AuthRateLimitGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.AuthRateLimitGroupByOutputType>>(
      action: 'groupByAuthRateLimit',
      result: result,
      factory: (values) => (values as Iterable).map(
        (e) => _i3.AuthRateLimitGroupByOutputType.fromJson(e),
      ),
    );
  }

  _i1.ActionClient<_i3.AggregateAuthRateLimit> aggregate({
    _i3.AuthRateLimitWhereInput? where,
    _i1.PrismaUnion<
      Iterable<_i3.AuthRateLimitOrderByWithRelationInput>,
      _i3.AuthRateLimitOrderByWithRelationInput
    >?
    orderBy,
    _i3.AuthRateLimitWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateAuthRateLimitSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'AuthRateLimit',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateAuthRateLimit>(
      action: 'aggregateAuthRateLimit',
      result: result,
      factory: (e) => _i3.AggregateAuthRateLimit.fromJson(e),
    );
  }
}

class PrismaClient extends _i1.BasePrismaClient<PrismaClient> {
  PrismaClient({
    super.datasourceUrl,
    super.datasources,
    super.errorFormat,
    super.log,
    _i1.Engine? engine,
  }) : _engine = engine;

  static final datamodel = _i4.DataModel.fromJson({
    'enums': [],
    'models': [
      {
        'name': 'UserRecord',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'BigInt',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'did',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': true,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'banner',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'String',
            'default': '',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'followers_count',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': 0,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'follows_count',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': 0,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'posts_count',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': 0,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'description',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'String',
            'default': '',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'PostRecord',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'BigInt',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'cid',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': true,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'uri',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'author_did',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'reposts',
            'kind': 'object',
            'isList': true,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'RepostRecord',
            'relationName': 'PostRecordToRepostRecord',
            'relationFromFields': [],
            'relationToFields': [],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'RepostRecord',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'BigInt',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'hash_id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': true,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'original_post',
            'kind': 'object',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'PostRecord',
            'relationName': 'PostRecordToRepostRecord',
            'relationFromFields': ['original_post_id'],
            'relationToFields': ['id'],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'original_post_id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': true,
            'hasDefaultValue': false,
            'type': 'BigInt',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'NotificationRecord',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'BigInt',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'cid',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'uri',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'MediaRecord',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'BigInt',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'type',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'mime_type',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'size',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'link',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'description',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'FeedRecord',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'BigInt',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'cid',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'uri',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'author_did',
            'kind': 'scalar',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'SessionRecord',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': {'name': 'autoincrement', 'args': []},
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'did',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': true,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'session',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'pds_url',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'String',
            'default': 'https://bsky.social',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'AuthRateLimit',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': {'name': 'autoincrement', 'args': []},
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'ip_address',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': true,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'attempts',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': 0,
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'last_attempt',
            'kind': 'scalar',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'DateTime',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
    ],
    'types': [],
  });

  _i1.Engine? _engine;

  _i1.TransactionClient<PrismaClient>? _transaction;

  @override
  get $transaction {
    if (_transaction != null) return _transaction!;
    PrismaClient factory(_i1.TransactionClient<PrismaClient> transaction) {
      final client = PrismaClient(
        engine: $engine,
        datasources: $options.datasources,
        datasourceUrl: $options.datasourceUrl,
        errorFormat: $options.errorFormat,
        log: $options.logEmitter.definition,
      );
      client.$options.logEmitter = $options.logEmitter;
      client._transaction = transaction;

      return client;
    }

    return _transaction = _i1.TransactionClient<PrismaClient>($engine, factory);
  }

  @override
  get $engine => _engine ??= _i5.BinaryEngine(
    schema:
        '// This is your Prisma schema file,\n// learn more about it in the docs: https://pris.ly/d/prisma-schema\n\ngenerator client {\n  provider      = "dart run orm"\n  output        = "../lib/src/generated/prisma"\n  engineType    = "binary"\n  binaryTargets = ["native", "debian-openssl-3.0.x"]\n}\n\ndatasource db {\n  provider = "sqlite"\n  url      = "file:../database/skybridge.db"\n}\n\nmodel UserRecord {\n  id              BigInt     @id\n  did             String  @unique\n  banner          String @default("")\n  followers_count Int @default(0)\n  follows_count   Int @default(0)\n  posts_count     Int @default(0)\n  description     String @default("")\n\n  @@index(fields: [did])\n}\n\nmodel PostRecord {\n  id           BigInt            @id\n  cid          String         @unique\n  uri          String\n  author_did   String\n  reposts RepostRecord[]\n\n  @@index(fields: [cid])\n}\n\nmodel RepostRecord {\n  id               BigInt        @id\n  hash_id          String     @unique\n  original_post    PostRecord @relation(fields: [original_post_id], references: [id])\n  original_post_id BigInt\n}\n\nmodel NotificationRecord {\n  id  BigInt    @id\n  cid String\n  uri String\n\n  @@index(fields: [cid])\n}\n\nmodel MediaRecord {\n  id          BigInt    @id\n  type        String\n  mime_type   String\n  size        Int\n  link        String\n  description String\n}\n\nmodel FeedRecord {\n  id         BigInt     @id\n  cid        String\n  uri        String\n  author_did String?\n}\n\nmodel SessionRecord {\n  id Int @id @default(autoincrement())\n  did String @unique\n  session String\n  pds_url String @default("https://bsky.social")\n}\n\nmodel AuthRateLimit {\n  id Int @id @default(autoincrement())\n  ip_address String @unique\n  attempts Int @default(0)\n  last_attempt DateTime?\n}',
    datasources: const {
      'db': _i1.Datasource(
        _i1.DatasourceType.url,
        'file:../database/skybridge.db',
      ),
    },
    options: $options,
  );

  @override
  get $datamodel => datamodel;

  UserRecordDelegate get userRecord => UserRecordDelegate._(this);

  PostRecordDelegate get postRecord => PostRecordDelegate._(this);

  RepostRecordDelegate get repostRecord => RepostRecordDelegate._(this);

  NotificationRecordDelegate get notificationRecord =>
      NotificationRecordDelegate._(this);

  MediaRecordDelegate get mediaRecord => MediaRecordDelegate._(this);

  FeedRecordDelegate get feedRecord => FeedRecordDelegate._(this);

  SessionRecordDelegate get sessionRecord => SessionRecordDelegate._(this);

  AuthRateLimitDelegate get authRateLimit => AuthRateLimitDelegate._(this);
}
