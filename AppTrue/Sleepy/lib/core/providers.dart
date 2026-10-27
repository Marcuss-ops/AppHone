import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class StreakNotifier extends Notifier<int> {
  @override
  int build() {
    final prefs = ref.watch(sharedPrefsProvider);
    return prefs.getInt('app_streak') ?? 1;
  }

  void increment() {
    state++;
    ref.read(sharedPrefsProvider).setInt('app_streak', state);
  }
}
final streakProvider = NotifierProvider<StreakNotifier, int>(StreakNotifier.new);

class DiaryNotifier extends Notifier<List<Map<String, String>>> {
  @override
  List<Map<String, String>> build() {
    final prefs = ref.watch(sharedPrefsProvider);
    final history = prefs.getStringList('diary_history') ?? [];
    return history.map((e) {
      final parts = e.split('|');
      return {'date': parts[0], 'text': parts[1]};
    }).toList();
  }

  void save(String text) {
    if (text.isEmpty) return;
    final today = DateTime.now().toIso8601String().split('T')[0];
    final list = [...state];
    list.removeWhere((e) => e['date'] == today);
    list.insert(0, {'date': today, 'text': text});
    state = list;
    final stringList = list.map((e) => '${e['date']}|${e['text']}').toList();
    ref.read(sharedPrefsProvider).setStringList('diary_history', stringList);
  }
}
final diaryProvider = NotifierProvider<DiaryNotifier, List<Map<String, String>>>(DiaryNotifier.new);

class MediaProgressNotifier extends Notifier<double> {
  @override
  double build() {
    final prefs = ref.watch(sharedPrefsProvider);
    return prefs.getDouble('media_progress') ?? 0.0;
  }

  void update(double progress) {
    state = progress;
    ref.read(sharedPrefsProvider).setDouble('media_progress', progress);
  }
}
final mediaProgressProvider = NotifierProvider<MediaProgressNotifier, double>(MediaProgressNotifier.new);

class DailyCompletionNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    final prefs = ref.watch(sharedPrefsProvider);
    return prefs.getStringList('daily_completion_history') ?? [];
  }

  void toggleToday() {
    final today = DateTime.now().toIso8601String().split('T')[0];
    var list = [...state];
    if (list.contains(today)) {
      list.remove(today);
    } else {
      list.add(today);
    }
    state = list;
    ref.read(sharedPrefsProvider).setStringList('daily_completion_history', state);
  }

  bool hasCompleted(DateTime date) {
    final dayStr = date.toIso8601String().split('T')[0];
    return state.contains(dayStr);
  }
}
final dailyCompletionProvider = NotifierProvider<DailyCompletionNotifier, List<String>>(DailyCompletionNotifier.new);
