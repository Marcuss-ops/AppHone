import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glossy/glossy.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../models/community_intent.dart';
import '../../../core/config/app_copy.dart';
import '../../../brand_config.dart';

class CommunityIntentCard extends StatelessWidget {
  final CommunityIntent intent;
  final VoidCallback onSupport;

  const CommunityIntentCard({
    super.key,
    required this.intent,
    required this.onSupport,
  });

  @override
  Widget build(BuildContext context) {
    final timeAgo = _getTimeAgo(intent.createdAt);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AppGlassCard(
        opacity: 0.08,
        borderRadius: 20,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: BrandConfig.primaryColor.withValues(alpha: 0.1),
                    child: Text(
                      intent.userName.substring(0, 1).toUpperCase(),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: BrandConfig.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          intent.userName,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          timeAgo,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                intent.content,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.5,
                  color: const Color(0xFFE8E0D5),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.heart(),
                        size: 16,
                        color: BrandConfig.heartColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${intent.supportCount} ${AppCopy.communitySupportFeedback}',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: BrandConfig.heartColor,
                        ),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: intent.hasUserSupported ? null : onSupport,
                    icon: Icon(
                      intent.hasUserSupported 
                        ? PhosphorIcons.checkCircle(PhosphorIconsStyle.fill)
                        : PhosphorIcons.sparkle(),
                      size: 20,
                      color: intent.hasUserSupported ? Colors.green : const Color(0xFFE8E0D5),
                    ),
                    label: Text(
                      intent.hasUserSupported ? AppCopy.communitySupportActive : AppCopy.communitySupportAction,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: intent.hasUserSupported ? Colors.green : const Color(0xFFE8E0D5),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: intent.hasUserSupported 
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.white.withValues(alpha: 0.05),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }
}
