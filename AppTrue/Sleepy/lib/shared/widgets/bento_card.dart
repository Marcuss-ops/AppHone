import 'package:flutter/material.dart';
import '../../brand_config.dart';
import '../../core/theme/design_system.dart';

class BentoCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final String? backgroundImage;
  final Color? color;
  final EdgeInsets? padding;

  const BentoCard({
    super.key,
    required this.child,
    this.height,
    this.backgroundImage,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? const EdgeInsets.all(AppDesignSystem.spacingMD),
      decoration: BoxDecoration(
        color: color ?? BrandConfig.surfaceColor,
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusLG),
        boxShadow: AppDesignSystem.cardShadow,
        image: backgroundImage != null
            ? DecorationImage(
                image: NetworkImage(backgroundImage!),
                fit: BoxFit.cover,
                opacity: 0.3,
              )
            : null,
      ),
      child: child,
    );
  }
}
