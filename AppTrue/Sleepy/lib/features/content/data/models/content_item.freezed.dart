// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentItem _$ContentItemFromJson(Map<String, dynamic> json) {
  return _ContentItem.fromJson(json);
}

/// @nodoc
mixin _$ContentItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get youtubeVideoId => throw _privateConstructorUsedError;
  String? get audioUrl => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  int get progressSeconds => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this ContentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentItemCopyWith<ContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentItemCopyWith<$Res> {
  factory $ContentItemCopyWith(
          ContentItem value, $Res Function(ContentItem) then) =
      _$ContentItemCopyWithImpl<$Res, ContentItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? thumbnailUrl,
      String? youtubeVideoId,
      String? audioUrl,
      String? videoUrl,
      bool isPremium,
      bool isFeatured,
      bool locked,
      int? durationSeconds,
      List<String> tags,
      String? categoryId,
      int progressSeconds,
      bool isCompleted});
}

/// @nodoc
class _$ContentItemCopyWithImpl<$Res, $Val extends ContentItem>
    implements $ContentItemCopyWith<$Res> {
  _$ContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? thumbnailUrl = freezed,
    Object? youtubeVideoId = freezed,
    Object? audioUrl = freezed,
    Object? videoUrl = freezed,
    Object? isPremium = null,
    Object? isFeatured = null,
    Object? locked = null,
    Object? durationSeconds = freezed,
    Object? tags = null,
    Object? categoryId = freezed,
    Object? progressSeconds = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeVideoId: freezed == youtubeVideoId
          ? _value.youtubeVideoId
          : youtubeVideoId // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      progressSeconds: null == progressSeconds
          ? _value.progressSeconds
          : progressSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentItemImplCopyWith<$Res>
    implements $ContentItemCopyWith<$Res> {
  factory _$$ContentItemImplCopyWith(
          _$ContentItemImpl value, $Res Function(_$ContentItemImpl) then) =
      __$$ContentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? thumbnailUrl,
      String? youtubeVideoId,
      String? audioUrl,
      String? videoUrl,
      bool isPremium,
      bool isFeatured,
      bool locked,
      int? durationSeconds,
      List<String> tags,
      String? categoryId,
      int progressSeconds,
      bool isCompleted});
}

/// @nodoc
class __$$ContentItemImplCopyWithImpl<$Res>
    extends _$ContentItemCopyWithImpl<$Res, _$ContentItemImpl>
    implements _$$ContentItemImplCopyWith<$Res> {
  __$$ContentItemImplCopyWithImpl(
      _$ContentItemImpl _value, $Res Function(_$ContentItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? thumbnailUrl = freezed,
    Object? youtubeVideoId = freezed,
    Object? audioUrl = freezed,
    Object? videoUrl = freezed,
    Object? isPremium = null,
    Object? isFeatured = null,
    Object? locked = null,
    Object? durationSeconds = freezed,
    Object? tags = null,
    Object? categoryId = freezed,
    Object? progressSeconds = null,
    Object? isCompleted = null,
  }) {
    return _then(_$ContentItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeVideoId: freezed == youtubeVideoId
          ? _value.youtubeVideoId
          : youtubeVideoId // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      progressSeconds: null == progressSeconds
          ? _value.progressSeconds
          : progressSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentItemImpl implements _ContentItem {
  const _$ContentItemImpl(
      {required this.id,
      required this.title,
      this.description,
      this.thumbnailUrl,
      this.youtubeVideoId,
      this.audioUrl,
      this.videoUrl,
      required this.isPremium,
      this.isFeatured = false,
      this.locked = false,
      this.durationSeconds,
      final List<String> tags = const [],
      this.categoryId,
      this.progressSeconds = 0,
      this.isCompleted = false})
      : _tags = tags;

  factory _$ContentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? thumbnailUrl;
  @override
  final String? youtubeVideoId;
  @override
  final String? audioUrl;
  @override
  final String? videoUrl;
  @override
  final bool isPremium;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  @JsonKey()
  final bool locked;
  @override
  final int? durationSeconds;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? categoryId;
  @override
  @JsonKey()
  final int progressSeconds;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'ContentItem(id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, youtubeVideoId: $youtubeVideoId, audioUrl: $audioUrl, videoUrl: $videoUrl, isPremium: $isPremium, isFeatured: $isFeatured, locked: $locked, durationSeconds: $durationSeconds, tags: $tags, categoryId: $categoryId, progressSeconds: $progressSeconds, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.youtubeVideoId, youtubeVideoId) ||
                other.youtubeVideoId == youtubeVideoId) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.locked, locked) || other.locked == locked) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.progressSeconds, progressSeconds) ||
                other.progressSeconds == progressSeconds) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      thumbnailUrl,
      youtubeVideoId,
      audioUrl,
      videoUrl,
      isPremium,
      isFeatured,
      locked,
      durationSeconds,
      const DeepCollectionEquality().hash(_tags),
      categoryId,
      progressSeconds,
      isCompleted);

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentItemImplCopyWith<_$ContentItemImpl> get copyWith =>
      __$$ContentItemImplCopyWithImpl<_$ContentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentItemImplToJson(
      this,
    );
  }
}

abstract class _ContentItem implements ContentItem {
  const factory _ContentItem(
      {required final String id,
      required final String title,
      final String? description,
      final String? thumbnailUrl,
      final String? youtubeVideoId,
      final String? audioUrl,
      final String? videoUrl,
      required final bool isPremium,
      final bool isFeatured,
      final bool locked,
      final int? durationSeconds,
      final List<String> tags,
      final String? categoryId,
      final int progressSeconds,
      final bool isCompleted}) = _$ContentItemImpl;

  factory _ContentItem.fromJson(Map<String, dynamic> json) =
      _$ContentItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get thumbnailUrl;
  @override
  String? get youtubeVideoId;
  @override
  String? get audioUrl;
  @override
  String? get videoUrl;
  @override
  bool get isPremium;
  @override
  bool get isFeatured;
  @override
  bool get locked;
  @override
  int? get durationSeconds;
  @override
  List<String> get tags;
  @override
  String? get categoryId;
  @override
  int get progressSeconds;
  @override
  bool get isCompleted;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentItemImplCopyWith<_$ContentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  String? get coverUrl => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {String id,
      String name,
      String slug,
      String? iconUrl,
      String? coverUrl,
      int sortOrder});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? iconUrl = freezed,
    Object? coverUrl = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String slug,
      String? iconUrl,
      String? coverUrl,
      int sortOrder});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? iconUrl = freezed,
    Object? coverUrl = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {required this.id,
      required this.name,
      required this.slug,
      this.iconUrl,
      this.coverUrl,
      this.sortOrder = 0});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String? iconUrl;
  @override
  final String? coverUrl;
  @override
  @JsonKey()
  final int sortOrder;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, slug: $slug, iconUrl: $iconUrl, coverUrl: $coverUrl, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, iconUrl, coverUrl, sortOrder);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final String id,
      required final String name,
      required final String slug,
      final String? iconUrl,
      final String? coverUrl,
      final int sortOrder}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String? get iconUrl;
  @override
  String? get coverUrl;
  @override
  int get sortOrder;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get instructorName => throw _privateConstructorUsedError;
  String? get instructorAvatar => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  List<CourseLesson> get lessons => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;

  /// Serializes this Course to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? thumbnailUrl,
      String? instructorName,
      String? instructorAvatar,
      bool isPremium,
      List<CourseLesson> lessons,
      bool locked});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? thumbnailUrl = freezed,
    Object? instructorName = freezed,
    Object? instructorAvatar = freezed,
    Object? isPremium = null,
    Object? lessons = null,
    Object? locked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorName: freezed == instructorName
          ? _value.instructorName
          : instructorName // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorAvatar: freezed == instructorAvatar
          ? _value.instructorAvatar
          : instructorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<CourseLesson>,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$CourseImplCopyWith(
          _$CourseImpl value, $Res Function(_$CourseImpl) then) =
      __$$CourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? thumbnailUrl,
      String? instructorName,
      String? instructorAvatar,
      bool isPremium,
      List<CourseLesson> lessons,
      bool locked});
}

/// @nodoc
class __$$CourseImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$CourseImpl>
    implements _$$CourseImplCopyWith<$Res> {
  __$$CourseImplCopyWithImpl(
      _$CourseImpl _value, $Res Function(_$CourseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? thumbnailUrl = freezed,
    Object? instructorName = freezed,
    Object? instructorAvatar = freezed,
    Object? isPremium = null,
    Object? lessons = null,
    Object? locked = null,
  }) {
    return _then(_$CourseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorName: freezed == instructorName
          ? _value.instructorName
          : instructorName // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorAvatar: freezed == instructorAvatar
          ? _value.instructorAvatar
          : instructorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      lessons: null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<CourseLesson>,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseImpl implements _Course {
  const _$CourseImpl(
      {required this.id,
      required this.title,
      this.description,
      this.thumbnailUrl,
      this.instructorName,
      this.instructorAvatar,
      required this.isPremium,
      final List<CourseLesson> lessons = const [],
      this.locked = false})
      : _lessons = lessons;

  factory _$CourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? thumbnailUrl;
  @override
  final String? instructorName;
  @override
  final String? instructorAvatar;
  @override
  final bool isPremium;
  final List<CourseLesson> _lessons;
  @override
  @JsonKey()
  List<CourseLesson> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  @JsonKey()
  final bool locked;

  @override
  String toString() {
    return 'Course(id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, instructorName: $instructorName, instructorAvatar: $instructorAvatar, isPremium: $isPremium, lessons: $lessons, locked: $locked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.instructorName, instructorName) ||
                other.instructorName == instructorName) &&
            (identical(other.instructorAvatar, instructorAvatar) ||
                other.instructorAvatar == instructorAvatar) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            (identical(other.locked, locked) || other.locked == locked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      thumbnailUrl,
      instructorName,
      instructorAvatar,
      isPremium,
      const DeepCollectionEquality().hash(_lessons),
      locked);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      __$$CourseImplCopyWithImpl<_$CourseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseImplToJson(
      this,
    );
  }
}

abstract class _Course implements Course {
  const factory _Course(
      {required final String id,
      required final String title,
      final String? description,
      final String? thumbnailUrl,
      final String? instructorName,
      final String? instructorAvatar,
      required final bool isPremium,
      final List<CourseLesson> lessons,
      final bool locked}) = _$CourseImpl;

  factory _Course.fromJson(Map<String, dynamic> json) = _$CourseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get thumbnailUrl;
  @override
  String? get instructorName;
  @override
  String? get instructorAvatar;
  @override
  bool get isPremium;
  @override
  List<CourseLesson> get lessons;
  @override
  bool get locked;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseLesson _$CourseLessonFromJson(Map<String, dynamic> json) {
  return _CourseLesson.fromJson(json);
}

/// @nodoc
mixin _$CourseLesson {
  String get id => throw _privateConstructorUsedError;
  int get lessonNumber => throw _privateConstructorUsedError;
  String? get titleOverride => throw _privateConstructorUsedError;
  ContentItem get content => throw _privateConstructorUsedError;

  /// Serializes this CourseLesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseLessonCopyWith<CourseLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseLessonCopyWith<$Res> {
  factory $CourseLessonCopyWith(
          CourseLesson value, $Res Function(CourseLesson) then) =
      _$CourseLessonCopyWithImpl<$Res, CourseLesson>;
  @useResult
  $Res call(
      {String id,
      int lessonNumber,
      String? titleOverride,
      ContentItem content});

  $ContentItemCopyWith<$Res> get content;
}

/// @nodoc
class _$CourseLessonCopyWithImpl<$Res, $Val extends CourseLesson>
    implements $CourseLessonCopyWith<$Res> {
  _$CourseLessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lessonNumber = null,
    Object? titleOverride = freezed,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lessonNumber: null == lessonNumber
          ? _value.lessonNumber
          : lessonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      titleOverride: freezed == titleOverride
          ? _value.titleOverride
          : titleOverride // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentItem,
    ) as $Val);
  }

  /// Create a copy of CourseLesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentItemCopyWith<$Res> get content {
    return $ContentItemCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseLessonImplCopyWith<$Res>
    implements $CourseLessonCopyWith<$Res> {
  factory _$$CourseLessonImplCopyWith(
          _$CourseLessonImpl value, $Res Function(_$CourseLessonImpl) then) =
      __$$CourseLessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int lessonNumber,
      String? titleOverride,
      ContentItem content});

  @override
  $ContentItemCopyWith<$Res> get content;
}

/// @nodoc
class __$$CourseLessonImplCopyWithImpl<$Res>
    extends _$CourseLessonCopyWithImpl<$Res, _$CourseLessonImpl>
    implements _$$CourseLessonImplCopyWith<$Res> {
  __$$CourseLessonImplCopyWithImpl(
      _$CourseLessonImpl _value, $Res Function(_$CourseLessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lessonNumber = null,
    Object? titleOverride = freezed,
    Object? content = null,
  }) {
    return _then(_$CourseLessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lessonNumber: null == lessonNumber
          ? _value.lessonNumber
          : lessonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      titleOverride: freezed == titleOverride
          ? _value.titleOverride
          : titleOverride // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseLessonImpl implements _CourseLesson {
  const _$CourseLessonImpl(
      {required this.id,
      required this.lessonNumber,
      this.titleOverride,
      required this.content});

  factory _$CourseLessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseLessonImplFromJson(json);

  @override
  final String id;
  @override
  final int lessonNumber;
  @override
  final String? titleOverride;
  @override
  final ContentItem content;

  @override
  String toString() {
    return 'CourseLesson(id: $id, lessonNumber: $lessonNumber, titleOverride: $titleOverride, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseLessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lessonNumber, lessonNumber) ||
                other.lessonNumber == lessonNumber) &&
            (identical(other.titleOverride, titleOverride) ||
                other.titleOverride == titleOverride) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, lessonNumber, titleOverride, content);

  /// Create a copy of CourseLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseLessonImplCopyWith<_$CourseLessonImpl> get copyWith =>
      __$$CourseLessonImplCopyWithImpl<_$CourseLessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseLessonImplToJson(
      this,
    );
  }
}

abstract class _CourseLesson implements CourseLesson {
  const factory _CourseLesson(
      {required final String id,
      required final int lessonNumber,
      final String? titleOverride,
      required final ContentItem content}) = _$CourseLessonImpl;

  factory _CourseLesson.fromJson(Map<String, dynamic> json) =
      _$CourseLessonImpl.fromJson;

  @override
  String get id;
  @override
  int get lessonNumber;
  @override
  String? get titleOverride;
  @override
  ContentItem get content;

  /// Create a copy of CourseLesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseLessonImplCopyWith<_$CourseLessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
