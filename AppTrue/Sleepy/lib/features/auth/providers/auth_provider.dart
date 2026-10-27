import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/auth_repository.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  try {
    final repo = ref.watch(authRepositoryProvider);
    return repo.authStateChanges.map((state) => state.session?.user);
  } catch (_) {
    return const Stream.empty();
  }
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).value;
});
