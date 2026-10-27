import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../brand_config.dart';
import '../../../core/config/app_copy.dart';
import '../../../core/theme/design_system.dart';

class CelebratoryOverlay extends StatefulWidget {
  final int xpGained;
  final int newStreak;

  const CelebratoryOverlay({
    super.key,
    required this.xpGained,
    required this.newStreak,
  });

  static void show(BuildContext context, {required int xpGained, required int newStreak}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.8),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) => CelebratoryOverlay(xpGained: xpGained, newStreak: newStreak),
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: anim1, curve: Curves.elasticOut),
          child: FadeTransition(opacity: anim1, child: child),
        );
      },
    );
  }

  @override
  State<CelebratoryOverlay> createState() => _CelebratoryOverlayState();
}

class _CelebratoryOverlayState extends State<CelebratoryOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background particles
          ...List.generate(20, (index) => _ConfettiParticle(controller: _controller, index: index)),
          
          Center(
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
                decoration: BoxDecoration(
                  color: BrandConfig.surfaceColor,
                  borderRadius: BorderRadius.circular(AppDesignSystem.radiusXL),
                  boxShadow: AppDesignSystem.cardShadow,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '🎉',
                      style: TextStyle(fontSize: 80),
                    ),
                    const SizedBox(height: AppDesignSystem.spacingSM),
                    Text(
                      AppCopy.dailyGoalReached,
                      textAlign: TextAlign.center,
                      style: AppDesignSystem.h1.copyWith(color: BrandConfig.primaryColor),
                    ),
                    const SizedBox(height: AppDesignSystem.spacingMD),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _StatItem(
                          icon: Icons.local_fire_department,
                          value: '${widget.newStreak}',
                          label: AppCopy.streakLabel,
                          color: BrandConfig.streakColor,
                        ),
                        _StatItem(
                          icon: Icons.stars,
                          value: '+${widget.xpGained}',
                          label: AppCopy.xpLabel,
                          color: BrandConfig.xpColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDesignSystem.spacingLG),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BrandConfig.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDesignSystem.radiusMD)),
                          elevation: 8,
                          shadowColor: BrandConfig.primaryColor.withValues(alpha: 0.4),
                        ),
                        child: const Text(
                          'AMAZING!',
                          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfettiParticle extends StatelessWidget {
  final AnimationController controller;
  final int index;

  const _ConfettiParticle({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    final random = math.Random(index);
    final color = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      BrandConfig.primaryColor,
      BrandConfig.streakColor,
    ][random.nextInt(8)];

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final progress = (controller.value + (index / 20)) % 1.0;
        final x = (random.nextDouble() * 2 - 1) * 300 * math.sin(progress * math.pi);
        final y = (progress * 800) - 400;
        final rotation = progress * math.pi * 4;

        return Positioned(
          left: MediaQuery.of(context).size.width / 2 + x,
          top: MediaQuery.of(context).size.height / 2 + y,
          child: Transform.rotate(
            angle: rotation,
            child: Icon(
              random.nextBool() ? Icons.star : Icons.circle,
              color: color.withValues(alpha: 1.0 - progress),
              size: 10 + random.nextDouble() * 20,
            ),
          ),
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 36),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          label.toUpperCase(),
          style: AppDesignSystem.labelSmall,
        ),
      ],
    );
  }
}
