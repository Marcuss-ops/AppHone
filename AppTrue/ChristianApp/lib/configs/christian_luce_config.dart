import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../core/config/app_config.dart';
import '../core/theme/app_colors.dart';

// Import features
import '../features/home/home_tab.dart'; 
import '../features/christian/player_tab.dart';
import '../features/christian/diario_tab.dart';

class ChristianLuceConfig implements AppConfig {
  @override
  String get appName => 'Luce';
  
  @override
  String get welcomeMessage => 'Buongiorno';

  @override
  String get localeCode => 'it_IT';

  @override
  String get journeySectionTitle => 'Il tuo cammino';

  @override
  String get quickPracticesSectionTitle => 'Pratiche rapide';
  
  @override
  Color get backgroundStart => const Color(0xFF0F0D0B);
  
  @override
  Color get backgroundEnd => const Color(0xFF1E1A16);
  
  @override
  Color get primaryAccent => const Color(0xFFD97757); // Claude Orange
  
  @override
  Color get textPrimary => const Color(0xFFF5F5F5);   // Bianco Chiuso
  
  @override
  Color get textSecondary => const Color(0xFFAFA59B);
  
  @override
  Color get cardBorder => const Color(0xFFD97757).withOpacity(0.12);

  @override
  bool get hasCompletionCalendar => true;

  @override
  InspirationSectionConfig? get inspirationSection => InspirationSectionConfig(
    sectionTitle: 'Ispirazione',
    pillText: 'Parola del giorno',
    mainTitle: 'Giovanni 8:12',
    mainText: '"Io sono la luce del mondo; chi segue me, non camminerà nelle tenebre, ma avrà la luce della vita."',
    secondaryText: 'San Floriano • Martire del giorno',
    secondaryIcon: PhosphorIcons.star(),
  );

  @override
  FeaturedSectionConfig? get featuredSection => FeaturedSectionConfig(
    sectionTitle: 'In primo piano',
    pillText: 'Meditazione',
    mainTitle: 'Rosario del Giorno',
    subtitle: 'Misteri Gaudiosi',
    actionIcon: PhosphorIcons.play(PhosphorIconsStyle.fill),
  );

  @override
  List<QuickPracticeConfig> get quickPractices => [
    QuickPracticeConfig(title: 'Lectio Divina', subtitle: 'Vangelo di Giovanni', icon: PhosphorIcons.book()),
    QuickPracticeConfig(title: 'Santo Rosario', subtitle: 'Preghiera completa', icon: PhosphorIcons.circleDashed()),
    QuickPracticeConfig(title: 'Vangelo Audio', subtitle: 'Lettura del giorno', icon: PhosphorIcons.microphone()),
  ];

  @override
  List<NavigationDestinationConfig> get navigationDestinations => [
    NavigationDestinationConfig(icon: PhosphorIcons.house(), label: 'Home', page: const HomeTab()),
    NavigationDestinationConfig(icon: PhosphorIcons.playCircle(), label: 'Player', page: const PlayerTab()),
    NavigationDestinationConfig(icon: PhosphorIcons.notebook(), label: 'Diario', page: const DiarioTab()),
  ];
}
