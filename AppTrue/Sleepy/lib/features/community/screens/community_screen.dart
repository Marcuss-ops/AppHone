import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/config/app_config.dart';
import '../../../core/config/active_config.dart';
import '../../../shared/widgets/app_ui_components.dart';
import '../providers/community_intent_provider.dart';
import '../providers/prayer_room_provider.dart';
import '../widgets/community_intent_card.dart';

class CommunityScreen extends ConsumerWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intentsAsync = ref.watch(communityIntentNotifierProvider);
    final config = ref.watch(activeConfigProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: intentsAsync.when(
          data: (intents) => ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
            itemCount: intents.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildHeaderSection(context, ref, config);
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

  Widget _buildHeaderSection(BuildContext context, WidgetRef ref, AppConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(config),
        const SizedBox(height: 24),
        _buildRoomsSection(context, ref, config),
        const SizedBox(height: 24),
        _buildCreateRoomButton(context, ref, config),
        const SizedBox(height: 32),
        _buildQuickPostCard(context, ref, config),
        const SizedBox(height: 32),
        _buildSectionDivider(config),
      ],
    );
  }

  Widget _buildTitle(AppConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          config.copy.communityTitle,
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          config.copy.communitySubtitle,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 16),
        _buildLiveCounter(config),
      ],
    );
  }

  Widget _buildLiveCounter(AppConfig config) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ).animate(onPlay: (controller) => controller.repeat())
           .scale(begin: const Offset(1, 1), end: const Offset(1.5, 1.5), duration: 800.ms, curve: Curves.easeInOut)
           .then()
           .scale(begin: const Offset(1.5, 1.5), end: const Offset(1, 1), duration: 800.ms, curve: Curves.easeInOut),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              style: GoogleFonts.inter(fontSize: 12, color: Colors.green[300]),
              children: [
                TextSpan(text: config.copy.communityLiveCountContacts, style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: ' '),
                TextSpan(text: config.copy.communityLiveCountOthers),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomsSection(BuildContext context, WidgetRef ref, AppConfig config) {
    final roomsAsync = ref.watch(prayerRoomNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          config.copy.communityRoomsTitle,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: config.primaryAccent,
          ),
        ),
        const SizedBox(height: 16),
        roomsAsync.when(
          data: (rooms) => SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];
                return _buildRoomCard(context, room, config);
              },
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Text('Error: $e'),
        ),
      ],
    );
  }

  Widget _buildCreateRoomButton(BuildContext context, WidgetRef ref, AppConfig config) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _showCreateRoomDialog(context, ref, config),
        icon: const Icon(Icons.add, size: 18),
        label: Text(config.copy.communityCreateRoomAction),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }

  Widget _buildRoomCard(BuildContext context, dynamic room, AppConfig config) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      child: AppGlassCard(
        opacity: 0.1,
        borderRadius: 20,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.people, size: 12, color: Colors.green),
                ),
                const SizedBox(width: 6),
                Text(
                  '${room.participantCount} presenti',
                  style: GoogleFonts.inter(fontSize: 10, color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              room.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Host: ${room.hostName}',
              style: GoogleFonts.inter(fontSize: 12, color: Colors.white54),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Link WhatsApp generato: ipray.app/room/invite')),
                  );
                },
                icon: Icon(PhosphorIcons.whatsappLogo(PhosphorIconsStyle.fill), size: 16),
                label: Text(config.copy.communityInviteWhatsApp, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateRoomDialog(BuildContext context, WidgetRef ref, AppConfig config) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: AppGlassCard(
          opacity: 0.2,
          borderRadius: 24,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Crea la tua stanza', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Invita i tuoi cari a pregare con te', style: GoogleFonts.inter(fontSize: 14, color: Colors.white54)),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'es: Rosario delle 20:30',
                  hintStyle: const TextStyle(color: Colors.white38),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: config.primaryAccent.withValues(alpha: 0.3))),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      ref.read(prayerRoomNotifierProvider.notifier).createRoom(
                        title: controller.text,
                        sessionType: 'Session',
                        scheduledAt: DateTime.now(),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: config.primaryAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('CREA E INVITA'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickPostCard(BuildContext context, WidgetRef ref, AppConfig config) {
    final controller = TextEditingController();

    return AppGlassCard(
      opacity: 0.12,
      borderRadius: 24,
      borderColor: config.primaryAccent.withValues(alpha: 0.2),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(PhosphorIcons.handsPraying(), color: config.primaryAccent, size: 24),
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
              hintText: config.copy.communityInputPlaceholder,
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
                    SnackBar(
                      content: const Text('Intenzione pubblicata! Generazione immagine...'),
                      backgroundColor: config.primaryAccent,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: config.primaryAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: Text(
                config.copy.communityPostAction,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionDivider(AppConfig config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text(
            config.copy.communityRecentIntentsTitle,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: config.primaryAccent,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Divider(color: config.primaryAccent.withValues(alpha: 0.2))),
        ],
      ),
    );
  }
}
