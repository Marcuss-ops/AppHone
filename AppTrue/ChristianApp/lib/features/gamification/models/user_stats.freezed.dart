// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
mixin _$UserStats {
  int get streak => throw _privateConstructorUsedError;
  int get hearts => throw _privateConstructorUsedError;
  int get xp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get streakFreezeCount => throw _privateConstructorUsedError;
  Map<String, bool> get dailyQuests => throw _privateConstructorUsedError;
  DateTime? get lastActivityDate => throw _privateConstructorUsedError;
  DateTime? get lastQuestResetDate => throw _privateConstructorUsedError;

  /// Serializes this UserStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res, UserStats>;
  @useResult
  $Res call(
      {int streak,
      int hearts,
      int xp,
      int level,
      int streakFreezeCount,
      Map<String, bool> dailyQuests,
      DateTime? lastActivityDate,
      DateTime? lastQuestResetDate});
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res, $Val extends UserStats>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streak = null,
    Object? hearts = null,
    Object? xp = null,
    Object? level = null,
    Object? streakFreezeCount = null,
    Object? dailyQuests = null,
    Object? lastActivityDate = freezed,
    Object? lastQuestResetDate = freezed,
  }) {
    return _then(_value.copyWith(
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      hearts: null == hearts
          ? _value.hearts
          : hearts // ignore: cast_nullable_to_non_nullable
              as int,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      streakFreezeCount: null == streakFreezeCount
          ? _value.streakFreezeCount
          : streakFreezeCount // ignore: cast_nullable_to_non_nullable
              as int,
      dailyQuests: null == dailyQuests
          ? _value.dailyQuests
          : dailyQuests // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      lastActivityDate: freezed == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastQuestResetDate: freezed == lastQuestResetDate
          ? _value.lastQuestResetDate
          : lastQuestResetDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatsImplCopyWith<$Res>
    implements $UserStatsCopyWith<$Res> {
  factory _$$UserStatsImplCopyWith(
          _$UserStatsImpl value, $Res Function(_$UserStatsImpl) then) =
      __$$UserStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int streak,
      int hearts,
      int xp,
      int level,
      int streakFreezeCount,
      Map<String, bool> dailyQuests,
      DateTime? lastActivityDate,
      DateTime? lastQuestResetDate});
}

/// @nodoc
class __$$UserStatsImplCopyWithImpl<$Res>
    extends _$UserStatsCopyWithImpl<$Res, _$UserStatsImpl>
    implements _$$UserStatsImplCopyWith<$Res> {
  __$$UserStatsImplCopyWithImpl(
      _$UserStatsImpl _value, $Res Function(_$UserStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streak = null,
    Object? hearts = null,
    Object? xp = null,
    Object? level = null,
    Object? streakFreezeCount = null,
    Object? dailyQuests = null,
    Object? lastActivityDate = freezed,
    Object? lastQuestResetDate = freezed,
  }) {
    return _then(_$UserStatsImpl(
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      hearts: null == hearts
          ? _value.hearts
          : hearts // ignore: cast_nullable_to_non_nullable
              as int,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      streakFreezeCount: null == streakFreezeCount
          ? _value.streakFreezeCount
          : streakFreezeCount // ignore: cast_nullable_to_non_nullable
              as int,
      dailyQuests: null == dailyQuests
          ? _value._dailyQuests
          : dailyQuests // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      lastActivityDate: freezed == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastQuestResetDate: freezed == lastQuestResetDate
          ? _value.lastQuestResetDate
          : lastQuestResetDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsImpl implements _UserStats {
  const _$UserStatsImpl(
      {this.streak = 0,
      this.hearts = 5,
      this.xp = 0,
      this.level = 0,
      this.streakFreezeCount = 0,
      final Map<String, bool> dailyQuests = const {},
      this.lastActivityDate,
      this.lastQuestResetDate})
      : _dailyQuests = dailyQuests;

  factory _$UserStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsImplFromJson(json);

  @override
  @JsonKey()
  final int streak;
  @override
  @JsonKey()
  final int hearts;
  @override
  @JsonKey()
  final int xp;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey()
  final int streakFreezeCount;
  final Map<String, bool> _dailyQuests;
  @override
  @JsonKey()
  Map<String, bool> get dailyQuests {
    if (_dailyQuests is EqualUnmodifiableMapView) return _dailyQuests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dailyQuests);
  }

  @override
  final DateTime? lastActivityDate;
  @override
  final DateTime? lastQuestResetDate;

  @override
  String toString() {
    return 'UserStats(streak: $streak, hearts: $hearts, xp: $xp, level: $level, streakFreezeCount: $streakFreezeCount, dailyQuests: $dailyQuests, lastActivityDate: $lastActivityDate, lastQuestResetDate: $lastQuestResetDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsImpl &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.hearts, hearts) || other.hearts == hearts) &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.streakFreezeCount, streakFreezeCount) ||
                other.streakFreezeCount == streakFreezeCount) &&
            const DeepCollectionEquality()
                .equals(other._dailyQuests, _dailyQuests) &&
            (identical(other.lastActivityDate, lastActivityDate) ||
                other.lastActivityDate == lastActivityDate) &&
            (identical(other.lastQuestResetDate, lastQuestResetDate) ||
                other.lastQuestResetDate == lastQuestResetDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      streak,
      hearts,
      xp,
      level,
      streakFreezeCount,
      const DeepCollectionEquality().hash(_dailyQuests),
      lastActivityDate,
      lastQuestResetDate);

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      __$$UserStatsImplCopyWithImpl<_$UserStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsImplToJson(
      this,
    );
  }
}

abstract class _UserStats implements UserStats {
  const factory _UserStats(
      {final int streak,
      final int hearts,
      final int xp,
      final int level,
      final int streakFreezeCount,
      final Map<String, bool> dailyQuests,
      final DateTime? lastActivityDate,
      final DateTime? lastQuestResetDate}) = _$UserStatsImpl;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$UserStatsImpl.fromJson;

  @override
  int get streak;
  @override
  int get hearts;
  @override
  int get xp;
  @override
  int get level;
  @override
  int get streakFreezeCount;
  @override
  Map<String, bool> get dailyQuests;
  @override
  DateTime? get lastActivityDate;
  @override
  DateTime? get lastQuestResetDate;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
