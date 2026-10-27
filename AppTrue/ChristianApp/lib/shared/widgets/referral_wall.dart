import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skelphone/core/config/app_config.dart';
import 'package:skelphone/shared/widgets/app_ui_components.dart';

class ReferralWall extends StatelessWidget {
  final AppConfig config;
  final VoidCallback onInvite;
  final VoidCallback onPremium;

  const ReferralWall({
    super.key,
    required this.config,
    required this.onInvite,
    required this.onPremium,
  });

  @override
  Widget build(BuildContext context) {
    return AppGlassCard(
      opacity: 0.15,
      borderRadius: 32,
      borderColor: config.primaryAccent.withValues(alpha: 0.3),
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: config.primaryAccent.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.lock_open, color: config.primaryAccent, size: 48),
          ),
          const SizedBox(height: 24),
          Text(
            config.copy.referralUnlockTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            config.copy.referralUnlockSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: config.textSecondary, height: 1.5),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: AppPrimaryButton(
              text: config.copy.referralInviteAction,
              onPressed: onInvite,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            config.copy.referralProgressTemplate.replaceAll('{current}', '0').replaceAll('{target}', '3'),
            style: TextStyle(fontSize: 12, color: config.primaryAccent.withValues(alpha: 0.7), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: onPremium,
            child: Text(
              config.copy.referralPremiumAction,
              style: TextStyle(color: config.textSecondary, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
