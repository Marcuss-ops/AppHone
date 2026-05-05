import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/providers.dart';
import '../../core/config/app_config.dart';
import '../../core/config/active_config.dart';
import '../../shared/widgets/app_ui_components.dart';

class PlayerTab extends ConsumerWidget {
  const PlayerTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaProgress = ref.watch(mediaProgressProvider);
    final config = ref.watch(activeConfigProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
        children: [
          Text('Player Multimediale', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Continua l\'ascolto della tua ultima sessione.', style: TextStyle(color: config.textSecondary)),
          const SizedBox(height: 32),
          
          // LARGE SPOTIFY-STYLE PLAYER
          Center(
            child: Column(
              children: [
                AppGlassCard(
                  height: 480,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: NetworkImage('https://images.unsplash.com/photo-1516280440614-37939bbacd81?q=80&w=600'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: config.primaryAccent.withOpacity(0.3),
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('Meditazione Profonda', 
                          style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('SkelPhone Audio • Volume 1', 
                          style: TextStyle(color: config.textSecondary, fontSize: 15)),
                      const SizedBox(height: 16),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 6,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                          activeTrackColor: config.primaryAccent,
                          inactiveTrackColor: Colors.white10,
                          thumbColor: config.primaryAccent,
                          overlayColor: config.primaryAccent.withOpacity(0.2),
                        ),
                        child: Slider(
                          value: mediaProgress,
                          onChanged: (v) => ref.read(mediaProgressProvider.notifier).update(v),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${(mediaProgress * 15).toInt()}:00', 
                              style: TextStyle(color: config.textSecondary, fontSize: 12)),
                          const Text('15:00', 
                              style: TextStyle(color: Colors.white24, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(PhosphorIcons.skipBack(), color: Colors.white70, size: 30),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: config.primaryAccent,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(PhosphorIcons.play(PhosphorIconsStyle.fill), color: Colors.black, size: 32),
                          ),
                          Icon(PhosphorIcons.skipForward(), color: Colors.white70, size: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          Text('CONTINUA A GUARDARE', 
              style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.2, color: config.primaryAccent)),
          const SizedBox(height: 16),
          _recentItem('Riflessione sul Vangelo', 'Video • 12 min', config),
          const SizedBox(height: 12),
          _recentItem('Storia dei Santi', 'Audio • 45 min', config),
        ],
      ),
    );
  }

  Widget _recentItem(String t, String s, AppConfig config) {
    return AppGlassCard(
      child: Row(
        children: [
          Icon(PhosphorIcons.playCircle(), color: config.primaryAccent, size: 24),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
              Text(s, style: TextStyle(color: config.textSecondary, fontSize: 12)),
            ],
          ),
          const Spacer(),
          Icon(PhosphorIcons.dotsThreeVertical(), color: config.textSecondary),
        ],
      ),
    );
  }
}
