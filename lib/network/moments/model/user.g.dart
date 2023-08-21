// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['username'] as String?,
      json['nick'] as String?,
      json['avatar'] as String?,
      json['profile-image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'nick': instance.nick,
      'avatar': instance.avatar,
      'profile-image': instance.profileImage,
    };
