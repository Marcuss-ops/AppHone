import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../providers/content_provider.dart';
import '../providers/player_provider.dart';
import '../../payments/providers/subscription_provider.dart';
import '../providers/favorites_provider.dart';
import '../../../shared/widgets/state_widgets.dart';
import '../../../shared/widgets/app_ui_components.dart';
import '../../../core/config/active_config.dart';
import '../../../core/config/app_config.dart';
import '../../../core/config/app_assets.dart';

class PlayerScreen extends ConsumerWidget {
  final String contentId;
  const PlayerScreen({super.key, required this.contentId});

  void _showCompletionDialog(BuildContext context, AppConfig config) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: AppGlassCard(
          opacity: 0.2,
          borderRadius: 32,
          borderColor: config.primaryAccent.withValues(alpha: 0.3),
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle, color: Colors.green, size: 48),
              ),
              const SizedBox(height: 24),
              Text(
                config.copy.playerCompletedTitle,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                config.copy.playerCompletedSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: config.textSecondary),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    context.pop();
                  },
                  icon: Icon(PhosphorIcons.whatsappLogo(PhosphorIconsStyle.fill), size: 20),
                  label: Text(config.copy.playerShareWhatsApp),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF25D366),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(PhosphorIcons.image(), size: 20),
                  label: Text(config.copy.playerCreateVerseImage),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentAsync   = ref.watch(contentListProvider());
    final playerState    = ref.watch(playerNotifierProvider);
    final premiumAsync   = ref.watch(hasPremiumProvider);
    final config         = ref.watch(activeConfigProvider);

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
              icon: const Icon(Icons.keyboard_arrow_down, size: 32, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share_outlined, color: Colors.white),
                onPressed: () => _showCompletionDialog(context, config), 
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [config.backgroundStart, config.backgroundEnd],
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
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
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  config.appName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: config.primaryAccent.withValues(alpha: 0.8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _favoriteButton(ref, item.id, config),
                        ],
                      ),
                      const SizedBox(height: 32),

                      premiumAsync.when(
                        data: (hasPremium) {
                          if (item.locked && !hasPremium) {
                            return _paywallBanner(context, config);
                          }
                          return _playerControls(ref, item, playerState, config);
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (_, __) => _playerControls(ref, item, playerState, config),
                      ),

                      const SizedBox(height: 40),

                      if (item.description != null)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            children: [
                              Text(
                                item.description!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 40),
                      TextButton(
                        onPressed: () => _showCompletionDialog(context, config),
                        child: const Text('SIMULA FINE SESSIONE', style: TextStyle(color: Colors.white24, fontSize: 10)),
                      ),
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

  Widget _playerControls(WidgetRef ref, dynamic item, dynamic playerState, AppConfig config) {
    final isCurrentItem = ref.watch(currentlyPlayingProvider)?.id == item.id;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10, size: 32, color: Colors.white),
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
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: playerState.isLoading
                    ? const Center(child: CircularProgressIndicator(color: Colors.black))
                    : Icon(
                        isCurrentItem && playerState.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 48,
                        color: Colors.black,
                      ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.forward_10, size: 32, color: Colors.white),
              onPressed: () => ref.read(playerNotifierProvider.notifier)
                  .seekTo(playerState.position + const Duration(seconds: 10)),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Slider(
          value: 0.3,
          onChanged: (_) {},
          activeColor: config.primaryAccent,
          inactiveColor: Colors.white.withValues(alpha: 0.1),
        ),
      ],
    );
  }

  Widget _paywallBanner(BuildContext context, AppConfig config) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: config.primaryAccent.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(Icons.lock_outline, color: config.primaryAccent, size: 32),
          const SizedBox(height: 12),
          const Text('Sessione Premium', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 8),
          const Text('Sblocca tutti i contenuti per ascoltare questa meditazione.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.push('/paywall'),
            style: ElevatedButton.styleFrom(backgroundColor: config.primaryAccent),
            child: const Text('Vedi i piani'),
          ),
        ],
      ),
    );
  }

  Widget _favoriteButton(WidgetRef ref, String contentId, AppConfig config) {
    final favoritesIds = ref.watch(favoritesProvider);
    final isFavorite = favoritesIds.contains(contentId);

    return GestureDetector(
      onTap: () => ref.read(favoritesProvider.notifier).toggle(contentId),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? Icons.bookmark : Icons.bookmark_border,
          color: isFavorite ? config.primaryAccent : Colors.white54,
        ),
      ),
    );
  }
}
