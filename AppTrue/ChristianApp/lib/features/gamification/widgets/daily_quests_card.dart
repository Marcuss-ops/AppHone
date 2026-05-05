import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/gamification_provider.dart';
import '../../../core/theme/design_system.dart';
import '../../../brand_config.dart';
import '../../../core/config/app_copy.dart';

class DailyQuestsCard extends ConsumerWidget {
  const DailyQuestsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(gamificationNotifierProvider);

    return statsAsync.when(
      data: (stats) {
        final quests = stats.dailyQuests;
        
        return Container(
          padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
          decoration: BoxDecoration(
            color: BrandConfig.surfaceColor,
            borderRadius: BorderRadius.circular(AppDesignSystem.radiusLG),
            boxShadow: AppDesignSystem.cardShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppCopy.questTitle, style: AppDesignSystem.h2),
                  Icon(Icons.auto_awesome, color: BrandConfig.primaryColor),
                ],
              ),
              const SizedBox(height: AppDesignSystem.spacingSM),
              _QuestItem(
                title: AppCopy.questOpenApp,
                isCompleted: quests['open_app'] ?? false,
              ),
              _QuestItem(
                title: AppCopy.questSession,
                isCompleted: quests['session_completed'] ?? false,
              ),
              _QuestItem(
                title: AppCopy.questStreak,
                isCompleted: quests['streak_maintained'] ?? false,
              ),
              
              const Divider(height: AppDesignSystem.spacingLG),
              
              // Streak Freeze Section
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.ac_unit, color: Colors.blue),
                  ),
                  const SizedBox(width: AppDesignSystem.spacingSM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${AppCopy.streakFreezeLabel} (${stats.streakFreezeCount})',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          AppCopy.streakFreezeDescription,
                          style: AppDesignSystem.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: stats.xp >= 200 
                      ? () => ref.read(gamificationNotifierProvider.notifier).purchaseStreakFreeze()
                      : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('200 XP'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox(height: 200, child: Center(child: CircularProgressIndicator())),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _QuestItem extends StatelessWidget {
  final String title;
  final bool isCompleted;

  const _QuestItem({required this.title, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignSystem.spacingXS),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.circle_outlined,
            color: isCompleted ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: AppDesignSystem.spacingXS),
          Text(
            title,
            style: TextStyle(
              color: isCompleted ? Colors.black : Colors.grey[600],
              decoration: isCompleted ? TextDecoration.lineThrough : null,
              fontWeight: isCompleted ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
