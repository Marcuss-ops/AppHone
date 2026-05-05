import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/auth_repository.dart';
import '../../../brand_config.dart';
import '../../../core/config/app_copy.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl  = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background ambient decoration
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFC5E8F9).withValues(alpha: 0.2),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    AppCopy.onboardingTitle,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      letterSpacing: -1.0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppCopy.onboardingSubtitle,
                    style: TextStyle(
                      fontSize: 18,
                      color: BrandConfig.textSecondary.withValues(alpha: 0.8),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 48),
                  TextField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _loading ? null : _register,
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(AppCopy.onboardingButton),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: BrandConfig.textSecondary),
                      ),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text(AppCopy.loginTitle, style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _register() async {
    setState(() => _loading = true);
    try {
      await ref.read(authRepositoryProvider).signUp(
        _emailCtrl.text.trim(),
        _passCtrl.text,
      );
      if (mounted) context.go('/home');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }
}
