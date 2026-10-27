import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum InteractionType {
  support,    // e.g. "I prayed for this", "I support this"
  completion, // e.g. "I finished this"
  reaction,   // e.g. "I like this"
}

class SocialInteraction {
  final String id;
  final String targetId; // ID of the content (prayer, course, etc.)
  final InteractionType type;
  final int count;

  SocialInteraction({
    required this.id,
    required this.targetId,
    required this.type,
    required this.count,
  });
}

class SocialInteractionService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Stream for real-time updates on a specific interaction
  Stream<int> watchInteractionCount(String targetId, InteractionType type) {
    // In production:
    // return _supabase
    //     .from('interactions')
    //     .stream(primaryKey: ['id'])
    //     .eq('target_id', targetId)
    //     .eq('type', type.name)
    //     .map((data) => data.length);
    
    // Simulated stream
    return Stream.periodic(const Duration(seconds: 5), (i) => 100 + i).take(10);
  }

  Future<void> performInteraction(String targetId, InteractionType type) async {
    // In production:
    // await _supabase.from('interactions').insert({
    //   'target_id': targetId,
    //   'type': type.name,
    //   'user_id': _supabase.auth.currentUser?.id,
    // });
    
    print('Performed generic interaction: $type on $targetId');
  }
}

final socialInteractionServiceProvider = Provider((ref) => SocialInteractionService());
