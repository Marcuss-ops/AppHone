import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/config/app_config.dart';
import '../../core/config/active_config.dart';
import '../../shared/widgets/app_ui_components.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(activeConfigProvider);
    
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
        children: [
          _buildHeader(config),
          
          const SizedBox(height: 32),
          _buildSoundscapeSection(config),
          
          if (config.guidedMoment != null) ...[
            const SizedBox(height: 24),
            _buildGuidedMomentSection(config.guidedMoment!, config),
          ],
          
          if (config.featuredSection != null) ...[
            const SizedBox(height: 32),
            _buildFeaturedSection(config.featuredSection!, config),
          ],
          
          if (config.quickPractices.isNotEmpty) ...[
            const SizedBox(height: 32),
            _buildQuickPracticesSection(config),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader(AppConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(config.copy.homeGreeting, 
            style: GoogleFonts.inter(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 4),
        Text(config.copy.homeSubtitle, 
            style: TextStyle(color: config.textSecondary, fontSize: 16)),
      ],
    );
  }

  Widget _buildSoundscapeSection(AppConfig config) {
    final sounds = [
      {'label': 'Pioggia', 'icon': PhosphorIcons.cloudRain()},
      {'label': 'Rumori Bianchi', 'icon': PhosphorIcons.waveform()},
      {'label': 'Fuoco', 'icon': PhosphorIcons.fire()},
      {'label': 'Onde', 'icon': PhosphorIcons.waves()},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PAESAGGI SONORI',
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w900,
            color: config.primaryAccent,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2.5,
          ),
          itemCount: sounds.length,
          itemBuilder: (context, index) {
            final sound = sounds[index];
            return AppGlassCard(
              padding: EdgeInsets.zero,
              borderRadius: 20,
              opacity: 0.1,
              child: InkWell(
                onTap: () {
                  // Play sound logic
                },
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        sound['icon'] as IconData,
                        color: config.primaryAccent,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          sound['label'] as String,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
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
