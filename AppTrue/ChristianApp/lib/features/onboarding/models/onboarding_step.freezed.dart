// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnboardingStep _$OnboardingStepFromJson(Map<String, dynamic> json) {
  return _OnboardingStep.fromJson(json);
}

/// @nodoc
mixin _$OnboardingStep {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  bool get multiSelect => throw _privateConstructorUsedError;

  /// Serializes this OnboardingStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingStepCopyWith<OnboardingStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStepCopyWith<$Res> {
  factory $OnboardingStepCopyWith(
          OnboardingStep value, $Res Function(OnboardingStep) then) =
      _$OnboardingStepCopyWithImpl<$Res, OnboardingStep>;
  @useResult
  $Res call(
      {String id, String question, List<String> options, bool multiSelect});
}

/// @nodoc
class _$OnboardingStepCopyWithImpl<$Res, $Val extends OnboardingStep>
    implements $OnboardingStepCopyWith<$Res> {
  _$OnboardingStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? options = null,
    Object? multiSelect = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      multiSelect: null == multiSelect
          ? _value.multiSelect
          : multiSelect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStepImplCopyWith<$Res>
    implements $OnboardingStepCopyWith<$Res> {
  factory _$$OnboardingStepImplCopyWith(_$OnboardingStepImpl value,
          $Res Function(_$OnboardingStepImpl) then) =
      __$$OnboardingStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String question, List<String> options, bool multiSelect});
}

/// @nodoc
class __$$OnboardingStepImplCopyWithImpl<$Res>
    extends _$OnboardingStepCopyWithImpl<$Res, _$OnboardingStepImpl>
    implements _$$OnboardingStepImplCopyWith<$Res> {
  __$$OnboardingStepImplCopyWithImpl(
      _$OnboardingStepImpl _value, $Res Function(_$OnboardingStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? options = null,
    Object? multiSelect = null,
  }) {
    return _then(_$OnboardingStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      multiSelect: null == multiSelect
          ? _value.multiSelect
          : multiSelect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingStepImpl implements _OnboardingStep {
  const _$OnboardingStepImpl(
      {required this.id,
      required this.question,
      required final List<String> options,
      this.multiSelect = false})
      : _options = options;

  factory _$OnboardingStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingStepImplFromJson(json);

  @override
  final String id;
  @override
  final String question;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  @JsonKey()
  final bool multiSelect;

  @override
  String toString() {
    return 'OnboardingStep(id: $id, question: $question, options: $options, multiSelect: $multiSelect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.multiSelect, multiSelect) ||
                other.multiSelect == multiSelect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question,
      const DeepCollectionEquality().hash(_options), multiSelect);

  /// Create a copy of OnboardingStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStepImplCopyWith<_$OnboardingStepImpl> get copyWith =>
      __$$OnboardingStepImplCopyWithImpl<_$OnboardingStepImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingStepImplToJson(
      this,
    );
  }
}

abstract class _OnboardingStep implements OnboardingStep {
  const factory _OnboardingStep(
      {required final String id,
      required final String question,
      required final List<String> options,
      final bool multiSelect}) = _$OnboardingStepImpl;

  factory _OnboardingStep.fromJson(Map<String, dynamic> json) =
      _$OnboardingStepImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  List<String> get options;
  @override
  bool get multiSelect;

  /// Create a copy of OnboardingStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingStepImplCopyWith<_$OnboardingStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
