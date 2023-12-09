import { Inject, Injectable } from '@nestjs/common';
import { CONN } from '../drizzle/drizzle.token';
import { Database } from '../drizzle/drizzle.type';
import { connect } from 'http2';
import { actor } from '../drizzle/schema';
import { eq } from 'drizzle-orm';

@Injectable()
export class ActorService {
  constructor(@Inject(CONN) private conn: Database) {}

  findAll() {
    return this.conn.select().from(actor);
    // SELECT * FROM ACTORS;
  }

  findOneById(actorId: number) {
    return this.conn.select().from(actor).where(eq(actor.actorId, actorId));
  }

  update(actorId: number) {
    return this.conn
      .update(actor)
      .set({ firstName: 'Machi' })
      .where(eq(actor.actorId, actorId));
  }
}
