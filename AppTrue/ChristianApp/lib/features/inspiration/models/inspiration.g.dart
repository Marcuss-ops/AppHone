// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspiration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InspirationImpl _$$InspirationImplFromJson(Map<String, dynamic> json) =>
    _$InspirationImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      source: json['source'] as String,
      imageUrl: json['imageUrl'] as String?,
      audioUrl: json['audioUrl'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$InspirationImplToJson(_$InspirationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'source': instance.source,
      'imageUrl': instance.imageUrl,
      'audioUrl': instance.audioUrl,
      'tags': instance.tags,
    };
