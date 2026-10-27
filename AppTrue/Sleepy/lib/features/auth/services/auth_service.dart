import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Future<void> signInWithGoogle();
  Future<void> signInWithApple();
  Future<void> signOut();
  String? get currentUserId;
  String? get tenantId; // The ID of the specific app/brand
}

class SupabaseAuthService implements AuthService {
  final SupabaseClient _client = Supabase.instance.client;
  final String _appTenantId;

  SupabaseAuthService(this._appTenantId);

  @override
  Future<void> signInWithGoogle() async {
    // Supabase Google Auth logic
  }

  @override
  Future<void> signInWithApple() async {
    // Supabase Apple Auth logic
  }

  @override
  Future<void> signOut() => _client.auth.signOut();

  @override
  String? get currentUserId => _client.auth.currentUser?.id;

  @override
  String? get tenantId => _appTenantId;
}

final authServiceProvider = Provider<AuthService>((ref) {
  // In production, get tenantId from build config or Remote Config
  return SupabaseAuthService('generic-tenant-id');
});
