import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AnalyticsService {
  void logEvent(String name, {Map<String, dynamic>? parameters});
  void setUserProperty(String name, String value);
  void setCurrentScreen(String screenName);
}

class AppAnalytics implements AnalyticsService {
  @override
  void logEvent(String name, {Map<String, dynamic>? parameters}) {
    if (kDebugMode) {
      print('[Analytics] Event: $name, Params: $parameters');
    }
    // Add real provider here (Supabase, Firebase, PostHog, etc.)
  }

  @override
  void setUserProperty(String name, String value) {
    if (kDebugMode) {
      print('[Analytics] UserProperty: $name = $value');
    }
  }

  @override
  void setCurrentScreen(String screenName) {
    if (kDebugMode) {
      print('[Analytics] Screen: $screenName');
    }
  }
}

final analyticsServiceProvider = Provider<AnalyticsService>((ref) => AppAnalytics());
