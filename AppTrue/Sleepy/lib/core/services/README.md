# Core Services 🛠️

This directory contains foundational services used across all brands. These are designed as abstract wrappers or mockable providers to keep the skeleton flexible.

## 📊 Analytics Service

A swappable wrapper for tracking user behavior.

- **Interface:** `AnalyticsService` in `analytics_service.dart`.
- **Usage:**
  ```dart
  ref.read(analyticsServiceProvider).logEvent('button_clicked', parameters: {'id': 'start'});
  ```
- **Why it's in the skeleton:** Allows you to start with simple `debugPrint` logs and later swap to Firebase, Mixpanel, or PostHog by changing only the provider implementation.

## 🔔 Notification Service

Handles local push notifications for retention and reminders.

- **Package:** `flutter_local_notifications`.
- **Key Methods:**
  - `init()`: Initializes timezone data and plugin settings.
  - `scheduleDailyReminder()`: Sets up a recurring notification.
- **Why it's in the skeleton:** Essential for "Habit Builder" apps (meditation, courses) to remind users to complete their daily streak.
