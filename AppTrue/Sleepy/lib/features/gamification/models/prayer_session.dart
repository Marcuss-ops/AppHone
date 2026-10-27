import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_session.freezed.dart';
part 'prayer_session.g.dart';

@freezed
class PrayerSession with _$PrayerSession {
  const factory PrayerSession({
    required String id,
    required String userId,
    required String title,
    required DateTime timestamp,
    required int durationMinutes,
    required String type, // e.g., 'Rosary', 'Daily Verse', 'Meditation'
  }) = _PrayerSession;

  factory PrayerSession.fromJson(Map<String, dynamic> json) => _$PrayerSessionFromJson(json);
}
