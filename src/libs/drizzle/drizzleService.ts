import { drizzle } from 'drizzle-orm/postgres-js';
import * as postgres from 'postgres';

// for query purposes

export function createDbClient(conn: string) {
  assertConnectionStringIsProvided(conn);
  const queryClient = postgres(
    conn ?? 'postgres://postgres:123456@localhost:5432/db',
  );
  return drizzle(queryClient, { logger: true });
}

function assertConnectionStringIsProvided(conn: string) {
  if (!conn) {
    throw new Error('Conn not provided');
  }
}
