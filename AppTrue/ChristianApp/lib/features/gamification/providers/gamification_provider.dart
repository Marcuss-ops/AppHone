import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_stats.dart';
import '../data/stats_repository.dart';

part 'gamification_provider.g.dart';

@Riverpod(keepAlive: true)
class GamificationNotifier extends _$GamificationNotifier {
  late final StatsRepository _repository;

  @override
  FutureOr<UserStats> build() async {
    _repository = StatsRepository();
    final stats = await _repository.getStats();
    return _checkDailyReset(stats);
  }

  UserStats _checkDailyReset(UserStats stats) {
    final now = DateTime.now();
    final lastReset = stats.lastQuestResetDate;

    if (lastReset == null || 
        DateTime(now.year, now.month, now.day).isAfter(DateTime(lastReset.year, lastReset.month, lastReset.day))) {
      return stats.copyWith(
        dailyQuests: {
          'open_app': true, // Always true if they are here
          'session_completed': false,
          'streak_maintained': stats.streak > 0,
        },
        lastQuestResetDate: now,
      );
    }
    return stats;
  }

  Future<void> addXp(int amount) async {
    final currentStats = state.valueOrNull ?? const UserStats();
    final newStats = currentStats.copyWith(xp: currentStats.xp + amount);
    state = AsyncData(newStats);
    await _repository.saveStats(newStats);
    HapticFeedback.selectionClick();
  }

  Future<void> incrementStreak() async {
    final currentStats = state.valueOrNull ?? const UserStats();
    final now = DateTime.now();
    final lastActivity = currentStats.lastActivityDate;

    int newStreak = currentStats.streak;

    if (lastActivity == null) {
      newStreak = 1;
    } else {
      final difference = DateTime(now.year, now.month, now.day)
          .difference(DateTime(lastActivity.year, lastActivity.month, lastActivity.day))
          .inDays;

      if (difference == 1) {
        newStreak++;
      } else if (difference > 1) {
        // If they have a streak freeze, use it!
        if (currentStats.streakFreezeCount > 0) {
          final newStats = currentStats.copyWith(
            streakFreezeCount: currentStats.streakFreezeCount - 1,
            lastActivityDate: now,
          );
          state = AsyncData(newStats);
          await _repository.saveStats(newStats);
          return;
        }
        newStreak = 1;
      }
    }

    final newStats = currentStats.copyWith(
      streak: newStreak,
      lastActivityDate: now,
    );
    
    state = AsyncData(newStats);
    await _repository.saveStats(newStats);
    HapticFeedback.success();
  }

  Future<void> completeQuest(String questId) async {
    final currentStats = state.valueOrNull ?? const UserStats();
    if (currentStats.dailyQuests[questId] == true) return;

    final newQuests = Map<String, bool>.from(currentStats.dailyQuests);
    newQuests[questId] = true;

    final newStats = currentStats.copyWith(
      dailyQuests: newQuests,
      xp: currentStats.xp + 50, // Reward for quest
    );

    state = AsyncData(newStats);
    await _repository.saveStats(newStats);
    HapticFeedback.mediumImpact();
  }

  Future<bool> purchaseStreakFreeze() async {
    final currentStats = state.valueOrNull ?? const UserStats();
    const cost = 200;

    if (currentStats.xp >= cost) {
      final newStats = currentStats.copyWith(
        xp: currentStats.xp - cost,
        streakFreezeCount: currentStats.streakFreezeCount + 1,
      );
      state = AsyncData(newStats);
      await _repository.saveStats(newStats);
      HapticFeedback.heavyImpact();
      return true;
    }
    return false;
  }

  Future<void> useHeart() async {
    final currentStats = state.valueOrNull ?? const UserStats();
    if (currentStats.hearts > 0) {
      final newStats = currentStats.copyWith(hearts: currentStats.hearts - 1);
      state = AsyncData(newStats);
      await _repository.saveStats(newStats);
      HapticFeedback.lightImpact();
    }
  }

  Future<void> refillHearts() async {
    final currentStats = state.valueOrNull ?? const UserStats();
    final newStats = currentStats.copyWith(hearts: 5);
    state = AsyncData(newStats);
    await _repository.saveStats(newStats);
    HapticFeedback.mediumImpact();
  }
}
