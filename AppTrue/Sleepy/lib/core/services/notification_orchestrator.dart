import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/analytics_service.dart';

enum NotificationPriority { low, medium, high, critical }

abstract class NotificationChannel {
  Future<void> send({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  });
}

class NotificationOrchestrator {
  final Ref ref;
  
  NotificationOrchestrator(this.ref);

  Future<void> triggerNotification({
    required String triggerKey,
    required Map<String, dynamic> context,
  }) async {
    // 1. Fetch rules from Remote Config
    // Example rule: "if streak > 3 -> send push"
    
    // 2. Decide channel
    // 3. Log to Analytics
    ref.read(analyticsServiceProvider).logEvent('notification_triggered', parameters: {
      'trigger': triggerKey,
    });
    
    print('Orchestrating notification for: $triggerKey');
  }
}

final notificationOrchestratorProvider = Provider((ref) => NotificationOrchestrator(ref));
