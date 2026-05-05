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
  String get homeJourneyTitle; // "Cammino di gruppo"
  String get homeJourneyInviteAction; // "Invita qualcuno per riempirlo"
  String get homeGuidedTitle;
  String get homeGuidedSubtitle;
  String get homeFriendsPrayedPill; // "{count} amici hanno pregato oggi"
  String get homeListenTogetherAction; // "Ascolta insieme"
  String get homeWrappedTitle;
  String get homeWrappedAction;
  String get homeQuickPracticesTitle;

  // Community
  String get communityTitle;
  String get communitySubtitle;
  String get communityRoomsTitle;
  String get communityCreateRoomAction;
  String get communityRecentIntentsTitle;
  String get communityInputPlaceholder;
  String get communityPostAction;
  String get communitySupportAction;
  String get communityLiveCountContacts; // "{count} tuoi contatti +"
  String get communityLiveCountOthers; // "{count} altri stanno pregando ora"
  String get communityPrayerTitle;
  String get communityPrayerAction;
  String get communityInviteWhatsApp; // "Invita su WhatsApp"

  // Player
  String get playerContinueWatching;
  String get playerCompletedTitle; // "Hai completato"
  String get playerCompletedSubtitle; // "Con chi vuoi condividere questa pace?"
  String get playerShareWhatsApp; // "Invia su WhatsApp"
  String get playerCreateVerseImage; // "Crea immagine versetto"
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
  bool get enableAuth;
  bool get enableGamification;
  bool get enablePayments;
  bool get enableLearningPath;
  bool get enableAudioPlayer;
  bool get hasCompletionCalendar;
  
  // Payment Config
  int get trialDays;
  String get stripePriceMonthly;
  String get stripePriceYearly;
  String get stripePriceLifetime;

  // Config sections
  InspirationSectionConfig? get inspirationSection;
  FeaturedSectionConfig? get featuredSection;
  List<QuickPracticeConfig> get quickPractices;
  GuidedMomentConfig? get guidedMoment;
  List<HomeSectionConfig> get homeSections;
  
  // Navigation
  List<NavigationDestinationConfig> get navigationDestinations;
}

enum HomeSectionType { category, featured, inspiration, quickPractices, wrapped }

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
