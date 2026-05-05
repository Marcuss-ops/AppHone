import 'package:flutter/material.dart';

/// Abstract Copy interface to allow each app configuration to define its own strings.
abstract class AppCopy {
  // General
  String get errorGeneric;
  String get buttonRetry;
  String get buttonCancel;

  // Onboarding
  String get onboardingTitle;
  String get onboardingSubtitle;
  String get onboardingButton;

  // Home
  String get homeGreeting;
  String get homeSubtitle;
  String get homeGuidedTitle;
  String get homeGuidedSubtitle;
  String get homeWrappedTitle;
  String get homeWrappedAction;

  // Community
  String get communityTitle;
  String get communitySubtitle;
  String get communityRoomsTitle;
  String get communityCreateRoomAction;
  String get communityRecentIntentsTitle;
  String get communityInputPlaceholder;
  String get communityPostAction;
  String get communitySupportAction;
  String get communityLiveCountTemplate; // e.g. "{count} people praying"
  String get communityPrayerTitle;
  String get communityPrayerAction;

  // Player
  String get playerContinueWatching;
}

abstract class AppConfig {
  static const bool useMockData = true;
  
  String get appName;
  String get localeCode;
  AppCopy get copy;
  
  // Theme & Colors
  Color get backgroundStart;
  Color get backgroundEnd;
  Color get primaryAccent;
  Color get textPrimary;
  Color get textSecondary;
  Color get cardBorder;
  
  // Feature flags
  bool get hasCompletionCalendar;
  
  // Config sections
  InspirationSectionConfig? get inspirationSection;
  FeaturedSectionConfig? get featuredSection;
  List<QuickPracticeConfig> get quickPractices;
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
