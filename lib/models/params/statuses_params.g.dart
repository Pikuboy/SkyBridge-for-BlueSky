// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statuses_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusesParams _$StatusesParamsFromJson(Map<String, dynamic> json) =>
    StatusesParams(
      excludeReblogs: json['exclude_reblogs'] == null
          ? false
          : handleBoolParameter(json['exclude_reblogs'] as String?),
      excludeReplies: json['exclude_replies'] == null
          ? false
          : handleBoolParameter(json['exclude_replies'] as String?),
      onlyMedia: json['only_media'] == null
          ? false
          : handleBoolParameter(json['only_media'] as String?),
      limit: json['limit'] == null ? 20 : stringToInt(json['limit'] as String?),
      pinned: json['pinned'] == null
          ? false
          : handleBoolParameter(json['pinned'] as String?),
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$StatusesParamsToJson(StatusesParams instance) =>
    <String, dynamic>{
      'exclude_reblogs': boolToInt(instance.excludeReblogs),
      'exclude_replies': boolToInt(instance.excludeReplies),
      'only_media': boolToInt(instance.onlyMedia),
      'limit': intToString(instance.limit),
      'pinned': boolToInt(instance.pinned),
      'cursor': instance.cursor,
    };
