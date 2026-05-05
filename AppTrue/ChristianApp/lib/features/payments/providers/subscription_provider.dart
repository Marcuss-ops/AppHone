import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/providers/auth_provider.dart';
import '../data/payments_repository.dart';

part 'subscription_provider.g.dart';

enum AccessLevel { free, premium, lifetime }

@riverpod
Future<AccessLevel> userAccess(UserAccessRef ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return AccessLevel.free;

  final sub = await ref.watch(paymentsRepositoryProvider).getMySubscription();
  if (sub == null) return AccessLevel.free;
  if (sub['status'] == 'lifetime') return AccessLevel.lifetime;
  if (sub['status'] == 'active' || sub['status'] == 'trialing') return AccessLevel.premium;
  return AccessLevel.free;
}

@riverpod
Future<bool> hasPremium(HasPremiumRef ref) async {
  final access = await ref.watch(userAccessProvider.future);
  return access != AccessLevel.free;
}
