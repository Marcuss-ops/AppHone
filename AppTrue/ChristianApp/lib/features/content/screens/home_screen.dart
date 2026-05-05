import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/widgets/mini_player.dart';
import '../../../shared/widgets/blurred_app_bar.dart';
import '../../../shared/widgets/skel_list_item.dart';
import '../../../brand_config.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/config/app_config.dart';
import '../../../core/config/app_copy.dart';
import '../../../core/config/app_assets.dart';
import '../../../core/extensions/l10n_extensions.dart';
import '../../gamification/widgets/gamification_header.dart';
import '../../gamification/providers/gamification_provider.dart';
import '../../gamification/widgets/celebratory_overlay.dart';
import '../../gamification/widgets/daily_quests_card.dart';
import '../../gamification/widgets/leaderboard_card.dart';
import '../widgets/learning_path/learning_path_view.dart';
import '../widgets/category_section.dart';
import '../../inspiration/providers/inspiration_provider.dart';
import '../../inspiration/widgets/inspiration_card.dart';
import '../../inspiration/services/inspiration_sharing_service.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                CelebratoryOverlay.show(context, xpGained: 50, newStreak: 7);
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(AppAssets.defaultProfileImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppDesignSystem.spacingXS),
            if (AppConfig.enableGamification) const GamificationHeader(),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          const SizedBox(width: AppDesignSystem.spacingXS),
        ],
      ),
      body: Stack(
        children: [
          // Background ambient decoration
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF7DFC0).withValues(alpha: 0.3),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 110)),
              
              // Greeting Section
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${l10n.homeGreeting}\nUser',
                        style: AppDesignSystem.h1,
                      ),
                      const SizedBox(height: AppDesignSystem.spacingBase),
                      Text(
                        l10n.homeSubtitle,
                        style: AppDesignSystem.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppDesignSystem.spacingLG)),

              // Inspiration Card Section
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
                sliver: SliverToBoxAdapter(
                  child: ref.watch(dailyInspirationProvider).when(
                    data: (inspiration) => InspirationCard(
                      inspiration: inspiration,
                      onShare: () {
                        InspirationSharingService().shareInspiration(context, inspiration);
                      },
                      onPlayAudio: () {
                        // Logic for audio player
                      },
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, st) => const SizedBox.shrink(),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppDesignSystem.spacingMD)),

              // Learning Path
              if (AppConfig.enableLearningPath)
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
                  sliver: SliverToBoxAdapter(
                    child: LearningPathView(
                      itemCount: 8,
                      completedCount: 2,
                    ),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: AppDesignSystem.spacingLG)),

              // DYNAMIC SECTIONS FROM CONFIG
              ...AppConfig.homeSections.map((config) {
                if (config.type == HomeSectionType.category) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: AppDesignSystem.spacingLG),
                      child: CategorySection(
                        title: l10n.getByKey(config.titleKey),
                        categoryId: config.id,
                      ),
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              }),

              // Daily Quests
              if (AppConfig.enableGamification)
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
                  sliver: SliverToBoxAdapter(
                    child: DailyQuestsCard(),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: AppDesignSystem.spacingLG)),

              // Leaderboard
              if (AppConfig.enableGamification)
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
                  sliver: SliverToBoxAdapter(
                    child: LeaderboardCard(),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: AppDesignSystem.spacingLG)),

              // Main Action Section
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppCopy.homeMainAction, style: AppDesignSystem.h2),
                      const SizedBox(height: AppDesignSystem.spacingSM),
                      _beginActionButton(ref),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: AppDesignSystem.spacingLG)),

              // List Section
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppCopy.homeSectionToday, style: AppDesignSystem.h2),
                      const SizedBox(height: AppDesignSystem.spacingSM),
                      const SkelListItem(
                        title: 'Recommended Content',
                        subtitle: 'Tap to explore',
                        trailingLabel: 'Featured',
                        icon: Icons.auto_awesome,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),
          if (AppConfig.enableAudioPlayer)
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MiniPlayer(),
            ),
        ],
      ),
    );
  }

  Widget _beginActionButton(WidgetRef ref) => ElevatedButton(
    onPressed: () async {
      if (AppConfig.enableGamification) {
        final notifier = ref.read(gamificationNotifierProvider.notifier);
        await notifier.incrementStreak();
        await notifier.addXp(10);
        
        final stats = ref.read(gamificationNotifierProvider).valueOrNull;
        if (stats != null && mounted) {
          CelebratoryOverlay.show(
            context,
            xpGained: 10,
            newStreak: stats.streak,
          );
        }
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: BrandConfig.textPrimary,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    ),
    child: Center(child: Text(AppCopy.homeMainAction)),
  );
}
