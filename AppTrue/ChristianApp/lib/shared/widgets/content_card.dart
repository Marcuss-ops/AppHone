import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../features/content/data/models/content_item.dart';
import '../../brand_config.dart';

class ContentCard extends StatelessWidget {
  final ContentItem content;
  final bool featured;
  const ContentCard({super.key, required this.content, this.featured = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => context.push('/player/${content.id}'),
      child: Container(
        width: featured ? 200 : null,
        decoration: BoxDecoration(
          color: BrandConfig.surfaceColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF745433).withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: content.thumbnailUrl != null
                        ? CachedNetworkImage(
                            imageUrl: content.thumbnailUrl!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorWidget: (_, __, ___) => _placeholder(),
                          )
                        : _placeholder(),
                  ),
                  if (content.locked)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: const Center(
                              child: Icon(Icons.lock_outline,
                                  color: Colors.white, size: 32),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (content.isPremium)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: BrandConfig.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(l10n.premiumBadge,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            )),
                      ),
                    ),
                ],
              ),
            ),
            // Title
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 1.2,
                        letterSpacing: -0.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '10 min', // Mock duration
                      style: TextStyle(
                        fontSize: 12,
                        color: BrandConfig.textSecondary.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() => Container(
    color: const Color(0xFFF5ECE7),
    child: const Center(
      child: Icon(Icons.auto_awesome,
          color: BrandConfig.primaryColor, size: 40),
    ),
  );
}
