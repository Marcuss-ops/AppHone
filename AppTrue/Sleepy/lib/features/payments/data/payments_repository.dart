import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../../brand_config.dart';

class PaymentsRepository {
  final ApiClient _client;
  PaymentsRepository(this._client);

  Future<String> createCheckoutSession(String planId) async {
    final data = await _client.post('/payments/checkout', body: {
      'planId': planId,
      'channelSlug': BrandConfig.channelSlug,
    });
    return data['url'] as String;
  }

  Future<String> getPortalUrl() async {
    final data = await _client.get('/payments/portal');
    return data['url'] as String;
  }

  Future<Map<String, dynamic>?> getMySubscription() async {
    try {
      final data = await _client.get('/payments/subscription/me');
      return data as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }
}

final paymentsRepositoryProvider = Provider<PaymentsRepository>((ref) {
  return PaymentsRepository(ref.watch(apiClientProvider));
});
