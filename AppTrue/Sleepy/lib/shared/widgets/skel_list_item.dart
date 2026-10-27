import 'package:flutter/material.dart';
import '../../brand_config.dart';
import '../../core/theme/design_system.dart';

class SkelListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailingLabel;
  final IconData icon;
  final VoidCallback? onTap;

  const SkelListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailingLabel,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
        decoration: BoxDecoration(
          color: BrandConfig.surfaceColor,
          borderRadius: BorderRadius.circular(AppDesignSystem.radiusMD),
          boxShadow: AppDesignSystem.ambientShadow,
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppDesignSystem.backgroundSubtle,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: BrandConfig.textSecondary, size: 24),
            ),
            const SizedBox(width: AppDesignSystem.spacingSM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: BrandConfig.textSecondary.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: AppDesignSystem.surfaceSubtle,
                borderRadius: BorderRadius.circular(AppDesignSystem.radiusMD),
              ),
              child: Text(
                trailingLabel,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
