import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../brand_config.dart';

class AppTheme {
  static ThemeData get light {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: BrandConfig.backgroundColor,
      primaryColor: BrandConfig.primaryColor,
      colorScheme: const ColorScheme.light(
        primary:    BrandConfig.primaryColor,
        secondary:  BrandConfig.secondaryColor,
        surface:    BrandConfig.surfaceColor,
        onPrimary:  Colors.white,
        onSurface:  BrandConfig.textPrimary,
        surfaceContainer: Color(0xFFF5ECE7),
      ),
      textTheme: GoogleFonts.getTextTheme(
        BrandConfig.fontFamily,
        base.textTheme,
      ).apply(
        bodyColor:    BrandConfig.textPrimary,
        displayColor: BrandConfig.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: BrandConfig.backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: BrandConfig.textPrimary),
        titleTextStyle: GoogleFonts.getFont(
          BrandConfig.fontFamily,
          color: BrandConfig.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: BrandConfig.surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: BrandConfig.primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          textStyle: GoogleFonts.getFont(
            BrandConfig.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: Color(0xFFD3C4B8),
        indent: 16,
        endIndent: 16,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD3C4B8), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD3C4B8), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: BrandConfig.primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: const TextStyle(color: BrandConfig.textSecondary),
      ),
    );
  }
}
