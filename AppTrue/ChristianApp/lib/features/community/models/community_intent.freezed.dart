// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityIntent _$CommunityIntentFromJson(Map<String, dynamic> json) {
  return _CommunityIntent.fromJson(json);
}

/// @nodoc
mixin _$CommunityIntent {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get supportCount => throw _privateConstructorUsedError;
  bool get hasUserSupported => throw _privateConstructorUsedError;

  /// Serializes this CommunityIntent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityIntentCopyWith<CommunityIntent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityIntentCopyWith<$Res> {
  factory $CommunityIntentCopyWith(
          CommunityIntent value, $Res Function(CommunityIntent) then) =
      _$CommunityIntentCopyWithImpl<$Res, CommunityIntent>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String content,
      DateTime createdAt,
      int supportCount,
      bool hasUserSupported});
}

/// @nodoc
class _$CommunityIntentCopyWithImpl<$Res, $Val extends CommunityIntent>
    implements $CommunityIntentCopyWith<$Res> {
  _$CommunityIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? content = null,
    Object? createdAt = null,
    Object? supportCount = null,
    Object? hasUserSupported = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supportCount: null == supportCount
          ? _value.supportCount
          : supportCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasUserSupported: null == hasUserSupported
          ? _value.hasUserSupported
          : hasUserSupported // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityIntentImplCopyWith<$Res>
    implements $CommunityIntentCopyWith<$Res> {
  factory _$$CommunityIntentImplCopyWith(_$CommunityIntentImpl value,
          $Res Function(_$CommunityIntentImpl) then) =
      __$$CommunityIntentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String content,
      DateTime createdAt,
      int supportCount,
      bool hasUserSupported});
}

/// @nodoc
class __$$CommunityIntentImplCopyWithImpl<$Res>
    extends _$CommunityIntentCopyWithImpl<$Res, _$CommunityIntentImpl>
    implements _$$CommunityIntentImplCopyWith<$Res> {
  __$$CommunityIntentImplCopyWithImpl(
      _$CommunityIntentImpl _value, $Res Function(_$CommunityIntentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? content = null,
    Object? createdAt = null,
    Object? supportCount = null,
    Object? hasUserSupported = null,
  }) {
    return _then(_$CommunityIntentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supportCount: null == supportCount
          ? _value.supportCount
          : supportCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasUserSupported: null == hasUserSupported
          ? _value.hasUserSupported
          : hasUserSupported // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityIntentImpl implements _CommunityIntent {
  const _$CommunityIntentImpl(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.content,
      required this.createdAt,
      this.supportCount = 0,
      this.hasUserSupported = false});

  factory _$CommunityIntentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityIntentImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final int supportCount;
  @override
  @JsonKey()
  final bool hasUserSupported;

  @override
  String toString() {
    return 'CommunityIntent(id: $id, userId: $userId, userName: $userName, content: $content, createdAt: $createdAt, supportCount: $supportCount, hasUserSupported: $hasUserSupported)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityIntentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.supportCount, supportCount) ||
                other.supportCount == supportCount) &&
            (identical(other.hasUserSupported, hasUserSupported) ||
                other.hasUserSupported == hasUserSupported));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, userName, content,
      createdAt, supportCount, hasUserSupported);

  /// Create a copy of CommunityIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityIntentImplCopyWith<_$CommunityIntentImpl> get copyWith =>
      __$$CommunityIntentImplCopyWithImpl<_$CommunityIntentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityIntentImplToJson(
      this,
    );
  }
}

abstract class _CommunityIntent implements CommunityIntent {
  const factory _CommunityIntent(
      {required final String id,
      required final String userId,
      required final String userName,
      required final String content,
      required final DateTime createdAt,
      final int supportCount,
      final bool hasUserSupported}) = _$CommunityIntentImpl;

  factory _CommunityIntent.fromJson(Map<String, dynamic> json) =
      _$CommunityIntentImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  int get supportCount;
  @override
  bool get hasUserSupported;

  /// Create a copy of CommunityIntent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityIntentImplCopyWith<_$CommunityIntentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
