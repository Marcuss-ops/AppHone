import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/content_provider.dart';
import '../providers/favorites_provider.dart';
import '../../../shared/widgets/content_card.dart';
import '../../../shared/widgets/state_widgets.dart';
import '../../../shared/widgets/blurred_app_bar.dart';
import '../../../core/theme/design_system.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesIds = ref.watch(favoritesProvider);
    final contentAsync = ref.watch(contentListProvider());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BlurredAppBar(
        title: Text('Library', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: contentAsync.when(
        data: (allContent) {
          final favoriteItems = allContent.where((item) => favoritesIds.contains(item.id)).toList();

          if (favoriteItems.isEmpty) {
            return const AppEmptyState(
              title: 'Your library is empty',
              subtitle: 'Saved items will appear here.',
              icon: Icons.bookmark_outline,
            );
          }

          return SafeArea(
            child: GridView.builder(
              padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: AppDesignSystem.spacingSM,
                mainAxisSpacing: AppDesignSystem.spacingSM,
              ),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                return ContentCard(item: favoriteItems[index]);
              },
            ),
          );
        },
        loading: () => const AppLoadingState(),
        error: (e, _) => AppErrorState(message: e.toString()),
      ),
    );
  }
}
