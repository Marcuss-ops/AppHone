// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrayerRoomImpl _$$PrayerRoomImplFromJson(Map<String, dynamic> json) =>
    _$PrayerRoomImpl(
      id: json['id'] as String,
      hostUserId: json['hostUserId'] as String,
      hostName: json['hostName'] as String,
      title: json['title'] as String,
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      sessionType: json['sessionType'] as String,
      participantIds: (json['participantIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      participantCount: (json['participantCount'] as num?)?.toInt() ?? 0,
      isLive: json['isLive'] as bool? ?? false,
    );

Map<String, dynamic> _$$PrayerRoomImplToJson(_$PrayerRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hostUserId': instance.hostUserId,
      'hostName': instance.hostName,
      'title': instance.title,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'sessionType': instance.sessionType,
      'participantIds': instance.participantIds,
      'participantCount': instance.participantCount,
      'isLive': instance.isLive,
    };
