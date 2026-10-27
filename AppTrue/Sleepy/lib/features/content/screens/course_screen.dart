import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/content_provider.dart';
import '../../../brand_config.dart';

class CourseScreen extends ConsumerWidget {
  final String courseId;
  const CourseScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(coursesProvider);

    return coursesAsync.when(
      data: (courses) {
        final course = courses.firstWhere((c) => c.id == courseId,
            orElse: () => courses.first);

        return Scaffold(
          appBar: AppBar(title: Text(course.title)),
          body: CustomScrollView(
            slivers: [
              if (course.thumbnailUrl != null)
                SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CachedNetworkImage(
                      imageUrl: course.thumbnailUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  automaticallyImplyLeading: false,
                ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    if (course.description != null)
                      Text(course.description!,
                          style: TextStyle(color: BrandConfig.textSecondary)),
                    if (course.instructorName != null) ...[
                      const SizedBox(height: 16),
                      Text('Istruttore: ${course.instructorName!}',
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                    const SizedBox(height: 24),
                    Text('Lezioni', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                  ]),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) {
                    final lesson = course.lessons[i];
                    final content = lesson.content;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: BrandConfig.secondaryColor,
                        foregroundColor: BrandConfig.primaryColor,
                        child: Text('${lesson.lessonNumber}'),
                      ),
                      title: Text(lesson.titleOverride ?? content.title),
                      subtitle: content.durationSeconds != null
                          ? Text('${(content.durationSeconds! / 60).round()} min')
                          : null,
                      trailing: content.locked
                          ? const Icon(Icons.lock, color: BrandConfig.secondaryColor)
                          : const Icon(Icons.play_circle_outline),
                      onTap: () => content.locked
                          ? context.push('/paywall')
                          : context.push('/player/${content.id}'),
                    );
                  },
                  childCount: course.lessons.length,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Errore: $e'))),
    );
  }
}
