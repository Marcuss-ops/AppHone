import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/content/screens/home_screen.dart';
import '../../features/content/screens/player_screen.dart';
import '../../features/content/screens/category_screen.dart';
import '../../features/content/screens/course_screen.dart';
import '../../features/content/screens/search_screen.dart';
import '../../features/content/screens/library_screen.dart';
import '../../features/community/screens/community_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/payments/screens/paywall_screen.dart';
import '../../features/payments/screens/pricing_screen.dart';
import '../config/app_config.dart';
import 'main_layout.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _profileNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authAsync = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    redirect: (context, state) {
      if (!AppConfig.enableAuth) return null; // Bypass auth if disabled

      if (authAsync.isLoading) return null;

      final isLoggedIn = authAsync.value != null;
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/onboarding';

      if (!isLoggedIn && !isAuthRoute) return '/login';
      if (isLoggedIn && isAuthRoute) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (c, s) => const LoginScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (c, s) => const OnboardingScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // Explore Branch (Search)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/explore',
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          // Library Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/library',
                builder: (context, state) => const LibraryScreen(),
              ),
            ],
          ),
          // Community Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/community',
                builder: (context, state) => const CommunityScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/player/:contentId',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (c, s) => PlayerScreen(contentId: s.pathParameters['contentId']!),
      ),
      GoRoute(
        path: '/category/:categoryId',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (c, s) => CategoryScreen(categoryId: s.pathParameters['categoryId']!),
      ),
      GoRoute(
        path: '/course/:courseId',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (c, s) => CourseScreen(courseId: s.pathParameters['courseId']!),
      ),
      GoRoute(
        path: '/settings',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (c, s) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/paywall',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (c, s) => const PaywallScreen(),
      ),
      GoRoute(
        path: '/pricing',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (c, s) => const PricingScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri}')),
    ),
  );
});
