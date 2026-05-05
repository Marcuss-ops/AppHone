import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/config/app_copy.dart';
import '../../../brand_config.dart';
import '../../../shared/widgets/app_ui_components.dart';
import '../providers/community_intent_provider.dart';
import '../widgets/community_intent_card.dart';

class CommunityScreen extends ConsumerWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intentsAsync = ref.watch(communityIntentNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: intentsAsync.when(
          data: (intents) => ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
            itemCount: intents.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildHeaderSection(context, ref);
              }
              final intent = intents[index - 1];
              return CommunityIntentCard(
                intent: intent,
                onSupport: () => ref.read(communityIntentNotifierProvider.notifier).support(intent.id),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const SizedBox(height: 24),
        _buildQuickPostCard(context, ref),
        const SizedBox(height: 32),
        _buildSectionDivider(),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppCopy.communityTitle,
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Insieme nella preghiera e nel sostegno reciproco.',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickPostCard(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    return AppGlassCard(
      opacity: 0.12,
      borderRadius: 24,
      borderColor: BrandConfig.primaryColor.withValues(alpha: 0.2),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(PhosphorIcons.handsPraying(), color: BrandConfig.primaryColor, size: 24),
              const SizedBox(width: 12),
              Text(
                'Condividi un\'intenzione',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            maxLines: 3,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
              hintText: 'Per cosa vuoi essere sostenuto oggi?',
              hintStyle: GoogleFonts.inter(color: Colors.white38),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  ref.read(communityIntentNotifierProvider.notifier).addIntent(controller.text.trim());
                  controller.clear();
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Intenzione condivisa con la community')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: BrandConfig.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: Text(
                'Chiedi Sostegno',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionDivider() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text(
            'INTENZIONI RECENTI',
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: BrandConfig.primaryColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Divider(color: BrandConfig.primaryColor.withValues(alpha: 0.2))),
        ],
      ),
    );
  }
}
