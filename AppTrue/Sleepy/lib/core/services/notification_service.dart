import 'package:flutter/foundation.dart';

class NotificationService {
  Future<void> init() async {
    debugPrint('🔔 [Notifications] Initialized (Stub)');
  }

  Future<void> scheduleDailyReminder({
    int id = 0,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    debugPrint('🔔 [Notifications] Scheduled: $title (Stub)');
  }

  Future<void> cancelAll() async {}
}
