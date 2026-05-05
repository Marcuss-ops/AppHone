import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glossy/glossy.dart';

class AppGlassCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double? width;
  final Color? borderColor;

  const AppGlassCard({
    super.key,
    required this.child,
    this.height = 280,
    this.width,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBorderColor = borderColor ?? theme.colorScheme.primary.withOpacity(0.12);

    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: effectiveBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: child,
      ),
    );
  }
}

class AppPill extends StatelessWidget {
  final String text;
  final Color? color;

  const AppPill({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: effectiveColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: effectiveColor.withOpacity(0.2)),
      ),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 11,
          letterSpacing: 1.2,
          color: effectiveColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.colorScheme.primary;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: effectiveColor,
        foregroundColor: Colors.black, // Dark text on orange background looks premium
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      child: Text(text, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
    );
  }
}
