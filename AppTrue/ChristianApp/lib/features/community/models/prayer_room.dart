import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_room.freezed.dart';
part 'prayer_room.g.dart';

@freezed
class PrayerRoom with _$PrayerRoom {
  const factory PrayerRoom({
    required String id,
    required String hostUserId,
    required String hostName,
    required String title,
    required DateTime scheduledAt,
    required String sessionType, // e.g., 'Rosary', 'Meditation'
    @Default([]) List<String> participantIds,
    @Default(0) int participantCount,
    @Default(false) bool isLive,
  }) = _PrayerRoom;

  factory PrayerRoom.fromJson(Map<String, dynamic> json) => _$PrayerRoomFromJson(json);
}
