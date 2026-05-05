import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/app_config.dart';

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
        'enableGamification': AppConfig.enableGamification,
        'enablePayments': AppConfig.enablePayments,
      },
      copyOverrides: {},
    );
  }
}

class RemoteConfigService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<RemoteConfig> fetchConfig(String channelSlug) async {
    try {
      // In a real scenario, this would be a table named 'app_configs'
      // final response = await _supabase
      //     .from('app_configs')
      //     .select()
      //     .eq('channel_slug', channelSlug)
      //     .single();
      
      // For now, returning defaults or simulated data
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
  // Using a placeholder channel slug, in production this would be passed or fetched from build config
  return service.fetchConfig('generic');
});
