import 'dart:math';

class GamificationStats {
  final int xp;
  final int streak;
  final List<String> achievementIds;

  GamificationStats({
    required this.xp,
    required this.streak,
    required this.achievementIds,
  });

  GamificationStats copyWith({
    int? xp,
    int? streak,
    List<String>? achievementIds,
  }) {
    return GamificationStats(
      xp: xp ?? this.xp,
      streak: streak ?? this.streak,
      achievementIds: achievementIds ?? this.achievementIds,
    );
  }
}

class GamificationEngine {
  // Generic XP calculation logic
  int calculateXpForAction(String actionType, Map<String, dynamic> metadata) {
    switch (actionType) {
      case 'content_completion':
        final duration = metadata['duration_seconds'] ?? 0;
        return 10 + (duration ~/ 60); // 10 base + 1 per minute
      case 'social_interaction':
        return 5;
      case 'daily_checkin':
        return 20;
      default:
        return 0;
    }
  }

  // Check if a new achievement is unlocked
  List<String> checkNewAchievements(GamificationStats currentStats, GamificationStats oldStats) {
    final newAchievements = <String>[];
    
    // Generic achievement rules
    if (currentStats.streak >= 7 && oldStats.streak < 7) {
      newAchievements.add('7_day_streak');
    }
    
    if (currentStats.xp >= 1000 && oldStats.xp < 1000) {
      newAchievements.add('xp_1000_milestone');
    }
    
    return newAchievements;
  }
}
