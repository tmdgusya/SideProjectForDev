import { Core } from 'src/core/core.entity';
import { Study } from 'src/study/entities/study.entity';
import { User } from 'src/user/enitities/user.entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';

@Entity()
export class Comment extends Core {
  @Column('longtext', { nullable: true })
  private content: string;

  @ManyToOne(() => User, { createForeignKeyConstraints: false })
  @JoinColumn({ name: 'user_id' })
  private user: User;

  @ManyToOne(() => Study, { createForeignKeyConstraints: false })
  @JoinColumn({ name: 'study_id' })
  private study: Study;
}
