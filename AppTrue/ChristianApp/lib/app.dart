import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/active_config.dart';

class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});
  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  int idx = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(activeConfigProvider);
    final pages = config.navigationDestinations.map((d) => d.page).toList();

    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.2,
            colors: [config.backgroundEnd, config.backgroundStart],
          ),
        ),
        child: IndexedStack(
          index: idx,
          children: pages,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        child: NavigationBar(
          backgroundColor: Colors.black.withOpacity(0.85),
          height: 72,
          indicatorColor: Colors.transparent,
          selectedIndex: idx,
          onDestinationSelected: (i) {
            HapticFeedback.lightImpact();
            setState(() => idx = i);
          },
          destinations: config.navigationDestinations.map((d) {
            return NavigationDestination(
              icon: Icon(d.icon, color: Colors.white70),
              selectedIcon: Icon(d.icon, color: Colors.white),
              label: '',
            );
          }).toList(),
        ),
      ),
    );
  }
}
