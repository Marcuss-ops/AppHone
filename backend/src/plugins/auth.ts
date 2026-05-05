import fp from 'fastify-plugin'
import { FastifyPluginAsync, FastifyRequest, FastifyReply } from 'fastify'
import { createClient } from '@supabase/supabase-js'
import { db } from '../db/index.js'
import { subscriptions } from '../db/schema.js'
import { and, eq, or, isNull } from 'drizzle-orm'

const supabase = createClient(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_KEY!
)

declare module 'fastify' {
  interface FastifyInstance {
    authenticate: (req: FastifyRequest, reply: FastifyReply) => Promise<void>
  }
}

const authPlugin: FastifyPluginAsync = async (fastify) => {
  fastify.decorate('authenticate', async (request: FastifyRequest, reply: FastifyReply) => {
    const token = request.headers.authorization?.replace('Bearer ', '')
    if (!token) return reply.status(401).send({ error: 'Unauthorized' })

    const { data: { user }, error } = await supabase.auth.getUser(token)
    if (error || !user) return reply.status(401).send({ error: 'Invalid token' })

    ;(request as any).user = user
  })
}

export default fp(authPlugin)

export async function checkPremium(userId: string, channelSlug?: string): Promise<boolean> {
  const now = new Date()
  const [sub] = await db
    .select()
    .from(subscriptions)
    .where(
      and(
        eq(subscriptions.userId, userId),
        or(
          eq(subscriptions.status, 'active'),
          eq(subscriptions.status, 'trialing'),
          eq(subscriptions.status, 'lifetime')
        )
      )
    )
    .limit(1)

  return !!sub
}
