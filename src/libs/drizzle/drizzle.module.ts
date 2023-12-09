import { Global, Module } from '@nestjs/common';
import { CONN } from './drizzle.token';
import { ConfigService } from '@nestjs/config';
import { createDbClient } from './drizzle.prvider';

@Global()
@Module({
  providers: [
    {
      provide: CONN,
      useFactory: (configService: ConfigService) => {
        const dbPort = configService.get('DB_PORT');
        const dbName = configService.get('DB_NAME');
        const dbUser = configService.get('DB_USER');
        const dbPass = configService.get('DB_PSW');
        const dbHost = configService.get('DB_HOST');
        const connStr = `postgres://${dbUser}:${dbPass}@${dbHost}:${dbPort}/${dbName}`;
        const db = createDbClient(connStr);

        return db;
      },
      inject: [ConfigService],
    },
  ],
  exports: [CONN],
})
export class DrizzleModule {}
