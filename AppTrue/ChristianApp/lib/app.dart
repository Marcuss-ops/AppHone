import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skelphone/core/config/active_config.dart';

class SkelApp extends ConsumerWidget {
  const SkelApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(activeConfigProvider);
    
    return MaterialApp(
      title: config.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: config.primaryAccent,
        colorScheme: ColorScheme.dark(
          primary: config.primaryAccent,
          secondary: config.primaryAccent.withValues(alpha: 0.7),
          surface: const Color(0xFF1A1A1A),
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});
  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(activeConfigProvider);
    final destinations = config.navigationDestinations;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [config.backgroundStart, config.backgroundEnd],
          ),
        ),
        child: destinations[_selectedIndex].page,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: config.primaryAccent,
          unselectedItemColor: Colors.white.withValues(alpha: 0.4),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: destinations.map((d) => BottomNavigationBarItem(
            icon: Icon(d.icon),
            label: d.label,
          )).toList(),
        ),
      ),
    );
  }
}
