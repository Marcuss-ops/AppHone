import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../models/community_intent.dart';
import '../../../core/config/app_copy.dart';
import '../../../brand_config.dart';
import '../../../shared/widgets/app_ui_components.dart';
import 'dart:math';

class CommunityIntentCard extends StatelessWidget {
  final CommunityIntent intent;
  final VoidCallback onSupport;

  const CommunityIntentCard({
    super.key,
    required this.intent,
    required this.onSupport,
  });

  static const List<String> _prayers = [
    "Padre Nostro, che sei nei cieli, sia santificato il tuo nome, venga il tuo regno, sia fatta la tua volontà, come in cielo così in terra...",
    "Ave Maria, piena di grazia, il Signore è con te. Tu sei benedetta fra le donne e benedetto è il frutto del tuo seno, Gesù.",
    "L'eterno riposo dona loro, o Signore, e splenda ad essi la luce perpetua. Riposino in pace. Amen.",
    "Angelo di Dio, che sei il mio custode, illumina, custodisci, reggi e governa me, che ti fui affidato dalla pietà celeste. Amen.",
    "Signore, fa' di me uno strumento della tua pace. Dove è odio, fa' ch'io porti l'amore. Dove è offesa, ch'io porti il perdono.",
    "Vieni, Spirito Santo, riempi i cuori dei tuoi fedeli e accendi in essi il fuoco del tuo amore.",
  ];

  void _showPrayerDialog(BuildContext context) {
    final randomPrayer = _prayers[Random().nextInt(_prayers.length)];

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: AppGlassCard(
          opacity: 0.15,
          borderRadius: 32,
          borderColor: BrandConfig.primaryColor.withValues(alpha: 0.3),
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(PhosphorIcons.handsPraying(PhosphorIconsStyle.fill), 
                  color: BrandConfig.primaryColor, size: 48),
              const SizedBox(height: 24),
              Text(
                'Preghiamo insieme',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                randomPrayer,
                textAlign: TextAlign.center,
                style: GoogleFonts.libreBaskerville(
                  fontSize: 18,
                  height: 1.6,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFFE8E0D5),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    onSupport();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    'Ho Pregato',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeAgo = _getTimeAgo(intent.createdAt);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AppGlassCard(
        opacity: 0.08,
        borderRadius: 20,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: BrandConfig.primaryColor.withValues(alpha: 0.1),
                  child: Text(
                    intent.userName.substring(0, 1).toUpperCase(),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: BrandConfig.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        intent.userName,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        timeAgo,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              intent.content,
              style: GoogleFonts.inter(
                fontSize: 16,
                height: 1.5,
                color: const Color(0xFFE8E0D5),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      PhosphorIcons.heart(),
                      size: 16,
                      color: BrandConfig.heartColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${intent.supportCount} ${AppCopy.communitySupportFeedback}',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: BrandConfig.heartColor,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: intent.hasUserSupported ? null : () => _showPrayerDialog(context),
                  icon: Icon(
                    intent.hasUserSupported 
                      ? PhosphorIcons.checkCircle(PhosphorIconsStyle.fill)
                      : PhosphorIcons.sparkle(),
                    size: 20,
                    color: intent.hasUserSupported ? Colors.green : const Color(0xFFE8E0D5),
                  ),
                  label: Text(
                    intent.hasUserSupported ? AppCopy.communitySupportActive : AppCopy.communitySupportAction,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: intent.hasUserSupported ? Colors.green : const Color(0xFFE8E0D5),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: intent.hasUserSupported 
                      ? Colors.green.withValues(alpha: 0.1)
                      : Colors.white.withValues(alpha: 0.05),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }
}
