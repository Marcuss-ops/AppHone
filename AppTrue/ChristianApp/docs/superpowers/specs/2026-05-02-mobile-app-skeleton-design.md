---
title: Mobile App Skeleton — Multi-Brand Platform
date: 2026-05-02
status: approved
---

# Mobile App Skeleton — Multi-Brand Platform

## Overview

A white-label Flutter mobile app skeleton for YouTube-based content brands. First brand: **Fede & Luce** (Christianity). The same codebase powers future brands (meditation, history, cooking, etc.) by changing a single config file.

## Architecture

### Repository Structure

```
platform/
├── apps/
│   └── fede_e_luce/        ← Flutter app (iOS + Android)
├── backend/                ← Fastify API (shared across all brands)
└── packages/
    └── app_core/           ← shared Flutter package (when 2+ brands exist)
```

### Stack

| Layer | Technology |
|---|---|
| Mobile | Flutter + Dart |
| State | Riverpod (riverpod_annotation) |
| Audio | just_audio + audio_service |
| Navigation | GoRouter |
| Backend | Fastify + Drizzle ORM |
| Database | PostgreSQL via Supabase |
| Auth | Supabase Auth (JWT) |
| Payments | Stripe Checkout + webhooks |
| Deploy (backend) | Railway |
| Deploy (mobile) | App Store + Google Play |

## Multi-Brand System

Each brand = one Flutter project importing `app_core`. Brand identity defined in `brand_config.dart`:

- `channelSlug` — matches `channels.slug` in DB
- Colors: `primaryColor`, `secondaryColor`, `backgroundColor`, `surfaceColor`
- `fontFamily` — Google Font
- Stripe price IDs (monthly, yearly, lifetime)
- App Store / Play Store IDs

To launch a new brand: copy project, change `brand_config.dart`, publish to stores.

## Flutter App Structure (Feature-first)

```
lib/
├── main.dart
├── brand_config.dart          ← only file changed per brand
├── core/
│   ├── theme/                 ← AppTheme generated from BrandConfig
│   ├── routing/               ← GoRouter
│   ├── network/               ← ApiClient (auth headers)
│   └── constants/
├── features/
│   ├── auth/                  ← login, onboarding
│   ├── content/               ← home, categories, player, courses
│   └── payments/              ← paywall, pricing, checkout
└── shared/
    └── widgets/               ← ContentCard, MiniPlayer, LockedOverlay
```

Each feature has: `data/` (repository + models), `providers/` (Riverpod), `screens/`.

## Data Models (Freezed)

- `ContentItem` — audio/video content, free or premium, with user progress
- `Category` — groups content within a brand
- `Course` — ordered sequence of ContentItems
- `CourseLesson` — junction between Course and ContentItem

## Audio Player

- `just_audio` + `audio_service` for background playback and lock screen controls
- `PlayerStateProvider` (Riverpod) — isPlaying, position, duration, isLoading
- `CurrentlyPlayingProvider` — which ContentItem is active
- Progress saved to backend every 30s and on pause

## Subscription / Paywall

- Three tiers: free, premium (monthly/yearly), lifetime
- `UserAccessProvider` checks active subscription from backend
- `hasPremiumProvider` — bool used by all locked content UI
- `audioUrl` / `videoUrl` returned as null by API for locked content
- Free content: YouTube video embedded; Premium content: hosted audio/video

## Backend API (Fastify)

Key endpoints consumed by Flutter:
- `GET /api/content/:channelSlug` — content list (locked field per user)
- `GET /api/content/:channelSlug/categories`
- `GET /api/content/:channelSlug/courses`
- `POST /api/content/progress` — save playback position
- `POST /api/payments/checkout` — create Stripe session
- `GET /api/payments/portal` — Stripe customer portal

## Implementation Order

1. Backend + DB schema (Supabase)
2. Flutter skeleton: brand_config, theme, routing, API client
3. Feature: Auth (Supabase login)
4. Feature: Content — home screen + categories + player
5. Feature: Payments — paywall + Stripe checkout
