import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../models/inspiration.dart';
import '../widgets/inspiration_card.dart';
import '../../../brand_config.dart';

class InspirationSharingService {
  final ScreenshotController _screenshotController = ScreenshotController();

  Future<void> shareInspiration(BuildContext context, Inspiration inspiration) async {
    // Show a loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // 1. Capture the widget as an image
      final Uint8List? imageBytes = await _screenshotController.captureFromWidget(
        Material(
          child: _InspirationStoryTemplate(inspiration: inspiration),
        ),
        delay: const Duration(milliseconds: 100),
        context: context,
      );

      if (imageBytes != null) {
        if (context.mounted) Navigator.pop(context);

        if (kIsWeb) {
          // On Web, use shareXFiles with the bytes directly (supported by share_plus on web)
          await Share.shareXFiles(
            [XFile.fromData(imageBytes, name: 'inspiration.png', mimeType: 'image/png')],
            text: 'Shared with Grace from ${BrandConfig.appName}',
          );
        } else {
          // On Mobile/Desktop, save to temporary directory
          final tempDir = await getTemporaryDirectory();
          final file = await File('${tempDir.path}/inspiration_share.png').create();
          await file.writeAsBytes(imageBytes);
          
          await Share.shareXFiles(
            [XFile(file.path)],
            text: 'Shared with Grace from ${BrandConfig.appName}',
          );
        }
      }
    } catch (e) {
      if (context.mounted) Navigator.pop(context);
      debugPrint('Error sharing inspiration: $e');
    }
  }
}

class _InspirationStoryTemplate extends StatelessWidget {
  final Inspiration inspiration;

  const _InspirationStoryTemplate({required this.inspiration});

  @override
  Widget build(BuildContext context) {
    // IG Story Aspect Ratio 9:16
    return Container(
      width: 1080,
      height: 1920,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5A3D1E),
            Color(0xFF1E1B18),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background Glow
          Positioned(
            top: 200,
            left: 100,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFC5A358).withValues(alpha: 0.1),
              ),
            ),
          ),
          
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InspirationCard(
                    inspiration: inspiration,
                    onShare: () {}, // No-op in template
                  ),
                  const SizedBox(height: 100),
                  Text(
                    BrandConfig.appName.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white24,
                      fontSize: 32,
                      letterSpacing: 8,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
