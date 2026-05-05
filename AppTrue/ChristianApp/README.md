# SkelPhone

SkelPhone is a premium, modular Flutter template designed for content-driven vertical applications (Audio, Courses, Meditations, Podcasts, or Subscription-based niches). It provides a robust, generic skeleton that can be instantly rebranded and reconfigured for any niche.

## Features

- **AppConfig & BrandConfig:** Total separation between logic (feature toggles) and branding (colors, fonts).
- **Gamification:** Reusable Duolingo-style logic (Streaks, XP, Hearts) with local persistence.
- **Learning Path:** Procedural UI with S-curve connectors and floating animations.
- **Analytics & Notifications:** Swappable analytics wrapper and local habit-builder notifications.
- **Dynamic Onboarding:** Data-driven funnel system for higher conversions.
- **Offline Downloads:** State management skeleton for premium offline access.
- **AppCopy & AppAssets:** Centralized dictionaries for all UI text and image URLs.
- **Modular UI:** Apple-style "Bento" layout, blurred app bars, standard bottom navigation, and generic premium lists.
- **Pre-built Standard Screens:** Includes Home, Profile, Settings, Player, Login, and Onboarding.
- **Backend Ready:** Pre-configured with Supabase and a robust `ApiClient`.
- **Monetization:** Integrated Stripe-ready routing and Paywall screens.

---

## 🛠 How to Create a New App from SkelPhone

Creating a new app takes just a few steps. Follow this checklist:

### 1. Rebrand in `BrandConfig`
Open `lib/brand_config.dart`. This is the ONLY file you need to touch to change the look and feel.
- Change `appName`, `tagline`, and `channelSlug`.
- Update `primaryColor`, `secondaryColor`, and other palette properties.

### 2. Toggle Features in `AppConfig`
Open `lib/core/config/app_config.dart` and disable what you don't need.
- Don't need audio? Set `enableAudioPlayer = false;`
- Don't need auth? Set `enableAuth = false;`

### 3. Update Copy and Assets
- Open `lib/core/config/app_copy.dart` and translate or adjust the tone of voice (e.g., from "Sanctuary" to "Fitness Hub").
- Open `lib/core/config/app_assets.dart` and swap the default remote images or replace them with local `assets/images/` paths.

### 4. Environment Setup
Configure your backend by running the app with Dart defines:
```bash
flutter run --dart-define=SUPABASE_URL=your_url --dart-define=SUPABASE_ANON_KEY=your_key
```

### 5. Final Setup
- [ ] Replace Stripe price IDs in `AppConfig`.
- [ ] Generate new app icons (`flutter_launcher_icons`).
- [ ] Update the bundle ID using `rename` package or your preferred method.

---

## Project Structure

- `core/config/`: AppConfig, AppCopy, AppAssets. The central nervous system.
- `core/routing/`: GoRouter setup, ShellRoute for bottom nav.
- `core/theme/`: Design System (Spacing, shadows, generic UI tokens).
- `features/`: Modular business logic (Auth, Content, Payments, Profile, Settings).
- `shared/widgets/`: Reusable high-level widgets (BentoCards, MiniPlayer, BlurredAppBar).
- `brand_config.dart`: Core visual identity.
