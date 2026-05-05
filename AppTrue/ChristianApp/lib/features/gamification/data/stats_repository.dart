import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_stats.dart';

class StatsRepository {
  static const _key = 'user_stats';

  Future<UserStats> getStats() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) {
      return const UserStats();
    }
    try {
      return UserStats.fromJson(json.decode(jsonString));
    } catch (_) {
      return const UserStats();
    }
  }

  Future<void> saveStats(UserStats stats) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(stats.toJson()));
  }
}
