import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BillingService {
  Future<bool> purchase(String productId);
  Future<void> restorePurchases();
  Future<bool> hasEntitlement(String entitlementId);
}

class MockBillingService implements BillingService {
  @override
  Future<bool> purchase(String productId) async {
    print('Purchasing: $productId');
    return true;
  }

  @override
  Future<void> restorePurchases() async {
    print('Restoring purchases');
  }

  @override
  Future<bool> hasEntitlement(String entitlementId) async {
    return false; // Default to free
  }
}

final billingServiceProvider = Provider<BillingService>((ref) => MockBillingService());
