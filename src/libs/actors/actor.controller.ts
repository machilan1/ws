import { Body, Controller, Get, Param, Patch } from '@nestjs/common';
import { ActorService } from './actor.service';

@Controller('actors')
export class ActorController {
  constructor(private actorService: ActorService) {}

  @Get()
  findall() {
    return this.actorService.findAll();
  }

  @Get(':actorId')
  findOneById(@Param('actorId') actorId: string) {
    return this.actorService.findOneById(parseInt(actorId));
  }

  @Patch(':actorId')
  updateOne(@Param('actorId') actorId: string,@Body() ) {
    return this.actorService.update(parseInt(actorId));
  }
}
