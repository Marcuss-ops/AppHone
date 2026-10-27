// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingStepImpl _$$OnboardingStepImplFromJson(Map<String, dynamic> json) =>
    _$OnboardingStepImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      multiSelect: json['multiSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$$OnboardingStepImplToJson(
        _$OnboardingStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
      'multiSelect': instance.multiSelect,
    };
