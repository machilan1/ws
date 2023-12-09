import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { createDbClient } from './libs/drizzle/drizzle.prvider';
import { actor } from './libs/drizzle/schema';
import { ConfigService } from '@nestjs/config';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const configService = app.get(ConfigService);
  const port = configService.get('API_PORT');
  await app.listen(port);
  console.log('Listening at port: ', port);

  // const asd = await db.select().from(actor);
  // console.log(asd);
}
bootstrap();
