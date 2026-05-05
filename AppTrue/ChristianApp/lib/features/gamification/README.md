# Gamification Module 🏆

This module provides the logic and UI for gamifying the user experience, inspired by platforms like Duolingo. It is designed to be highly reusable and configurable across different brands.

## Features

- **Streaks:** Tracks consecutive days of activity. Resets if a day is missed.
- **XP (Experience Points):** Rewards users for completing tasks or lessons.
- **Hearts (Lives):** Can be used to limit errors or gate access to content.
- **Persistennce:** Automatically saves stats to local storage (`SharedPreferences`).
- **Configurable:** Can be toggled on/off globally via `AppConfig`.

## Folder Structure

```text
lib/features/gamification/
├── data/          # Repository for local persistence
├── models/        # Freezed models for UserStats
├── providers/     # Riverpod providers for state management
└── widgets/       # UI components (Stats Header, Celebratory Overlays)
```

## How to Enable

In `lib/core/config/app_config.dart`, set:

```dart
static const bool enableGamification = true;
```

## Usage

### Updating Stats

To award XP or increment streak from any widget:

```dart
final notifier = ref.read(gamificationNotifierProvider.notifier);
await notifier.addXp(10);
await notifier.incrementStreak();
```

### UI Components

- **GamificationHeader:** Place this in your `AppBar` to show Streaks, Hearts, and XP.
- **CelebratoryOverlay:** Show a celebratory popup when a goal is reached:
  ```dart
  CelebratoryOverlay.show(context, xpGained: 10, newStreak: 5);
  ```
