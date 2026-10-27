import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../brand_config.dart';
import '../../../core/config/app_copy.dart';
import '../../../core/theme/design_system.dart';
import '../../../shared/widgets/blurred_app_bar.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        title: const Text(AppCopy.settingsTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.notifications_none, color: BrandConfig.primaryColor),
              title: const Text(AppCopy.settingsNotifications, style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: Switch(value: true, onChanged: (_) {}, activeThumbColor: BrandConfig.primaryColor),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.dark_mode_outlined, color: BrandConfig.primaryColor),
              title: const Text(AppCopy.settingsTheme, style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: const Text('System', style: TextStyle(color: Colors.grey)),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language, color: BrandConfig.primaryColor),
              title: const Text(AppCopy.settingsLanguage, style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: const Text('English', style: TextStyle(color: Colors.grey)),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: BrandConfig.primaryColor),
              title: const Text(AppCopy.settingsClearCache, style: TextStyle(fontWeight: FontWeight.w600)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
