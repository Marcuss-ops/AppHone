import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_item.freezed.dart';
part 'content_item.g.dart';

@freezed
class ContentItem with _$ContentItem {
  const factory ContentItem({
    required String id,
    required String title,
    String? description,
    String? thumbnailUrl,
    String? youtubeVideoId,
    String? audioUrl,
    String? videoUrl,
    required bool isPremium,
    @Default(false) bool isFeatured,
    @Default(false) bool locked,
    int? durationSeconds,
    @Default([]) List<String> tags,
    String? categoryId,
    @Default(0) int progressSeconds,
    @Default(false) bool isCompleted,
  }) = _ContentItem;

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String slug,
    String? iconUrl,
    String? coverUrl,
    @Default(0) int sortOrder,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Course with _$Course {
  const factory Course({
    required String id,
    required String title,
    String? description,
    String? thumbnailUrl,
    String? instructorName,
    String? instructorAvatar,
    required bool isPremium,
    @Default([]) List<CourseLesson> lessons,
    @Default(false) bool locked,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) =>
      _$CourseFromJson(json);
}

@freezed
class CourseLesson with _$CourseLesson {
  const factory CourseLesson({
    required String id,
    required int lessonNumber,
    String? titleOverride,
    required ContentItem content,
  }) = _CourseLesson;

  factory CourseLesson.fromJson(Map<String, dynamic> json) =>
      _$CourseLessonFromJson(json);
}
