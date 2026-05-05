// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspiration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Inspiration _$InspirationFromJson(Map<String, dynamic> json) {
  return _Inspiration.fromJson(json);
}

/// @nodoc
mixin _$Inspiration {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get source =>
      throw _privateConstructorUsedError; // e.g., "Giovanni 3:16" or "Marco Aurelio"
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get audioUrl => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this Inspiration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Inspiration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InspirationCopyWith<Inspiration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspirationCopyWith<$Res> {
  factory $InspirationCopyWith(
          Inspiration value, $Res Function(Inspiration) then) =
      _$InspirationCopyWithImpl<$Res, Inspiration>;
  @useResult
  $Res call(
      {String id,
      String content,
      String source,
      String? imageUrl,
      String? audioUrl,
      List<String> tags});
}

/// @nodoc
class _$InspirationCopyWithImpl<$Res, $Val extends Inspiration>
    implements $InspirationCopyWith<$Res> {
  _$InspirationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Inspiration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? source = null,
    Object? imageUrl = freezed,
    Object? audioUrl = freezed,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InspirationImplCopyWith<$Res>
    implements $InspirationCopyWith<$Res> {
  factory _$$InspirationImplCopyWith(
          _$InspirationImpl value, $Res Function(_$InspirationImpl) then) =
      __$$InspirationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String source,
      String? imageUrl,
      String? audioUrl,
      List<String> tags});
}

/// @nodoc
class __$$InspirationImplCopyWithImpl<$Res>
    extends _$InspirationCopyWithImpl<$Res, _$InspirationImpl>
    implements _$$InspirationImplCopyWith<$Res> {
  __$$InspirationImplCopyWithImpl(
      _$InspirationImpl _value, $Res Function(_$InspirationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Inspiration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? source = null,
    Object? imageUrl = freezed,
    Object? audioUrl = freezed,
    Object? tags = null,
  }) {
    return _then(_$InspirationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InspirationImpl implements _Inspiration {
  const _$InspirationImpl(
      {required this.id,
      required this.content,
      required this.source,
      this.imageUrl,
      this.audioUrl,
      final List<String> tags = const []})
      : _tags = tags;

  factory _$InspirationImpl.fromJson(Map<String, dynamic> json) =>
      _$$InspirationImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String source;
// e.g., "Giovanni 3:16" or "Marco Aurelio"
  @override
  final String? imageUrl;
  @override
  final String? audioUrl;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Inspiration(id: $id, content: $content, source: $source, imageUrl: $imageUrl, audioUrl: $audioUrl, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspirationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, source, imageUrl,
      audioUrl, const DeepCollectionEquality().hash(_tags));

  /// Create a copy of Inspiration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InspirationImplCopyWith<_$InspirationImpl> get copyWith =>
      __$$InspirationImplCopyWithImpl<_$InspirationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InspirationImplToJson(
      this,
    );
  }
}

abstract class _Inspiration implements Inspiration {
  const factory _Inspiration(
      {required final String id,
      required final String content,
      required final String source,
      final String? imageUrl,
      final String? audioUrl,
      final List<String> tags}) = _$InspirationImpl;

  factory _Inspiration.fromJson(Map<String, dynamic> json) =
      _$InspirationImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get source; // e.g., "Giovanni 3:16" or "Marco Aurelio"
  @override
  String? get imageUrl;
  @override
  String? get audioUrl;
  @override
  List<String> get tags;

  /// Create a copy of Inspiration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InspirationImplCopyWith<_$InspirationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
