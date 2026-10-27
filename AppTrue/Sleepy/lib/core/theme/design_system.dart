import 'package:flutter/material.dart';
import '../../brand_config.dart';

class AppDesignSystem {
  // Spacing
  static const double spacingBase = 4.0;
  static const double spacingXS = 8.0;
  static const double spacingSM = 16.0;
  static const double spacingMD = 24.0;
  static const double spacingLG = 32.0;
  static const double spacingXL = 48.0;

  // Border Radius
  static const double radiusSM = 8.0;
  static const double radiusMD = 16.0;
  static const double radiusLG = 24.0;
  static const double radiusXL = 32.0;
  static const double radiusFull = 999.0;

  // Colors (Derived from BrandConfig for consistency)
  static Color get backgroundSubtle => const Color(0xFFFBF2ED);
  static Color get surfaceSubtle => const Color(0xFFF5ECE7);
  static Color get dividerColor => const Color(0xFFD3C4B8);
  
  // Shadows
  static List<BoxShadow> get ambientShadow => [
    BoxShadow(
      color: const Color(0xFF745433).withValues(alpha: 0.04),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: const Color(0xFF745433).withValues(alpha: 0.06),
      blurRadius: 30,
      offset: const Offset(0, 8),
    ),
  ];

  // Typography Styles
  static TextStyle get h1 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle get h2 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontSize: 18,
    color: BrandConfig.textSecondary,
    height: 1.5,
  );

  static TextStyle get labelSmall => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    color: BrandConfig.textSecondary.withValues(alpha: 0.8),
  );
}
