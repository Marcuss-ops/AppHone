import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/community_intent.dart';

part 'community_intent_provider.g.dart';

@riverpod
class CommunityIntentNotifier extends _$CommunityIntentNotifier {
  @override
  Future<List<CommunityIntent>> build() async {
    // This would fetch from Supabase in production
    return [
      CommunityIntent(
        id: '1',
        userId: 'u1',
        userName: 'Maria Grazia P.',
        content: 'Prego per la salute di mia madre che deve affrontare un intervento domani.',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        supportCount: 24,
      ),
      CommunityIntent(
        id: '2',
        userId: 'u2',
        userName: 'Francesco L.',
        content: 'Ringrazio per il dono della famiglia e chiedo protezione per i miei figli.',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        supportCount: 15,
      ),
      CommunityIntent(
        id: '3',
        userId: 'u3',
        userName: 'Elena Rossi',
        content: 'Chiedo una preghiera per chi ha perso il lavoro in questo momento difficile.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        supportCount: 42,
      ),
      CommunityIntent(
        id: '4',
        userId: 'u4',
        userName: 'Pietro V.',
        content: 'Pace nel mondo e conforto per chi soffre a causa delle guerre.',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        supportCount: 128,
      ),
    ];
  }

  Future<void> addIntent(String content) async {
    final current = await future;
    final newItem = CommunityIntent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: 'me',
      userName: 'You',
      content: content,
      createdAt: DateTime.now(),
    );
    state = AsyncValue.data([newItem, ...current]);
  }

  Future<void> support(String id) async {
    final current = await future;
    state = AsyncValue.data(
      current.map((item) {
        if (item.id == id && !item.hasUserSupported) {
          return item.copyWith(
            supportCount: item.supportCount + 1,
            hasUserSupported: true,
          );
        }
        return item;
      }).toList(),
    );
  }
}
