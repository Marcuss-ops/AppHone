import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers.dart';
import 'core/config/active_config.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('it_IT', null);
  final prefs = await SharedPreferences.getInstance();
  
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ProviderScope(
        overrides: [
          sharedPrefsProvider.overrideWithValue(prefs),
        ],
        child: const SkelPhoneApp(),
      ),
    ),
  );
}

class SkelPhoneApp extends ConsumerWidget {
  const SkelPhoneApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read the active config to dynamically set the theme
    final config = ref.watch(activeConfigProvider);

    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: config.backgroundStart,
        colorScheme: ColorScheme.dark(
          primary: config.primaryAccent,
          surface: config.backgroundEnd,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MainShell(),
    );
  }
}
