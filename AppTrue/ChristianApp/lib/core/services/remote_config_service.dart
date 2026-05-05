import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoteConfig {
  final String primaryColor;
  final String secondaryColor;
  final Map<String, bool> featureFlags;
  final Map<String, String> copyOverrides;

  RemoteConfig({
    required this.primaryColor,
    required this.secondaryColor,
    required this.featureFlags,
    required this.copyOverrides,
  });

  factory RemoteConfig.fromJson(Map<String, dynamic> json) {
    return RemoteConfig(
      primaryColor: json['primary_color'] ?? '#5A3D1E',
      secondaryColor: json['secondary_color'] ?? '#6D5C44',
      featureFlags: Map<String, bool>.from(json['feature_flags'] ?? {}),
      copyOverrides: Map<String, String>.from(json['copy_overrides'] ?? {}),
    );
  }

  factory RemoteConfig.defaults() {
    return RemoteConfig(
      primaryColor: '#5A3D1E',
      secondaryColor: '#6D5C44',
      featureFlags: {
        'enableGamification': true,
        'enablePayments': false,
      },
      copyOverrides: {},
    );
  }
}

class RemoteConfigService {
  Future<RemoteConfig> fetchConfig(String channelSlug) async {
    try {
      // Simulation
      await Future.delayed(const Duration(milliseconds: 500));
      return RemoteConfig.defaults();
    } catch (e) {
      debugPrint('Error fetching remote config: $e');
      return RemoteConfig.defaults();
    }
  }
}

final remoteConfigServiceProvider = Provider((ref) => RemoteConfigService());

final remoteConfigProvider = FutureProvider<RemoteConfig>((ref) async {
  final service = ref.watch(remoteConfigServiceProvider);
  return service.fetchConfig('generic');
});
