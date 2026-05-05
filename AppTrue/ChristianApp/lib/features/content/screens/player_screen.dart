import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/content_provider.dart';
import '../providers/player_provider.dart';
import '../../payments/providers/subscription_provider.dart';
import '../providers/favorites_provider.dart';
import '../../../shared/widgets/state_widgets.dart';
import '../../../brand_config.dart';
import '../../../core/config/app_copy.dart';
import '../../../core/config/app_assets.dart';

class PlayerScreen extends ConsumerWidget {
  final String contentId;
  const PlayerScreen({super.key, required this.contentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentAsync   = ref.watch(contentListProvider());
    final playerState    = ref.watch(playerNotifierProvider);
    final premiumAsync   = ref.watch(hasPremiumProvider);

    return contentAsync.when(
      data: (items) {
        final item = items.firstWhere((i) => i.id == contentId,
            orElse: () => items.first);

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, size: 32),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share_outlined),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // Album Art
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 40,
                                offset: const Offset(0, 20),
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(item.thumbnailUrl ?? AppAssets.defaultHeroImg),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),

                      // Title & Artist
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  BrandConfig.appName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: BrandConfig.primaryColor.withValues(alpha: 0.8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _favoriteButton(ref, item.id),
                          const SizedBox(width: 12),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEFE7E1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.info_outline, color: BrandConfig.textSecondary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Player Controls
                      premiumAsync.when(
                        data: (hasPremium) {
                          if (item.locked && !hasPremium) {
                            return _paywallBanner(context);
                          }
                          return _playerControls(ref, item, playerState);
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (_, __) => _playerControls(ref, item, playerState),
                      ),

                      const SizedBox(height: 40),

                      // Details / Transcript Section
                      if (item.description != null)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 32),
                          decoration: const BoxDecoration(
                            border: Border(top: BorderSide(color: Color(0xFFEFE7E1))),
                          ),
                          child: Column(
                            children: [
                              Text(
                                AppCopy.playerTranscriptTitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.0,
                                  color: BrandConfig.textSecondary.withValues(alpha: 0.6),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                item.description!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Scaffold(body: AppLoadingState()),
      error: (e, _) => Scaffold(body: AppErrorState(message: e.toString())),
    );
  }

  Widget _playerControls(WidgetRef ref, item, playerState) {
    final isCurrentItem = ref.watch(currentlyPlayingProvider)?.id == item.id;

    return Column(
      children: [
        // Playback Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10, size: 32),
              onPressed: () => ref.read(playerNotifierProvider.notifier)
                  .seekTo(playerState.position - const Duration(seconds: 10)),
            ),
            GestureDetector(
              onTap: () async {
                final notifier = ref.read(playerNotifierProvider.notifier);
                if (!isCurrentItem) {
                  ref.read(currentlyPlayingProvider.notifier).play(item);
                  await notifier.playContent(item);
                } else {
                  await notifier.togglePlayPause();
                }
              },
              child: Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  color: Color(0xFFEFE7E1),
                  shape: BoxShape.circle,
                ),
                child: playerState.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Icon(
                        isCurrentItem && playerState.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 48,
                      ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.forward_10, size: 32),
              onPressed: () => ref.read(playerNotifierProvider.notifier)
                  .seekTo(playerState.position + const Duration(seconds: 10)),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Volume Slider (Mock)
        Row(
          children: [
            const Icon(Icons.volume_down, size: 16, color: BrandConfig.textSecondary),
            Expanded(
              child: Slider(
                value: 0.7,
                onChanged: (_) {},
                activeColor: BrandConfig.textSecondary,
                inactiveColor: const Color(0xFFE9E1DC),
              ),
            ),
            const Icon(Icons.volume_up, size: 16, color: BrandConfig.textSecondary),
          ],
        ),
      ],
    );
  }

  Widget _paywallBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: BrandConfig.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: BrandConfig.primaryColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          const Icon(Icons.lock_outline, color: BrandConfig.primaryColor, size: 32),
          const SizedBox(height: 12),
          Text(AppCopy.paywallTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(AppCopy.paywallSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: BrandConfig.textSecondary)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.push('/paywall'),
            child: Text(AppCopy.paywallButton),
          ),
        ],
      ),
    );
  }

  Widget _favoriteButton(WidgetRef ref, String contentId) {
    final favoritesIds = ref.watch(favoritesProvider);
    final isFavorite = favoritesIds.contains(contentId);

    return GestureDetector(
      onTap: () => ref.read(favoritesProvider.notifier).toggle(contentId),
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: Color(0xFFEFE7E1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? Icons.bookmark : Icons.bookmark_border,
          color: isFavorite ? BrandConfig.primaryColor : BrandConfig.textSecondary,
        ),
      ),
    );
  }
}
