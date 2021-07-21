import { Core } from 'src/core/core.entity';
import { User } from 'src/user/enitities/user.entity';
import { Entity, JoinColumn, ManyToOne } from 'typeorm';
import { Study } from './study.entity';

@Entity({ name: 'participant_users' })
export class ParticipantUser extends Core {
  @ManyToOne(() => Study, { createForeignKeyConstraints: false })
  @JoinColumn({ name: 'study_id' })
  private study: Study;

  @ManyToOne(() => User, { createForeignKeyConstraints: false })
  @JoinColumn({ name: 'user_id' })
  private user: User;
}
