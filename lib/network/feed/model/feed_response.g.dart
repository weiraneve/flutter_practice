// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponse _$FeedResponseFromJson(Map<String, dynamic> json) => FeedResponse(
      json['errorCode'] as int?,
      json['errorMsg'] as String?,
      (json['data'] as List<dynamic>)
          .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedResponseToJson(FeedResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data,
    };

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) => FeedModel(
      json['id'] as int?,
      json['link'] as String?,
      json['name'] as String?,
      json['order'] as int?,
      json['visible'] as int?,
    );

Map<String, dynamic> _$FeedModelToJson(FeedModel instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
