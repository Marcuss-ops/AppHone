import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../brand_config.dart';
import '../../core/config/app_copy.dart';
import '../../core/theme/design_system.dart';

/// Standard Full-Screen Loading State
class AppLoadingState extends StatelessWidget {
  const AppLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: BrandConfig.primaryColor,
      ),
    );
  }
}

/// Generic Error State with Retry Button
class AppErrorState extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const AppErrorState({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDesignSystem.spacingLG),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.redAccent),
            const SizedBox(height: AppDesignSystem.spacingMD),
            Text(
              message ?? AppCopy.errorGeneric,
              textAlign: TextAlign.center,
              style: AppDesignSystem.bodyLarge.copyWith(fontWeight: FontWeight.w600),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppDesignSystem.spacingLG),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text(AppCopy.buttonRetry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Generic Empty State
class AppEmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const AppEmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDesignSystem.spacingLG),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: BrandConfig.textSecondary.withValues(alpha: 0.3)),
            const SizedBox(height: AppDesignSystem.spacingLG),
            Text(title, style: AppDesignSystem.h2, textAlign: TextAlign.center),
            const SizedBox(height: AppDesignSystem.spacingXS),
            Text(subtitle, style: AppDesignSystem.bodyLarge, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

/// Specific Offline State
class AppOfflineState extends StatelessWidget {
  final VoidCallback? onRetry;

  const AppOfflineState({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return AppErrorState(
      message: 'You are currently offline. Please check your connection.',
      onRetry: onRetry,
    );
  }
}

/// Skeleton Loader for Bento Cards
class BentoSkeleton extends StatelessWidget {
  const BentoSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: BrandConfig.surfaceColor,
      highlightColor: BrandConfig.backgroundColor,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDesignSystem.radiusLG),
        ),
      ),
    );
  }
}
