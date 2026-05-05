import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../core/config/app_config.dart';
import 'christian_luce_copy.dart';

// Import features
import '../features/home/home_tab.dart'; 
import '../features/christian/player_tab.dart';
import '../features/community/screens/community_screen.dart';

class ChristianLuceConfig implements AppConfig {
  @override
  String get appName => 'Luce';
  
  @override
  String get localeCode => 'it_IT';

  @override
  AppCopy get copy => ChristianLuceCopy();

  @override
  Color get backgroundStart => const Color(0xFF0F0D0B);
  
  @override
  Color get backgroundEnd => const Color(0xFF1E1B18);
  
  @override
  Color get primaryAccent => const Color(0xFFD4AF37); // Oro
  
  @override
  Color get textPrimary => const Color(0xFFFFFFFF);
  
  @override
  Color get textSecondary => const Color(0xFFAFAFAF);
  
  @override
  Color get cardBorder => const Color(0xFFD4AF37).withValues(alpha: 0.15);

  @override bool get enableAuth => false;
  @override bool get enableGamification => true;
  @override bool get enablePayments => false;
  @override bool get enableLearningPath => false;
  @override bool get enableAudioPlayer => true;
  @override bool get hasCompletionCalendar => true;

  @override int get trialDays => 7;
  @override String get stripePriceMonthly => 'price_123';
  @override String get stripePriceYearly => 'price_456';
  @override String get stripePriceLifetime => 'price_789';

  @override
  List<HomeSectionConfig> get homeSections => [
    const HomeSectionConfig(id: 'calendar', titleKey: 'journey', type: HomeSectionType.category),
    const HomeSectionConfig(id: 'featured', titleKey: 'featured', type: HomeSectionType.featured),
    const HomeSectionConfig(id: 'inspiration', titleKey: 'inspiration', type: HomeSectionType.inspiration),
  ];

  @override
  InspirationSectionConfig? get inspirationSection => InspirationSectionConfig(
    sectionTitle: 'Ispirazione',
    pillText: 'VERSETTO DEL GIORNO',
    mainTitle: 'Fede e Speranza',
    mainText: 'Il Signore è il mio pastore: non manco di nulla. Su pascoli erbosi mi fa riposare, ad acque tranquille mi conduce.',
    secondaryText: 'Salmi 23:1-2',
    secondaryIcon: PhosphorIcons.bookOpen(),
  );

  @override
  FeaturedSectionConfig? get featuredSection => FeaturedSectionConfig(
    sectionTitle: 'In primo piano',
    pillText: 'PRATICA',
    mainTitle: 'Santo Rosario',
    subtitle: 'Meditazione dei misteri gloriosi',
    actionIcon: PhosphorIcons.play(PhosphorIconsStyle.fill),
  );

  @override
  List<QuickPracticeConfig> get quickPractices => [
    QuickPracticeConfig(title: 'Preghiera del mattino', subtitle: '3 min • Audio', icon: PhosphorIcons.sun()),
    QuickPracticeConfig(title: 'Vangelo Audio', subtitle: 'Lettura del giorno', icon: PhosphorIcons.microphone()),
  ];

  @override
  GuidedMomentConfig? get guidedMoment => GuidedMomentConfig(
    title: 'Il tuo momento di Luce',
    subtitle: 'Versetto • Riflessione • Preghiera',
    durationText: '5 MIN',
    icon: PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
  );

  @override
  List<NavigationDestinationConfig> get navigationDestinations => [
    NavigationDestinationConfig(icon: PhosphorIcons.house(), label: 'Home', page: const HomeTab()),
    NavigationDestinationConfig(icon: PhosphorIcons.playCircle(), label: 'Player', page: const PlayerTab()),
    NavigationDestinationConfig(icon: PhosphorIcons.usersThree(), label: 'Community', page: const CommunityScreen()),
  ];
}
