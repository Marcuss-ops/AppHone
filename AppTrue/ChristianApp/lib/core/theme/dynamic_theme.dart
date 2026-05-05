import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/remote_config_service.dart';
import 'app_theme.dart';

final dynamicThemeProvider = Provider<ThemeData>((ref) {
  final configAsync = ref.watch(remoteConfigProvider);
  
  return configAsync.maybeWhen(
    data: (config) {
      final primary = _parseColor(config.primaryColor);
      
      // Use the base theme but override colors
      return AppTheme.light.copyWith(
        primaryColor: primary,
        colorScheme: AppTheme.light.colorScheme.copyWith(
          primary: primary,
          secondary: _parseColor(config.secondaryColor),
        ),
      );
    },
    orElse: () => AppTheme.light,
  );
});

Color _parseColor(String hexColor) {
  hexColor = hexColor.replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor';
  }
  return Color(int.parse(hexColor, radix: 16));
}
