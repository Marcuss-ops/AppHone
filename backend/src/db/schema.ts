import { pgTable, uuid, text, boolean, integer, decimal, timestamp } from 'drizzle-orm/pg-core'

export const channels = pgTable('channels', {
  id:               uuid('id').primaryKey().defaultRandom(),
  slug:             text('slug').unique().notNull(),
  name:             text('name').notNull(),
  description:      text('description'),
  tagline:          text('tagline'),
  logoUrl:          text('logo_url'),
  coverUrl:         text('cover_url'),
  primaryColor:     text('primary_color').default('#1a1a2e'),
  secondaryColor:   text('secondary_color').default('#e8c87a'),
  youtubeChannelId: text('youtube_channel_id'),
  isActive:         boolean('is_active').default(true),
  createdAt:        timestamp('created_at').defaultNow(),
})

export const categories = pgTable('categories', {
  id:          uuid('id').primaryKey().defaultRandom(),
  channelId:   uuid('channel_id').notNull().references(() => channels.id),
  name:        text('name').notNull(),
  slug:        text('slug').notNull(),
  description: text('description'),
  iconUrl:     text('icon_url'),
  coverUrl:    text('cover_url'),
  sortOrder:   integer('sort_order').default(0),
})

export const content = pgTable('content', {
  id:              uuid('id').primaryKey().defaultRandom(),
  channelId:       uuid('channel_id').notNull().references(() => channels.id),
  categoryId:      uuid('category_id').references(() => categories.id),
  title:           text('title').notNull(),
  description:     text('description'),
  longDescription: text('long_description'),
  thumbnailUrl:    text('thumbnail_url'),
  youtubeVideoId:  text('youtube_video_id'),
  audioUrl:        text('audio_url'),
  videoUrl:        text('video_url'),
  durationSeconds: integer('duration_seconds'),
  isPremium:       boolean('is_premium').default(false),
  isPublished:     boolean('is_published').default(true),
  isFeatured:      boolean('is_featured').default(false),
  tags:            text('tags').array().default([]),
  sortOrder:       integer('sort_order').default(0),
  viewCount:       integer('view_count').default(0),
  createdAt:       timestamp('created_at').defaultNow(),
  updatedAt:       timestamp('updated_at').defaultNow(),
})

export const courses = pgTable('courses', {
  id:               uuid('id').primaryKey().defaultRandom(),
  channelId:        uuid('channel_id').notNull().references(() => channels.id),
  categoryId:       uuid('category_id').references(() => categories.id),
  title:            text('title').notNull(),
  description:      text('description'),
  thumbnailUrl:     text('thumbnail_url'),
  instructorName:   text('instructor_name'),
  instructorAvatar: text('instructor_avatar'),
  isPremium:        boolean('is_premium').default(true),
  isPublished:      boolean('is_published').default(true),
  isFeatured:       boolean('is_featured').default(false),
  priceEur:         decimal('price_eur', { precision: 10, scale: 2 }),
  stripePriceId:    text('stripe_price_id'),
  sortOrder:        integer('sort_order').default(0),
  createdAt:        timestamp('created_at').defaultNow(),
})

export const courseLessons = pgTable('course_lessons', {
  id:            uuid('id').primaryKey().defaultRandom(),
  courseId:      uuid('course_id').notNull().references(() => courses.id),
  contentId:     uuid('content_id').notNull().references(() => content.id),
  lessonNumber:  integer('lesson_number').notNull(),
  titleOverride: text('title_override'),
})

export const userProfiles = pgTable('user_profiles', {
  id:               uuid('id').primaryKey(),
  displayName:      text('display_name'),
  avatarUrl:        text('avatar_url'),
  stripeCustomerId: text('stripe_customer_id').unique(),
  onboardingDone:   boolean('onboarding_done').default(false),
  createdAt:        timestamp('created_at').defaultNow(),
})

export const subscriptionPlans = pgTable('subscription_plans', {
  id:            uuid('id').primaryKey().defaultRandom(),
  channelId:     uuid('channel_id').references(() => channels.id),
  name:          text('name').notNull(),
  slug:          text('slug').notNull(),
  priceEur:      decimal('price_eur', { precision: 10, scale: 2 }).notNull(),
  interval:      text('interval'),
  stripePriceId: text('stripe_price_id').unique(),
  features:      text('features').array().default([]),
  isPopular:     boolean('is_popular').default(false),
  isActive:      boolean('is_active').default(true),
})

export const subscriptions = pgTable('subscriptions', {
  id:                    uuid('id').primaryKey().defaultRandom(),
  userId:                uuid('user_id').notNull().references(() => userProfiles.id),
  planId:                uuid('plan_id').notNull(),
  channelId:             uuid('channel_id').references(() => channels.id),
  stripeSubscriptionId:  text('stripe_subscription_id').unique(),
  stripePaymentIntentId: text('stripe_payment_intent_id'),
  status:                text('status').notNull().default('active'),
  trialEndsAt:           timestamp('trial_ends_at'),
  currentPeriodStart:    timestamp('current_period_start'),
  currentPeriodEnd:      timestamp('current_period_end'),
  cancelledAt:           timestamp('cancelled_at'),
  createdAt:             timestamp('created_at').defaultNow(),
})

export const userProgress = pgTable('user_progress', {
  id:              uuid('id').primaryKey().defaultRandom(),
  userId:          uuid('user_id').notNull().references(() => userProfiles.id),
  contentId:       uuid('content_id').notNull().references(() => content.id),
  progressSeconds: integer('progress_seconds').default(0),
  isCompleted:     boolean('is_completed').default(false),
  completedAt:     timestamp('completed_at'),
  lastPlayedAt:    timestamp('last_played_at').defaultNow(),
})
