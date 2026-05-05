import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../core/config/app_config.dart';
import 'generic_content_copy.dart';

// Import generic features
import '../features/home/home_tab.dart'; 
import '../features/community/screens/community_screen.dart';

class GenericPlaceholder extends StatelessWidget {
  final String title;
  const GenericPlaceholder({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Center(child: Text(title, style: const TextStyle(color: Colors.white)));
}

class GenericContentConfig implements AppConfig {
  @override
  String get appName => 'SkelPhone Demo';
  
  @override
  String get localeCode => 'en_US';

  @override
  AppCopy get copy => GenericContentCopy();

  @override
  Color get backgroundStart => const Color(0xFF0F172A); // Slate 900
  
  @override
  Color get backgroundEnd => const Color(0xFF1E293B);   // Slate 800
  
  @override
  Color get primaryAccent => const Color(0xFF38BDF8);   // Sky 400
  
  @override
  Color get textPrimary => const Color(0xFFF8FAFC);     // Slate 50
  
  @override
  Color get textSecondary => const Color(0xFF94A3B8);   // Slate 400
  
  @override
  Color get cardBorder => const Color(0xFF38BDF8).withValues(alpha: 0.2);

  @override bool get enableAuth => false;
  @override bool get enableGamification => false;
  @override bool get enablePayments => false;
  @override bool get enableLearningPath => true;
  @override bool get enableAudioPlayer => true;
  @override bool get hasCompletionCalendar => false;

  @override int get trialDays => 14;
  @override String get stripePriceMonthly => 'price_generic_123';
  @override String get stripePriceYearly => 'price_generic_456';
  @override String get stripePriceLifetime => 'price_generic_789';

  @override
  List<HomeSectionConfig> get homeSections => [
    const HomeSectionConfig(id: 'inspiration', titleKey: 'daily', type: HomeSectionType.inspiration),
    const HomeSectionConfig(id: 'featured', titleKey: 'featured', type: HomeSectionType.featured),
  ];

  @override
  InspirationSectionConfig? get inspirationSection => InspirationSectionConfig(
    sectionTitle: 'Daily Insight',
    pillText: 'Tip of the day',
    mainTitle: 'Stay Consistent',
    mainText: 'Small daily improvements are the key to staggering long-term results. Keep pushing forward and tracking your progress.',
    secondaryText: 'Productivity • Habit building',
    secondaryIcon: PhosphorIcons.lightning(),
  );

  @override
  FeaturedSectionConfig? get featuredSection => FeaturedSectionConfig(
    sectionTitle: 'Featured Lesson',
    pillText: 'Course',
    mainTitle: 'Mastering Flutter',
    subtitle: 'Module 3: Advanced Architecture',
    actionIcon: PhosphorIcons.play(PhosphorIconsStyle.fill),
  );

  @override
  List<QuickPracticeConfig> get quickPractices => [
    QuickPracticeConfig(title: 'Focus Timer', subtitle: '25 min Pomodoro', icon: PhosphorIcons.timer()),
    QuickPracticeConfig(title: 'Review Notes', subtitle: '5 items pending', icon: PhosphorIcons.notebook()),
  ];

  @override
  GuidedMomentConfig? get guidedMoment => GuidedMomentConfig(
    title: 'Your Daily Momentum',
    subtitle: 'Daily Insight • Short Video • Community Support',
    durationText: '5 MIN',
    icon: PhosphorIcons.lightning(PhosphorIconsStyle.fill),
  );

  @override
  List<NavigationDestinationConfig> get navigationDestinations => [
    NavigationDestinationConfig(icon: PhosphorIcons.house(), label: 'Home', page: const HomeTab()),
    NavigationDestinationConfig(icon: PhosphorIcons.usersThree(), label: 'Community', page: const CommunityScreen()),
    NavigationDestinationConfig(icon: PhosphorIcons.compass(), label: 'Discover', page: const GenericPlaceholder(title: 'Discover Tab')),
    NavigationDestinationConfig(icon: PhosphorIcons.user(), label: 'Profile', page: const GenericPlaceholder(title: 'Profile Tab')),
  ];
}
