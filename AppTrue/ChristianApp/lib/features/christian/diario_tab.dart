import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glossy/glossy.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/providers.dart';
import '../../core/config/active_config.dart';
import '../../shared/widgets/app_ui_components.dart';

class DiarioTab extends ConsumerStatefulWidget {
  const DiarioTab({super.key});
  @override
  ConsumerState<DiarioTab> createState() => _DiarioTabState();
}

class _DiarioTabState extends ConsumerState<DiarioTab> {
  final ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(diaryProvider);
    final mediaProgress = ref.watch(mediaProgressProvider);
    final config = ref.watch(activeConfigProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
        children: [
          Text('Diario personale', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Annota le tue riflessioni giornaliere.', style: TextStyle(color: config.textSecondary)),
          const SizedBox(height: 24),
          
          // INPUT SECTION
          Text('NUOVA NOTA', 
              style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.2, color: config.primaryAccent)),
          const SizedBox(height: 12),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: config.primaryAccent.withOpacity(0.1)),
            ),
            child: TextField(
              controller: ctrl,
              maxLines: 5,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                hintText: 'Cosa hai in mente?', 
                hintStyle: TextStyle(color: Colors.white24),
                border: InputBorder.none, contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: AppButton(
              text: 'Salva nota',
              onPressed: () {
                HapticFeedback.mediumImpact();
                ref.read(diaryProvider.notifier).save(ctrl.text);
                ctrl.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Nota salvata correttamente.'),
                    backgroundColor: config.primaryAccent,
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 32),
          
          // HISTORY SECTION
          Text('GIORNI PRECEDENTI', 
              style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.2, color: config.primaryAccent)),
          const SizedBox(height: 16),
          if (history.isEmpty)
            Center(child: Text('Nessuna nota salvata.', style: TextStyle(color: config.textSecondary)))
          else
            ...history.map((note) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppGlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(note['date']!, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: config.primaryAccent)),
                        Icon(PhosphorIcons.calendar(), size: 16, color: config.textSecondary),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(note['text']!, style: const TextStyle(height: 1.4)),
                  ],
                ),
              ),
            )),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
