import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../brand_config.dart';
import '../../../core/theme/design_system.dart';
import '../providers/gamification_provider.dart';

class GamificationHeader extends ConsumerWidget {
  const GamificationHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(gamificationNotifierProvider);

    return statsAsync.when(
      data: (stats) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StatBadge(
            icon: Icons.local_fire_department,
            value: stats.streak.toString(),
            color: BrandConfig.streakColor,
          ),
          const SizedBox(width: AppDesignSystem.spacingSM),
          _StatBadge(
            icon: Icons.favorite,
            value: stats.hearts.toString(),
            color: BrandConfig.heartColor,
          ),
          const SizedBox(width: AppDesignSystem.spacingSM),
          _StatBadge(
            icon: Icons.stars,
            value: stats.xp.toString(),
            color: BrandConfig.xpColor,
          ),
        ],
      ),
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;

  const _StatBadge({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
