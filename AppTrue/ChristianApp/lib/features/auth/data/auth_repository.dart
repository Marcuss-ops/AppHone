import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final _supabase = Supabase.instance.client;

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sb-token', token);
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('sb-token');
  }

  Future<AuthResponse> signInWithEmail(String email, String password) async {
    final res = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (res.session != null) {
      await _saveToken(res.session!.accessToken);
    }
    return res;
  }

  Future<AuthResponse> signUp(String email, String password) async {
    return _supabase.auth.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
    await _clearToken();
  }

  User? get currentUser => _supabase.auth.currentUser;

  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());
