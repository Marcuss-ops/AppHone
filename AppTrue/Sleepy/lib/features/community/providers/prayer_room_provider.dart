import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/prayer_room.dart';

part 'prayer_room_provider.g.dart';

@riverpod
class PrayerRoomNotifier extends _$PrayerRoomNotifier {
  @override
  Future<List<PrayerRoom>> build() async {
    // Initial mock data
    return [
      PrayerRoom(
        id: 'r1',
        hostUserId: 'u1',
        hostName: 'Maria G.',
        title: 'Rosario della Sera',
        scheduledAt: DateTime.now().add(const Duration(hours: 1)),
        sessionType: 'Rosary',
        participantCount: 12,
      ),
    ];
  }

  Future<PrayerRoom> createRoom({
    required String title,
    required String sessionType,
    required DateTime scheduledAt,
  }) async {
    final newRoom = PrayerRoom(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      hostUserId: 'me',
      hostName: 'Tu',
      title: title,
      scheduledAt: scheduledAt,
      sessionType: sessionType,
    );

    final newState = [newRoom, ...?state.value];
    state = AsyncValue.data(newState);
    return newRoom;
  }
}
