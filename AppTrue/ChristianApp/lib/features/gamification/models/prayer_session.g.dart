// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrayerSessionImpl _$$PrayerSessionImplFromJson(Map<String, dynamic> json) =>
    _$PrayerSessionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$PrayerSessionImplToJson(_$PrayerSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'timestamp': instance.timestamp.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'type': instance.type,
    };
