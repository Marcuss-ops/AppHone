import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/content_provider.dart';
import '../../../shared/widgets/content_card.dart';
import '../../../shared/widgets/state_widgets.dart';
import '../../../shared/widgets/blurred_app_bar.dart';
import '../../../core/theme/design_system.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    final contentAsync = ref.watch(contentListProvider());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        height: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Search', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            const SizedBox(height: 12),
            TextField(
              onChanged: (v) => ref.read(searchQueryProvider.notifier).state = v,
              decoration: InputDecoration(
                hintText: 'Search for contents...',
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
      body: contentAsync.when(
        data: (allContent) {
          final results = allContent.where((item) {
            final q = query.toLowerCase();
            return item.title.toLowerCase().contains(q) ||
                (item.description?.toLowerCase().contains(q) ?? false);
          }).toList();

          if (results.isEmpty) {
            return const AppEmptyState(
              title: 'No results found',
              subtitle: 'Try searching for something else.',
              icon: Icons.search_off,
            );
          }

          return SafeArea(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(AppDesignSystem.spacingMD, 80, AppDesignSystem.spacingMD, AppDesignSystem.spacingMD),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: AppDesignSystem.spacingSM,
                mainAxisSpacing: AppDesignSystem.spacingSM,
              ),
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ContentCard(item: results[index]);
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
