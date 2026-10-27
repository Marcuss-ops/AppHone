import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/content/providers/player_provider.dart';
import '../../brand_config.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(currentlyPlayingProvider);
    final playerState = ref.watch(playerNotifierProvider);

    if (current == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      height: 72,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: GestureDetector(
            onTap: () => context.push('/player/${current.id}'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: current.thumbnailUrl != null
                          ? DecorationImage(
                              image: NetworkImage(current.thumbnailUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      color: const Color(0xFFF5ECE7),
                    ),
                    child: current.thumbnailUrl == null
                        ? const Icon(Icons.music_note, color: BrandConfig.primaryColor)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          current.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            letterSpacing: -0.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          BrandConfig.appName,
                          style: TextStyle(
                            fontSize: 12,
                            color: BrandConfig.textSecondary.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      playerState.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 28,
                    ),
                    onPressed: () =>
                        ref.read(playerNotifierProvider.notifier).togglePlayPause(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20, color: Colors.grey),
                    onPressed: () {
                      ref.read(playerNotifierProvider.notifier).stop();
                      ref.read(currentlyPlayingProvider.notifier).clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
