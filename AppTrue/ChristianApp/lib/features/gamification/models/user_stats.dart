import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stats.freezed.dart';
part 'user_stats.g.dart';

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    @Default(0) int streak,
    @Default(5) int hearts,
    @Default(0) int xp,
    @Default(0) int level,
    @Default(0) int streakFreezeCount,
    @Default({}) Map<String, bool> dailyQuests,
    DateTime? lastActivityDate,
    DateTime? lastQuestResetDate,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) => _$UserStatsFromJson(json);
}
