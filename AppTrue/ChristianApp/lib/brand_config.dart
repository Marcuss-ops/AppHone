import 'package:flutter/material.dart';

// ================================================================
// SKELPHONE BRAND CONFIG
// Keep ONLY identity-related properties here. Features, copy, and assets
// are managed in AppConfig, AppCopy, and AppAssets.
// ================================================================
class BrandConfig {
  // --- Basic Info ---
  static const String appName = 'SkelPhone';
  static const String tagline = 'Your content, your way';
  static const String channelSlug = 'generic'; // Used for API filtering

  // --- Branding Colors ---
  static const Color primaryColor = Color(0xFF5A3D1E);
  static const Color secondaryColor = Color(0xFF6D5C44);
  static const Color backgroundColor = Color(0xFFFFF8F5);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1E1B18);
  static const Color textSecondary = Color(0xFF4F453C);
  
  // --- Typography ---
  static const String fontFamily = 'Manrope';

  // --- Gamification ---
  static const Color streakColor = Color(0xFFFF9600); // Fire orange
  static const Color heartColor = Color(0xFFFF4B4B);  // Heart red
  static const Color xpColor = Color(0xFF58CC02);     // Duolingo green
}
