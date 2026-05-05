import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/content_provider.dart';
import '../../../shared/widgets/content_card.dart';

class CategoryScreen extends ConsumerWidget {
  final String categoryId;
  const CategoryScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentAsync = ref.watch(contentListProvider(categoryId: categoryId));
    final categoriesAsync = ref.watch(categoriesProvider);

    final categoryName = categoriesAsync.value
        ?.firstWhere((c) => c.id == categoryId, orElse: () => categoriesAsync.value!.first)
        .name ?? '';

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: contentAsync.when(
        data: (items) => GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (_, i) => ContentCard(item: items[i]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Errore: $e')),
      ),
    );
  }
}
