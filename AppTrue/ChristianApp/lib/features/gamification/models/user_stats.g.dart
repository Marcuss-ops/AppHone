// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatsImpl _$$UserStatsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatsImpl(
      streak: (json['streak'] as num?)?.toInt() ?? 0,
      hearts: (json['hearts'] as num?)?.toInt() ?? 5,
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 0,
      streakFreezeCount: (json['streakFreezeCount'] as num?)?.toInt() ?? 0,
      dailyQuests: (json['dailyQuests'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
      lastActivityDate: json['lastActivityDate'] == null
          ? null
          : DateTime.parse(json['lastActivityDate'] as String),
      lastQuestResetDate: json['lastQuestResetDate'] == null
          ? null
          : DateTime.parse(json['lastQuestResetDate'] as String),
    );

Map<String, dynamic> _$$UserStatsImplToJson(_$UserStatsImpl instance) =>
    <String, dynamic>{
      'streak': instance.streak,
      'hearts': instance.hearts,
      'xp': instance.xp,
      'level': instance.level,
      'streakFreezeCount': instance.streakFreezeCount,
      'dailyQuests': instance.dailyQuests,
      'lastActivityDate': instance.lastActivityDate?.toIso8601String(),
      'lastQuestResetDate': instance.lastQuestResetDate?.toIso8601String(),
    };
