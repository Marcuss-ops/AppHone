import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'core/config/active_config.dart';
import 'features/content/providers/player_provider.dart';
import 'shared/widgets/app_ui_components.dart';

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
    final currentItem = ref.watch(currentlyPlayingProvider);
    final playerState = ref.watch(playerNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Layer
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _selectedIndex == 0 && config.backgroundImage != null
                  ? Container(
                      key: const ValueKey('home_bg'),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withValues(alpha: 0.6),
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          config.backgroundImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      key: const ValueKey('cinematic_bg'),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF020412), // Deep Midnight Blue Start
                            Color(0xFF0A0E21), // Deep Midnight Blue End
                          ],
                        ),
                      ),
                    ),
            ),
          ),
          // Content Layer
          SafeArea(
            child: destinations[_selectedIndex].page,
          ),
          // Mini Player Layer
          if (currentItem != null)
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: _buildMiniPlayer(currentItem, playerState, config),
            ),
        ],
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

  Widget _buildMiniPlayer(dynamic item, dynamic playerState, dynamic config) {
    return AppGlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: 16,
      opacity: 0.2,
      child: Row(
        children: [
          // Thumbnail
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: item.thumbnailUrl != null
                  ? DecorationImage(image: NetworkImage(item.thumbnailUrl!), fit: BoxFit.cover)
                  : null,
              color: config.primaryAccent.withValues(alpha: 0.1),
            ),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  config.appName,
                  style: GoogleFonts.inter(fontSize: 12, color: Colors.white60),
                ),
              ],
            ),
          ),
          // Controls
          IconButton(
            icon: const Icon(Icons.replay_10, color: Colors.white, size: 24),
            onPressed: () => ref.read(playerNotifierProvider.notifier)
                .seekTo(playerState.position - const Duration(seconds: 10)),
          ),
          IconButton(
            icon: Icon(
              playerState.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () => ref.read(playerNotifierProvider.notifier).togglePlayPause(),
          ),
          IconButton(
            icon: const Icon(Icons.forward_10, color: Colors.white, size: 24),
            onPressed: () => ref.read(playerNotifierProvider.notifier)
                .seekTo(playerState.position + const Duration(seconds: 10)),
          ),
        ],
      ),
    );
  }
}
