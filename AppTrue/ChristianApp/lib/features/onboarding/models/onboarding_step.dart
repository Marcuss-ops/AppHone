import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step.freezed.dart';
part 'onboarding_step.g.dart';

@freezed
class OnboardingStep with _$OnboardingStep {
  const factory OnboardingStep({
    required String id,
    required String question,
    required List<String> options,
    @Default(false) bool multiSelect,
  }) = _OnboardingStep;

  factory OnboardingStep.fromJson(Map<String, dynamic> json) => _$OnboardingStepFromJson(json);
}
