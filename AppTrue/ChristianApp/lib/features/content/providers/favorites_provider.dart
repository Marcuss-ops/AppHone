import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_provider.g.dart';

@riverpod
class Favorites extends _$Favorites {
  static const _key = 'favorites_ids';

  @override
  List<String> build() {
    _load();
    return [];
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList(_key) ?? [];
    state = ids;
  }

  Future<void> toggle(String contentId) async {
    final prefs = await SharedPreferences.getInstance();
    final ids = List<String>.from(state);
    
    if (ids.contains(contentId)) {
      ids.remove(contentId);
    } else {
      ids.add(contentId);
    }
    
    await prefs.setStringList(_key, ids);
    state = ids;
  }

  bool isFavorite(String contentId) {
    return state.contains(contentId);
  }
}
