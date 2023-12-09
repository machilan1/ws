import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { ActorService } from './actor.service';
import { ActorController } from './actor.controller';

@Module({
  imports: [],
  controllers: [ActorController],
  providers: [ActorService],
})
export class ActorModule {}
