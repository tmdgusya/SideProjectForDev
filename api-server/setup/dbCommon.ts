import { TypeOrmModule } from '@nestjs/typeorm';
import { FrameWork } from 'src/framework/entities/framework.entity';
import { Study } from 'src/study/entities/study.entity';
import { ParticipantUser } from 'src/study/entities/study.participant.entity';
import { Like } from 'src/user/enitities/like.entity';
import { User } from 'src/user/enitities/user.entity';
import { Comment } from 'src/comment/entities/comment.entity';

export const commonDBConfig: TypeOrmModule = {
  type: 'mysql',
  host: 'localhost',
  username: 'root',
  password: '1234',
  database: 'study',
  entities: [User, Study, FrameWork, Like, Comment, ParticipantUser],
  synchronize: true
};
