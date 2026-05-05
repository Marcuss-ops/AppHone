import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glossy/glossy.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/config/app_copy.dart';
import '../../../brand_config.dart';
import '../models/inspiration.dart';

class InspirationCard extends StatelessWidget {
  final Inspiration inspiration;
  final VoidCallback onShare;
  final VoidCallback? onPlayAudio;

  const InspirationCard({
    super.key,
    required this.inspiration,
    required this.onShare,
    this.onPlayAudio,
  });

  @override
  Widget build(BuildContext context) {
    return GlossyContainer(
      width: double.infinity,
      height: 320,
      strengthX: 20,
      strengthY: 20,
      opacity: 0.1,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.1),
        width: 1.5,
      ),
      child: Stack(
        children: [
          // Decorative background elements
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              PhosphorIcons.quotes(PhosphorIconsStyle.fill),
              size: 120,
              color: Colors.white.withValues(alpha: 0.03),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: BrandConfig.primaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: BrandConfig.primaryColor.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        AppCopy.inspirationTitle.toUpperCase(),
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                          color: const Color(0xFFE8E0D5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  inspiration.content,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 22,
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '— ${inspiration.source}',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFC5A358),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (onPlayAudio != null) ...[
                      _ActionButton(
                        icon: PhosphorIcons.speakerHigh(),
                        label: AppCopy.inspirationAudioPlay,
                        onTap: onPlayAudio!,
                      ),
                      const SizedBox(width: 16),
                    ],
                    _ActionButton(
                      icon: PhosphorIcons.shareNetwork(),
                      label: AppCopy.inspirationShareAction,
                      onTap: onShare,
                      isPrimary: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isPrimary ? Colors.white : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isPrimary ? [
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ] : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isPrimary ? BrandConfig.primaryColor : Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isPrimary ? BrandConfig.primaryColor : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
