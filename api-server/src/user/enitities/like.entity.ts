import { Core } from 'src/core/core.entity';
import { Study } from 'src/study/entities/study.entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { User } from './user.entity';

@Entity({ name: 'like_history' })
export class Like extends Core {
  @ManyToOne(() => Study, { createForeignKeyConstraints: false })
  @JoinColumn({ name: 'study_id' })
  private study: Study;

  @ManyToOne(() => User, { createForeignKeyConstraints: false })
  @JoinColumn({ name: 'user_id' })
  private user: User;
}
