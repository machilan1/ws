import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { createDbClient } from './libs/drizzle/drizzleService';
import { actor } from './libs/drizzle/schema';
import { ConfigService } from '@nestjs/config';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const configService = app.get(ConfigService);
  const connStr = configService.get('DB_URL');
  const db = createDbClient(connStr);

  const port = configService.get('API_PORT');
  await app.listen(port);

  console.log(process.env.DB_URL ?? 123);

  const asd = await db.select().from(actor);
  console.log(asd);
}
bootstrap();
