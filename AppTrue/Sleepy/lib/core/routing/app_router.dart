import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/active_config.dart';

// Screens
import '../../app.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/content/screens/player_screen.dart';
import '../../features/content/screens/course_screen.dart';
import '../../features/payments/screens/paywall_screen.dart';
import '../../features/payments/screens/pricing_screen.dart';
import '../../features/settings/screens/settings_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final config = ref.watch(activeConfigProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      // Main Shell
      GoRoute(
        path: '/',
        builder: (context, state) => const MainShell(),
      ),

      // Auth
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Content
      GoRoute(
        path: '/player',
        builder: (context, state) {
          final String contentId = state.extra as String;
          return PlayerScreen(contentId: contentId);
        },
      ),
      GoRoute(
        path: '/course/:id',
        builder: (context, state) => CourseScreen(courseId: state.pathParameters['id']!),
      ),

      // Settings & Billing
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/paywall',
        builder: (context, state) => const PaywallScreen(),
      ),
      GoRoute(
        path: '/pricing',
        builder: (context, state) => const PricingScreen(),
      ),
    ],
    
    // Simple redirect logic based on config
    redirect: (context, state) {
      // If auth is disabled in config, always allow access to root
      if (!config.enableAuth) return null;
      
      return null; // Placeholder for real auth logic
    },
  );
});
