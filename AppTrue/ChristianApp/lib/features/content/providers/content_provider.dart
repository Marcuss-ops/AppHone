import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/content_repository.dart';
import '../data/models/content_item.dart';

part 'content_provider.g.dart';

@riverpod
Future<List<ContentItem>> contentList(
  ContentListRef ref, {
  String? categoryId,
  bool featured = false,
}) async {
  return ref.watch(contentRepositoryProvider).getContent(
    categoryId: categoryId,
    featured: featured,
  );
}

@riverpod
Future<List<Category>> categories(CategoriesRef ref) async {
  return ref.watch(contentRepositoryProvider).getCategories();
}

@riverpod
Future<List<Course>> courses(CoursesRef ref) async {
  return ref.watch(contentRepositoryProvider).getCourses();
}

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  String? build() => null;

  void select(String? categoryId) => state = categoryId;
}
