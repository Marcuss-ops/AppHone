import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/prayer_session.dart';

part 'prayer_stats_provider.g.dart';

@riverpod
class PrayerStats extends _$PrayerStats {
  @override
  Future<List<PrayerSession>> build() async {
    // Initial mock data for Wrapped demonstration
    return [
      PrayerSession(
        id: 's1',
        userId: 'me',
        title: 'Rosario del Giorno',
        timestamp: DateTime.now().subtract(const Duration(days: 5)),
        durationMinutes: 20,
        type: 'Rosary',
      ),
      PrayerSession(
        id: 's2',
        userId: 'me',
        title: 'Versetto Mattutino',
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        durationMinutes: 5,
        type: 'Daily Verse',
      ),
    ];
  }

  Future<void> addSession({
    required String title,
    required int durationMinutes,
    required String type,
  }) async {
    final newState = [
      ...?state.value,
      PrayerSession(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'me',
        title: title,
        timestamp: DateTime.now(),
        durationMinutes: durationMinutes,
        type: type,
      ),
    ];
    state = AsyncValue.data(newState);
  }

  Map<String, dynamic> calculateWrapped() {
    final sessions = state.value ?? [];
    if (sessions.isEmpty) return {};

    final totalMinutes = sessions.fold(0, (sum, s) => sum + s.durationMinutes);
    final totalSessions = sessions.length;
    
    // Find most frequent type
    final typeCounts = <String, int>{};
    for (final s in sessions) {
      typeCounts[s.type] = (typeCounts[s.type] ?? 0) + 1;
    }
    final favoriteType = typeCounts.entries.isNotEmpty 
        ? typeCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key
        : 'Nessuno';

    return {
      'totalMinutes': totalMinutes,
      'totalSessions': totalSessions,
      'favoriteType': favoriteType,
      'year': DateTime.now().year,
    };
  }
}
