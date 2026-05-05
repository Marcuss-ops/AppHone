import 'dotenv/config'
import Fastify from 'fastify'
import cors from '@fastify/cors'
import authPlugin from './plugins/auth.js'
import { contentRoutes } from './modules/content/routes.js'
import { paymentRoutes } from './modules/payments/routes.js'

const app = Fastify({ logger: true })

await app.register(cors, {
  origin: process.env.FRONTEND_URL ?? '*',
})

await app.register(authPlugin)
await app.register(contentRoutes, { prefix: '/api' })
await app.register(paymentRoutes, { prefix: '/api' })

app.get('/health', () => ({ status: 'ok' }))

app.listen({ port: Number(process.env.PORT) || 3000, host: '0.0.0.0' }, (err) => {
  if (err) process.exit(1)
})
