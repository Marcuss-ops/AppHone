# Dynamic Onboarding 📝

A data-driven onboarding system that captures user preferences before they enter the main app.

## Features

- **Model Driven:** Questions and options are defined using the `OnboardingStep` model.
- **Generic UI:** The `OnboardingScreen` automatically renders questions, multi-select options, and progress bars.
- **UX Best Practice:** Includes faked "processing" logic (can be added) and immediate state feedback.

## How to use

1. Define your steps:
   ```dart
   final steps = [
     OnboardingStep(id: 'goal', question: 'What is your goal?', options: ['Faith', 'Peace', 'Growth']),
   ];
   ```
2. Navigate to `OnboardingScreen(steps: steps, onCompleted: () => goHome())`.

## Why it's in the skeleton

High-converting apps use onboarding to "invest" the user in the experience before asking for a registration or subscription. This module provides a standard, polished way to build that funnel.
