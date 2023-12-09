import { Inject, Injectable } from '@nestjs/common';
import { CONN } from './libs/drizzle/drizzle.token';
import { Database } from './libs/drizzle/drizzle.type';
import { actor } from './libs/drizzle/schema';

@Injectable()
export class AppService {
  constructor(
    @Inject(CONN)
    private conn: Database,
  ) {}

  hello() {
    return this.conn.select().from(actor).orderBy();
  }
}
