import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/remote_config_service.dart';

class ExperimentationService {
  final Ref ref;

  ExperimentationService(this.ref);

  bool isFeatureEnabled(String featureKey, {Map<String, dynamic>? userContext}) {
    final config = ref.read(remoteConfigProvider).valueOrNull;
    if (config == null) return false;

    // Logic for targeting: e.g., user.country == 'IT'
    return config.featureFlags[featureKey] ?? false;
  }

  String getExperimentVariant(String experimentId) {
    // Logic for A/B testing variants
    return 'control';
  }
}

final experimentationServiceProvider = Provider((ref) => ExperimentationService(ref));
