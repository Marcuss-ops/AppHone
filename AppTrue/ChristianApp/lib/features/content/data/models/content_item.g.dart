// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentItemImpl _$$ContentItemImplFromJson(Map<String, dynamic> json) =>
    _$ContentItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      youtubeVideoId: json['youtubeVideoId'] as String?,
      audioUrl: json['audioUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      isPremium: json['isPremium'] as bool,
      isFeatured: json['isFeatured'] as bool? ?? false,
      locked: json['locked'] as bool? ?? false,
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      categoryId: json['categoryId'] as String?,
      progressSeconds: (json['progressSeconds'] as num?)?.toInt() ?? 0,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$ContentItemImplToJson(_$ContentItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'youtubeVideoId': instance.youtubeVideoId,
      'audioUrl': instance.audioUrl,
      'videoUrl': instance.videoUrl,
      'isPremium': instance.isPremium,
      'isFeatured': instance.isFeatured,
      'locked': instance.locked,
      'durationSeconds': instance.durationSeconds,
      'tags': instance.tags,
      'categoryId': instance.categoryId,
      'progressSeconds': instance.progressSeconds,
      'isCompleted': instance.isCompleted,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      iconUrl: json['iconUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'iconUrl': instance.iconUrl,
      'coverUrl': instance.coverUrl,
      'sortOrder': instance.sortOrder,
    };

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      instructorName: json['instructorName'] as String?,
      instructorAvatar: json['instructorAvatar'] as String?,
      isPremium: json['isPremium'] as bool,
      lessons: (json['lessons'] as List<dynamic>?)
              ?.map((e) => CourseLesson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      locked: json['locked'] as bool? ?? false,
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'instructorName': instance.instructorName,
      'instructorAvatar': instance.instructorAvatar,
      'isPremium': instance.isPremium,
      'lessons': instance.lessons,
      'locked': instance.locked,
    };

_$CourseLessonImpl _$$CourseLessonImplFromJson(Map<String, dynamic> json) =>
    _$CourseLessonImpl(
      id: json['id'] as String,
      lessonNumber: (json['lessonNumber'] as num).toInt(),
      titleOverride: json['titleOverride'] as String?,
      content: ContentItem.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CourseLessonImplToJson(_$CourseLessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lessonNumber': instance.lessonNumber,
      'titleOverride': instance.titleOverride,
      'content': instance.content,
    };
