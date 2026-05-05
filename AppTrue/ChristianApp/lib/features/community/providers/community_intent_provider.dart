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
        userName: 'User A',
        content: 'I need some support with my current project.',
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        supportCount: 5,
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
