import type { Config } from 'drizzle-kit';
export default {
  schema: './src/libs/drizzle/schema.ts',
  out: './src/libs/drizzle/introspect',
  driver: 'pg',
  dbCredentials: {
    connectionString: process.env.DB_URL,
  },
} satisfies Config;
