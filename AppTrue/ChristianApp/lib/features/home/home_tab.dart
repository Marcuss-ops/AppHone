import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:intl/intl.dart';
import '../../core/providers.dart';
import '../../core/config/app_config.dart';
import '../../core/config/active_config.dart';
import '../../shared/widgets/app_ui_components.dart';
import '../inspiration/providers/inspiration_provider.dart';
import '../inspiration/widgets/inspiration_card.dart';
import '../inspiration/services/inspiration_sharing_service.dart';
import '../gamification/providers/prayer_stats_provider.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(activeConfigProvider);
    
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
        children: [
          _buildHeader(ref, config),
          
          if (config.guidedMoment != null) ...[
            const SizedBox(height: 24),
            _buildGuidedMomentSection(config.guidedMoment!, config),
          ],

          if (config.hasCompletionCalendar) ...[
            const SizedBox(height: 24),
            _buildCompletionCalendar(ref, config),
          ],
          
          if (config.featuredSection != null) ...[
            const SizedBox(height: 32),
            _buildFeaturedSection(config.featuredSection!, config),
          ],
          
          if (config.inspirationSection != null) ...[
            const SizedBox(height: 32),
            _buildInspirationSection(config.inspirationSection!, config),
          ],
          
          if (config.quickPractices.isNotEmpty) ...[
            const SizedBox(height: 32),
            _buildQuickPracticesSection(config),
          ],

          const SizedBox(height: 32),
          _buildWrappedTeaser(ref, config),
        ],
      ),
    );
  }

  Widget _buildWrappedTeaser(WidgetRef ref, AppConfig config) {
    final stats = ref.read(prayerStatsProvider.notifier).calculateWrapped();
    if (stats.isEmpty) return const SizedBox.shrink();

    return AppGlassCard(
      opacity: 0.2,
      borderRadius: 24,
      borderColor: Colors.orange.withValues(alpha: 0.3),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                config.copy.homeWrappedTitle,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: Colors.orange[300],
                  letterSpacing: 1.2,
                ),
              ),
              Icon(PhosphorIcons.shareNetwork(), color: Colors.orange[300], size: 20),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Hai dedicato ${stats['totalMinutes']} minuti alla tua anima nel ${stats['year']}.',
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'La tua pratica preferita: ${stats['favoriteType']}',
            style: GoogleFonts.inter(fontSize: 14, color: config.textSecondary),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Future: Generate shareable "Spotify Wrapped" style image
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.withValues(alpha: 0.2),
                foregroundColor: Colors.orange[100],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text(config.copy.homeWrappedAction),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidedMomentSection(GuidedMomentConfig moment, AppConfig config) {
    return AppGlassCard(
      opacity: 0.15,
      borderRadius: 32,
      borderColor: config.primaryAccent.withValues(alpha: 0.3),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: config.primaryAccent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              config.copy.homeFriendsPrayedPill,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: config.primaryAccent,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(moment.icon, color: config.primaryAccent, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          moment.durationText,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: config.primaryAccent,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      moment.title,
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      moment.subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: config.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  PhosphorIcons.play(PhosphorIconsStyle.fill),
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(WidgetRef ref, AppConfig config) {
    final streak = ref.watch(streakProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(config.copy.homeGreeting, 
                style: GoogleFonts.inter(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white)),
            const SizedBox(height: 4),
            Text(DateFormat('EEEE d MMMM', config.localeCode).format(DateTime.now()), 
                style: TextStyle(color: config.textSecondary, fontSize: 14)),
          ],
        ),
        _StreakBadge(streak: streak, config: config),
      ],
    );
  }

  Widget _buildCompletionCalendar(WidgetRef ref, AppConfig config) {
    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 13));
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(config.copy.homeJourneyTitle.toUpperCase(), 
            style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.2, color: config.primaryAccent)),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 14,
            itemBuilder: (context, index) {
              final date = startDate.add(Duration(days: index));
              final isToday = date.day == now.day && date.month == now.month;
              final hasCompleted = ref.read(dailyCompletionProvider.notifier).hasCompleted(date);
              
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Text(
                      DateFormat('E', config.localeCode).format(date)[0].toUpperCase(),
                      style: GoogleFonts.inter(fontSize: 12, color: config.textSecondary),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: isToday ? () => ref.read(dailyCompletionProvider.notifier).toggleToday() : null,
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: hasCompleted ? Colors.green.withValues(alpha: 0.15) : Colors.white.withValues(alpha: 0.05),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: hasCompleted ? Colors.green.withValues(alpha: 0.6) : Colors.white.withValues(alpha: 0.1),
                            width: isToday ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            style: GoogleFonts.inter(
                              fontSize: 14, 
                              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                              color: hasCompleted ? Colors.green[300] : Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (hasCompleted)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _smallAvatar('M', Colors.blue),
                          const SizedBox(width: 2),
                          _smallAvatar('F', Colors.orange),
                        ],
                      )
                    else if (isToday)
                      GestureDetector(
                        onTap: () {
                          // Trigger invite
                        },
                        child: Icon(Icons.add_circle_outline, size: 14, color: config.primaryAccent.withValues(alpha: 0.5)),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _smallAvatar(String initial, Color color) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(color: color.withValues(alpha: 0.8), shape: BoxShape.circle),
      child: Center(
        child: Text(initial, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  Widget _buildInspirationSection(InspirationSectionConfig section, AppConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(section.sectionTitle, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
        const SizedBox(height: 16),
        Consumer(
          builder: (context, ref, child) {
            final inspirationAsync = ref.watch(dailyInspirationProvider);
            return inspirationAsync.when(
              data: (inspiration) => InspirationCard(
                inspiration: inspiration,
                onShare: () => InspirationSharingService().shareInspiration(context, inspiration),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('Error: $e', style: const TextStyle(color: Colors.white)),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeaturedSection(FeaturedSectionConfig section, AppConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(section.sectionTitle, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
        const SizedBox(height: 16),
        AppGlassCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppPill(text: section.pillText),
                      const SizedBox(height: 40),
                      Text(section.mainTitle,
                          style: GoogleFonts.cormorantGaramond(fontSize: 28, fontWeight: FontWeight.bold, color: config.primaryAccent)),
                      Text(section.subtitle,
                          style: GoogleFonts.inter(fontSize: 14, color: config.textSecondary)),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: Icon(section.actionIcon, size: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.white.withValues(alpha: 0.1)),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Row(
                  children: [
                    Text(
                      config.copy.homeListenTogetherAction,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: config.primaryAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickPracticesSection(AppConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(config.copy.homeQuickPracticesTitle, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
        const SizedBox(height: 16),
        ...config.quickPractices.map((practice) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _AudioPracticeCard(practice: practice, config: config),
        )),
      ],
    );
  }
}

class _AudioPracticeCard extends StatelessWidget {
  final QuickPracticeConfig practice;
  final AppConfig config;

  const _AudioPracticeCard({required this.practice, required this.config});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: config.primaryAccent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(practice.icon, color: config.primaryAccent, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(practice.title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: 0.1,
                    backgroundColor: Colors.white.withValues(alpha: 0.05),
                    valueColor: AlwaysStoppedAnimation(config.primaryAccent),
                    minHeight: 3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(practice.subtitle, style: TextStyle(fontSize: 11, color: config.textSecondary)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Icon(PhosphorIcons.play(), color: config.primaryAccent, size: 18),
        ],
      ),
    );
  }
}

class _StreakBadge extends StatelessWidget {
  final int streak;
  final AppConfig config;
  
  const _StreakBadge({required this.streak, required this.config});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Text('🔥 '),
          Text('$streak', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.orange)),
        ],
      ),
    );
  }
}
