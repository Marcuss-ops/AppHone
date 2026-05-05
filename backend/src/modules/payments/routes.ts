import { FastifyInstance } from 'fastify'
import Stripe from 'stripe'
import { db } from '../../db/index.js'
import { subscriptions, subscriptionPlans, userProfiles, channels } from '../../db/schema.js'
import { eq } from 'drizzle-orm'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

export async function paymentRoutes(fastify: FastifyInstance) {

  fastify.post<{ Body: { planId: string, channelSlug: string } }>(
    '/payments/checkout',
    { preHandler: [fastify.authenticate] },
    async (request, reply) => {
      const { planId, channelSlug } = request.body
      const user = (request as any).user

      const [plan] = await db.select().from(subscriptionPlans).where(eq(subscriptionPlans.id, planId))
      if (!plan?.stripePriceId) return reply.status(404).send({ error: 'Plan not found' })

      const [profile] = await db.select().from(userProfiles).where(eq(userProfiles.id, user.id))
      let customerId = profile?.stripeCustomerId

      if (!customerId) {
        const customer = await stripe.customers.create({
          email: user.email,
          metadata: { userId: user.id }
        })
        customerId = customer.id
        await db.update(userProfiles)
          .set({ stripeCustomerId: customerId })
          .where(eq(userProfiles.id, user.id))
      }

      const isLifetime = plan.interval === null
      const session = await stripe.checkout.sessions.create({
        customer: customerId,
        mode: isLifetime ? 'payment' : 'subscription',
        line_items: [{ price: plan.stripePriceId, quantity: 1 }],
        success_url: `${process.env.FRONTEND_URL}/success?session_id={CHECKOUT_SESSION_ID}`,
        cancel_url: `${process.env.FRONTEND_URL}/pricing`,
        metadata: { userId: user.id, planId: plan.id, channelSlug },
        ...(plan.interval === 'month' && {
          subscription_data: { trial_period_days: 7 }
        }),
      })

      return reply.send({ url: session.url })
    }
  )

  fastify.post(
    '/payments/webhook',
    async (request, reply) => {
      const sig = request.headers['stripe-signature'] as string
      let event: Stripe.Event

      try {
        event = stripe.webhooks.constructEvent(
          (request as any).rawBody,
          sig,
          process.env.STRIPE_WEBHOOK_SECRET!
        )
      } catch {
        return reply.status(400).send({ error: 'Webhook signature failed' })
      }

      switch (event.type) {
        case 'checkout.session.completed': {
          const session = event.data.object as Stripe.CheckoutSession
          const { userId, planId, channelSlug } = session.metadata!
          const [channel] = await db.select().from(channels).where(eq(channels.slug, channelSlug))

          if (session.mode === 'payment') {
            await db.insert(subscriptions).values({
              userId, planId,
              channelId: channel?.id ?? null,
              stripePaymentIntentId: session.payment_intent as string,
              status: 'lifetime',
            })
          }
          break
        }

        case 'customer.subscription.created':
        case 'customer.subscription.updated': {
          const sub = event.data.object as Stripe.Subscription
          const customer = await stripe.customers.retrieve(sub.customer as string) as Stripe.Customer
          const userId = customer.metadata.userId

          await db.insert(subscriptions).values({
            userId,
            planId: sub.metadata.planId ?? '',
            stripeSubscriptionId: sub.id,
            status: sub.status,
            currentPeriodStart: new Date(sub.current_period_start * 1000),
            currentPeriodEnd: new Date(sub.current_period_end * 1000),
            trialEndsAt: sub.trial_end ? new Date(sub.trial_end * 1000) : null,
          }).onConflictDoUpdate({
            target: subscriptions.stripeSubscriptionId,
            set: {
              status: sub.status,
              currentPeriodEnd: new Date(sub.current_period_end * 1000),
            }
          })
          break
        }

        case 'customer.subscription.deleted': {
          const sub = event.data.object as Stripe.Subscription
          await db.update(subscriptions)
            .set({ status: 'cancelled', cancelledAt: new Date() })
            .where(eq(subscriptions.stripeSubscriptionId, sub.id))
          break
        }
      }

      return reply.send({ received: true })
    }
  )

  fastify.get(
    '/payments/portal',
    { preHandler: [fastify.authenticate] },
    async (request, reply) => {
      const userId = (request as any).user.id
      const [profile] = await db.select().from(userProfiles).where(eq(userProfiles.id, userId))
      if (!profile?.stripeCustomerId) return reply.status(404).send({ error: 'No subscription found' })

      const session = await stripe.billingPortal.sessions.create({
        customer: profile.stripeCustomerId,
        return_url: `${process.env.FRONTEND_URL}/profile`,
      })

      return reply.send({ url: session.url })
    }
  )

  fastify.get(
    '/payments/subscription/me',
    { preHandler: [fastify.authenticate] },
    async (request, reply) => {
      const userId = (request as any).user.id
      const [sub] = await db.select().from(subscriptions)
        .where(eq(subscriptions.userId, userId))
        .orderBy(subscriptions.createdAt)
        .limit(1)

      return reply.send(sub ?? null)
    }
  )
}
