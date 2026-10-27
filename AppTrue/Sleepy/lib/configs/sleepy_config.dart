import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../core/config/app_config.dart';
import 'sleepy_copy.dart';

// Import features (using existing ones for now as it's a template)
import '../features/home/home_tab.dart'; 
import '../features/content/screens/player_screen.dart'; // Placeholder for sounds
import '../features/community/screens/community_screen.dart';

class SleepyConfig implements AppConfig {
  @override
  String get appName => 'Sleepy';
  
  @override
  String get localeCode => 'it_IT';

  @override
  AppCopy get copy => SleepyCopy();

  @override
  Color get backgroundStart => const Color(0xFF0A0E21); // Dark Night Blue
  
  @override
  Color get backgroundEnd => const Color(0xFF1A1F3C); // Indigo
  
  @override
  String? get backgroundImage => 'assets/images/sleep_bg.png';

  @override
  Color get primaryAccent => const Color(0xFF9BA9FF); // Soft Blue
  
  @override
  Color get textPrimary => const Color(0xFFFFFFFF);
  
  @override
  Color get textSecondary => const Color(0xFFB0B3C6);
  
  @override
  Color get cardBorder => const Color(0xFF9BA9FF).withValues(alpha: 0.15);

  @override bool get enableAuth => true;
  @override bool get enableGamification => false;
  @override bool get enablePayments => true;
  @override bool get enableLearningPath => false;
  @override bool get enableAudioPlayer => true;
  @override bool get hasCompletionCalendar => false;

  @override int get trialDays => 14; // More trial days for Sleepy
  @override String get stripePriceMonthly => 'price_sleepy_monthly';
  @override String get stripePriceYearly => 'price_sleepy_yearly';
  @override String get stripePriceLifetime => 'price_sleepy_lifetime';

  @override
  List<HomeSectionConfig> get homeSections => [
    const HomeSectionConfig(id: 'sounds', titleKey: 'relax_sounds', type: HomeSectionType.category),
    const HomeSectionConfig(id: 'featured', titleKey: 'featured_sleep', type: HomeSectionType.featured),
  ];

  @override
  InspirationSectionConfig? get inspirationSection => null;

  @override
  FeaturedSectionConfig? get featuredSection => FeaturedSectionConfig(
    sectionTitle: 'In primo piano',
    pillText: 'STORIA DELLA BUONANOTTE',
    mainTitle: 'Il bosco incantato',
    subtitle: 'Un viaggio sonoro tra ruscelli e gufi',
    actionIcon: PhosphorIcons.play(PhosphorIconsStyle.fill),
  );

  @override
  List<QuickPracticeConfig> get quickPractices => [
    QuickPracticeConfig(title: 'Respiro 4-7-8', subtitle: '2 min • Relax', icon: PhosphorIcons.wind()),
    QuickPracticeConfig(title: 'Rumore Bianco', subtitle: 'Pioggia leggera', icon: PhosphorIcons.cloudRain()),
  ];

  @override
  GuidedMomentConfig? get guidedMoment => GuidedMomentConfig(
    title: 'Il tuo momento Sleepy',
    subtitle: 'Relax • Suoni • Sogni',
    durationText: '10 MIN',
    icon: PhosphorIcons.moonStars(PhosphorIconsStyle.fill),
  );

  @override
  List<NavigationDestinationConfig> get navigationDestinations => [
    NavigationDestinationConfig(icon: PhosphorIcons.house(), label: 'Home', page: const HomeTab()),
    NavigationDestinationConfig(icon: PhosphorIcons.musicNotes(), label: 'Suoni', page: const PlayerScreen(contentId: 'sleep_sounds_001')),
  ];
}
