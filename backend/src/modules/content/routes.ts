import { FastifyInstance } from 'fastify'
import { createClient } from '@supabase/supabase-js'
import { db } from '../../db/index.js'
import { content, categories, courses, courseLessons, channels, userProgress } from '../../db/schema.js'
import { eq, and, desc, asc } from 'drizzle-orm'
import { checkPremium } from '../../plugins/auth.js'

const supabase = createClient(process.env.SUPABASE_URL!, process.env.SUPABASE_SERVICE_KEY!)

async function getUserIdFromToken(token: string): Promise<string | null> {
  const { data: { user } } = await supabase.auth.getUser(token)
  return user?.id ?? null
}

export async function contentRoutes(fastify: FastifyInstance) {

  fastify.get<{ Params: { channelSlug: string }, Querystring: { category?: string, featured?: string } }>(
    '/content/:channelSlug',
    async (request, reply) => {
      const { channelSlug } = request.params
      const { category, featured } = request.query

      const [channel] = await db.select().from(channels).where(eq(channels.slug, channelSlug))
      if (!channel) return reply.status(404).send({ error: 'Channel not found' })

      let userHasPremium = false
      const token = request.headers.authorization?.replace('Bearer ', '')
      if (token) {
        try {
          const userId = await getUserIdFromToken(token)
          if (userId) userHasPremium = await checkPremium(userId)
        } catch {}
      }

      const items = await db.select().from(content).where(
        and(
          eq(content.channelId, channel.id),
          eq(content.isPublished, true),
          category ? eq(content.categoryId, category) : undefined,
          featured === 'true' ? eq(content.isFeatured, true) : undefined,
        )
      ).orderBy(desc(content.isFeatured), asc(content.sortOrder))

      return reply.send(items.map(item => ({
        ...item,
        audioUrl:  item.isPremium && !userHasPremium ? null : item.audioUrl,
        videoUrl:  item.isPremium && !userHasPremium ? null : item.videoUrl,
        locked:    item.isPremium && !userHasPremium,
      })))
    }
  )

  fastify.get<{ Params: { channelSlug: string } }>(
    '/content/:channelSlug/categories',
    async (request, reply) => {
      const { channelSlug } = request.params
      const [channel] = await db.select().from(channels).where(eq(channels.slug, channelSlug))
      if (!channel) return reply.status(404).send({ error: 'Channel not found' })

      const cats = await db.select().from(categories)
        .where(eq(categories.channelId, channel.id))
        .orderBy(asc(categories.sortOrder))

      return reply.send(cats)
    }
  )

  fastify.get<{ Params: { channelSlug: string } }>(
    '/content/:channelSlug/courses',
    async (request, reply) => {
      const { channelSlug } = request.params
      const [channel] = await db.select().from(channels).where(eq(channels.slug, channelSlug))
      if (!channel) return reply.status(404).send({ error: 'Channel not found' })

      const courseList = await db.select().from(courses)
        .where(and(eq(courses.channelId, channel.id), eq(courses.isPublished, true)))
        .orderBy(desc(courses.isFeatured), asc(courses.sortOrder))

      return reply.send(courseList)
    }
  )

  fastify.post<{ Body: { contentId: string, progressSeconds: number, completed?: boolean } }>(
    '/content/progress',
    { preHandler: [fastify.authenticate] },
    async (request, reply) => {
      const { contentId, progressSeconds, completed } = request.body
      const userId = (request as any).user.id

      await db.insert(userProgress).values({
        userId,
        contentId,
        progressSeconds,
        isCompleted: completed ?? false,
        completedAt: completed ? new Date() : null,
        lastPlayedAt: new Date(),
      }).onConflictDoUpdate({
        target: [userProgress.userId, userProgress.contentId],
        set: { progressSeconds, isCompleted: completed ?? false, lastPlayedAt: new Date() }
      })

      return reply.send({ ok: true })
    }
  )

  fastify.get(
    '/content/progress/me',
    { preHandler: [fastify.authenticate] },
    async (request, reply) => {
      const userId = (request as any).user.id
      const progress = await db.select().from(userProgress)
        .where(eq(userProgress.userId, userId))
        .orderBy(desc(userProgress.lastPlayedAt))
      return reply.send(progress)
    }
  )
}
