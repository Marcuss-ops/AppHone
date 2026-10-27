// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityIntentImpl _$$CommunityIntentImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityIntentImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      supportCount: (json['supportCount'] as num?)?.toInt() ?? 0,
      hasUserSupported: json['hasUserSupported'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommunityIntentImplToJson(
        _$CommunityIntentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'supportCount': instance.supportCount,
      'hasUserSupported': instance.hasUserSupported,
    };
