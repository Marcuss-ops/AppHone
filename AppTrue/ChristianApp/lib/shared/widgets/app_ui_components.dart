import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppGlassCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double opacity;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const AppGlassCard({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.borderColor,
    this.opacity = 0.05,
    this.borderRadius = 28,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBorderColor = borderColor ?? theme.colorScheme.primary.withValues(alpha: 0.12);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: effectiveBorderColor),
        ),
        child: BackdropFilter(
          filter: ColorFilter.mode(
            Colors.white.withValues(alpha: 0.01),
            BlendMode.overlay,
          ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(22),
            child: child,
          ),
        ),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: (color ?? Colors.white).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: (color ?? Colors.white).withValues(alpha: 0.2)),
      ),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 9,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.1,
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  
  const AppPrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      child: Text(text, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
    );
  }
}
