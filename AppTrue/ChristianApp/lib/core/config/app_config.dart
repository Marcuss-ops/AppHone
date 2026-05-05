import 'package:flutter/material.dart';

abstract class AppConfig {
  static const bool useMockData = true; // Temporary static access to fix legacy code
  static const bool enableGamification = false;
  static const bool enableLearningPath = false;
  static const bool enableAudioPlayer = false;
  static const bool enableCommunitySupport = true;
  static const List<dynamic> homeSections = [];

  String get appName;
  String get welcomeMessage;
  String get localeCode;
  
  // Section Titles
  String get journeySectionTitle;
  String get quickPracticesSectionTitle;
  
  // Theme & Colors
  Color get backgroundStart;
  Color get backgroundEnd;
  Color get primaryAccent;
  Color get textPrimary;
  Color get textSecondary;
  Color get cardBorder;
  
  // Feature flags / content sections
  bool get hasCompletionCalendar;
  
  // Config for the inspiration section
  InspirationSectionConfig? get inspirationSection;
  
  // Config for the featured section
  FeaturedSectionConfig? get featuredSection;
  
  // Config for quick practices
  List<QuickPracticeConfig> get quickPractices;

  // Config for the guided moment (Luce/Moment)
  GuidedMomentConfig? get guidedMoment;
  
  // Navigation
  List<NavigationDestinationConfig> get navigationDestinations;
}

class GuidedMomentConfig {
  final String title;
  final String subtitle;
  final String durationText;
  final IconData icon;

  GuidedMomentConfig({
    required this.title,
    required this.subtitle,
    required this.durationText,
    required this.icon,
  });
}

class InspirationSectionConfig {
  final String sectionTitle;
  final String pillText;
  final String mainTitle;
  final String mainText;
  final String? secondaryText;
  final IconData? secondaryIcon;

  InspirationSectionConfig({
    required this.sectionTitle,
    required this.pillText,
    required this.mainTitle,
    required this.mainText,
    this.secondaryText,
    this.secondaryIcon,
  });
}

class FeaturedSectionConfig {
  final String sectionTitle;
  final String pillText;
  final String mainTitle;
  final String subtitle;
  final IconData actionIcon;

  FeaturedSectionConfig({
    required this.sectionTitle,
    required this.pillText,
    required this.mainTitle,
    required this.subtitle,
    required this.actionIcon,
  });
}

class QuickPracticeConfig {
  final String title;
  final String subtitle;
  final IconData icon;

  QuickPracticeConfig({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class NavigationDestinationConfig {
  final IconData icon;
  final String label;
  final Widget page;

  NavigationDestinationConfig({
    required this.icon,
    required this.label,
    required this.page,
  });
}

enum HomeSectionType { category }

class HomeSectionConfig {
  final String id;
  final String titleKey;
  final HomeSectionType type;

  const HomeSectionConfig({
    required this.id,
    required this.titleKey,
    required this.type,
  });
}
