// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrayerRoom _$PrayerRoomFromJson(Map<String, dynamic> json) {
  return _PrayerRoom.fromJson(json);
}

/// @nodoc
mixin _$PrayerRoom {
  String get id => throw _privateConstructorUsedError;
  String get hostUserId => throw _privateConstructorUsedError;
  String get hostName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  String get sessionType =>
      throw _privateConstructorUsedError; // e.g., 'Rosary', 'Meditation'
  List<String> get participantIds => throw _privateConstructorUsedError;
  int get participantCount => throw _privateConstructorUsedError;
  bool get isLive => throw _privateConstructorUsedError;

  /// Serializes this PrayerRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrayerRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerRoomCopyWith<PrayerRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerRoomCopyWith<$Res> {
  factory $PrayerRoomCopyWith(
          PrayerRoom value, $Res Function(PrayerRoom) then) =
      _$PrayerRoomCopyWithImpl<$Res, PrayerRoom>;
  @useResult
  $Res call(
      {String id,
      String hostUserId,
      String hostName,
      String title,
      DateTime scheduledAt,
      String sessionType,
      List<String> participantIds,
      int participantCount,
      bool isLive});
}

/// @nodoc
class _$PrayerRoomCopyWithImpl<$Res, $Val extends PrayerRoom>
    implements $PrayerRoomCopyWith<$Res> {
  _$PrayerRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrayerRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hostUserId = null,
    Object? hostName = null,
    Object? title = null,
    Object? scheduledAt = null,
    Object? sessionType = null,
    Object? participantIds = null,
    Object? participantCount = null,
    Object? isLive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hostUserId: null == hostUserId
          ? _value.hostUserId
          : hostUserId // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionType: null == sessionType
          ? _value.sessionType
          : sessionType // ignore: cast_nullable_to_non_nullable
              as String,
      participantIds: null == participantIds
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      participantCount: null == participantCount
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrayerRoomImplCopyWith<$Res>
    implements $PrayerRoomCopyWith<$Res> {
  factory _$$PrayerRoomImplCopyWith(
          _$PrayerRoomImpl value, $Res Function(_$PrayerRoomImpl) then) =
      __$$PrayerRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String hostUserId,
      String hostName,
      String title,
      DateTime scheduledAt,
      String sessionType,
      List<String> participantIds,
      int participantCount,
      bool isLive});
}

/// @nodoc
class __$$PrayerRoomImplCopyWithImpl<$Res>
    extends _$PrayerRoomCopyWithImpl<$Res, _$PrayerRoomImpl>
    implements _$$PrayerRoomImplCopyWith<$Res> {
  __$$PrayerRoomImplCopyWithImpl(
      _$PrayerRoomImpl _value, $Res Function(_$PrayerRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hostUserId = null,
    Object? hostName = null,
    Object? title = null,
    Object? scheduledAt = null,
    Object? sessionType = null,
    Object? participantIds = null,
    Object? participantCount = null,
    Object? isLive = null,
  }) {
    return _then(_$PrayerRoomImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hostUserId: null == hostUserId
          ? _value.hostUserId
          : hostUserId // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionType: null == sessionType
          ? _value.sessionType
          : sessionType // ignore: cast_nullable_to_non_nullable
              as String,
      participantIds: null == participantIds
          ? _value._participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      participantCount: null == participantCount
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrayerRoomImpl implements _PrayerRoom {
  const _$PrayerRoomImpl(
      {required this.id,
      required this.hostUserId,
      required this.hostName,
      required this.title,
      required this.scheduledAt,
      required this.sessionType,
      final List<String> participantIds = const [],
      this.participantCount = 0,
      this.isLive = false})
      : _participantIds = participantIds;

  factory _$PrayerRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrayerRoomImplFromJson(json);

  @override
  final String id;
  @override
  final String hostUserId;
  @override
  final String hostName;
  @override
  final String title;
  @override
  final DateTime scheduledAt;
  @override
  final String sessionType;
// e.g., 'Rosary', 'Meditation'
  final List<String> _participantIds;
// e.g., 'Rosary', 'Meditation'
  @override
  @JsonKey()
  List<String> get participantIds {
    if (_participantIds is EqualUnmodifiableListView) return _participantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantIds);
  }

  @override
  @JsonKey()
  final int participantCount;
  @override
  @JsonKey()
  final bool isLive;

  @override
  String toString() {
    return 'PrayerRoom(id: $id, hostUserId: $hostUserId, hostName: $hostName, title: $title, scheduledAt: $scheduledAt, sessionType: $sessionType, participantIds: $participantIds, participantCount: $participantCount, isLive: $isLive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerRoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hostUserId, hostUserId) ||
                other.hostUserId == hostUserId) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.sessionType, sessionType) ||
                other.sessionType == sessionType) &&
            const DeepCollectionEquality()
                .equals(other._participantIds, _participantIds) &&
            (identical(other.participantCount, participantCount) ||
                other.participantCount == participantCount) &&
            (identical(other.isLive, isLive) || other.isLive == isLive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hostUserId,
      hostName,
      title,
      scheduledAt,
      sessionType,
      const DeepCollectionEquality().hash(_participantIds),
      participantCount,
      isLive);

  /// Create a copy of PrayerRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerRoomImplCopyWith<_$PrayerRoomImpl> get copyWith =>
      __$$PrayerRoomImplCopyWithImpl<_$PrayerRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrayerRoomImplToJson(
      this,
    );
  }
}

abstract class _PrayerRoom implements PrayerRoom {
  const factory _PrayerRoom(
      {required final String id,
      required final String hostUserId,
      required final String hostName,
      required final String title,
      required final DateTime scheduledAt,
      required final String sessionType,
      final List<String> participantIds,
      final int participantCount,
      final bool isLive}) = _$PrayerRoomImpl;

  factory _PrayerRoom.fromJson(Map<String, dynamic> json) =
      _$PrayerRoomImpl.fromJson;

  @override
  String get id;
  @override
  String get hostUserId;
  @override
  String get hostName;
  @override
  String get title;
  @override
  DateTime get scheduledAt;
  @override
  String get sessionType; // e.g., 'Rosary', 'Meditation'
  @override
  List<String> get participantIds;
  @override
  int get participantCount;
  @override
  bool get isLive;

  /// Create a copy of PrayerRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerRoomImplCopyWith<_$PrayerRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
