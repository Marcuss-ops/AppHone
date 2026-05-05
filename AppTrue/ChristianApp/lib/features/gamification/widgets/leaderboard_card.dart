import 'package:flutter/material.dart';
import '../../../core/theme/design_system.dart';
import '../../../brand_config.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mockUsers = [
      {'name': 'Marco', 'xp': 2450, 'streak': 12, 'isMe': false},
      {'name': 'Giulia', 'xp': 2100, 'streak': 8, 'isMe': false},
      {'name': 'You', 'xp': 1850, 'streak': 5, 'isMe': true},
      {'name': 'Luca', 'xp': 1600, 'streak': 15, 'isMe': false},
      {'name': 'Elena', 'xp': 1200, 'streak': 3, 'isMe': false},
    ];

    return Container(
      padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
      decoration: BoxDecoration(
        color: BrandConfig.surfaceColor,
        borderRadius: BorderRadius.circular(AppDesignSystem.radiusLG),
        boxShadow: AppDesignSystem.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Weekly Leaderboard', style: AppDesignSystem.h2),
              Icon(Icons.emoji_events_outlined, color: BrandConfig.secondaryColor),
            ],
          ),
          const SizedBox(height: AppDesignSystem.spacingSM),
          ...mockUsers.asMap().entries.map((entry) {
            final index = entry.key;
            final user = entry.value;
            final isMe = user['isMe'] as bool;

            return Container(
              margin: const EdgeInsets.only(bottom: AppDesignSystem.spacingXS),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isMe ? BrandConfig.primaryColor.withValues(alpha: 0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: isMe ? Border.all(color: BrandConfig.primaryColor.withValues(alpha: 0.3)) : null,
              ),
              child: Row(
                children: [
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index < 3 ? BrandConfig.secondaryColor : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey[300],
                    child: Text((user['name'] as String)[0]),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      user['name'] as String,
                      style: TextStyle(
                        fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${user['xp']} XP',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Row(
                        children: [
                          Icon(Icons.local_fire_department, size: 12, color: BrandConfig.streakColor),
                          Text(
                            '${user['streak']}',
                            style: TextStyle(fontSize: 11, color: BrandConfig.streakColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
