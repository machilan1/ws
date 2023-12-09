import { drizzle } from 'drizzle-orm/postgres-js';
import { migrate } from 'drizzle-orm/postgres-js/migrator';
import postgres from 'postgres';

import * as dotenv from 'dotenv';

dotenv.config();

async function main() {
  const connectionString = 'postgres://postgres:123456@localhost:5432/db';
  const sql = postgres(connectionString, { max: 1 });
  const db = drizzle(sql);
  await migrate(db, { migrationsFolder: './src/libs/drizzle/introspect' });
}

main();
