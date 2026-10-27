import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../brand_config.dart';
import '../../../core/config/app_copy.dart';
import '../../../core/theme/design_system.dart';
import '../../../shared/widgets/blurred_app_bar.dart';
import '../../../shared/widgets/skel_list_item.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BlurredAppBar(
        title: Text(AppCopy.profileTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: Stack(
        children: [
          // Background ambient decoration
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFC5E8F9).withValues(alpha: 0.2),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppDesignSystem.surfaceSubtle,
                    ),
                    child: const Icon(Icons.person, size: 50, color: BrandConfig.primaryColor),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'User Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    'user@example.com',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 48),

                Text('ACCOUNT', style: AppDesignSystem.labelSmall),
                const SizedBox(height: 16),
                SkelListItem(
                  title: AppCopy.profileManageSubscription,
                  subtitle: 'View plan and billing',
                  trailingLabel: 'Pro',
                  icon: Icons.star_outline,
                  onTap: () => context.push('/pricing'),
                ),
                const SizedBox(height: 12),
                SkelListItem(
                  title: AppCopy.settingsTitle,
                  subtitle: 'Preferences and notifications',
                  trailingLabel: '>',
                  icon: Icons.settings_outlined,
                  onTap: () => context.push('/settings'),
                ),

                const SizedBox(height: 32),
                Text('SUPPORT & LEGAL', style: AppDesignSystem.labelSmall),
                const SizedBox(height: 16),
                const SkelListItem(
                  title: AppCopy.profileContact,
                  subtitle: 'Get help with the app',
                  trailingLabel: '>',
                  icon: Icons.help_outline,
                ),
                const SizedBox(height: 12),
                const SkelListItem(
                  title: AppCopy.profilePrivacyPolicy,
                  subtitle: 'Read our policies',
                  trailingLabel: '>',
                  icon: Icons.shield_outlined,
                ),

                const SizedBox(height: 48),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppCopy.profileLogout,
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
