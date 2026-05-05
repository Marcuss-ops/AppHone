import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/content_provider.dart';
import '../../../shared/widgets/content_card.dart';
import '../../../core/theme/design_system.dart';

class CategorySection extends ConsumerWidget {
  final String title;
  final String categoryId;

  const CategorySection({
    super.key,
    required this.title,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentAsync = ref.watch(contentListProvider(categoryId: categoryId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppDesignSystem.h2),
              TextButton(
                onPressed: () {
                  // Navigate to category screen
                },
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDesignSystem.spacingSM),
        contentAsync.when(
          data: (items) => SizedBox(
            height: 220,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: AppDesignSystem.spacingSM),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 280,
                  child: ContentCard(content: items[index]),
                );
              },
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
        ),
      ],
    );
  }
}
