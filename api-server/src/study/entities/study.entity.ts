import { Core } from 'src/core/core.entity';
import { FrameWork } from 'src/framework/entities/framework.entity';
import { User } from 'src/user/enitities/user.entity';
import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm';
import { ParticipantUser } from './study.participant.entity';
import { StudyPeriodType, StudyPlaceType } from './study.type';

@Entity()
export class Study extends Core {
  @Column({ length: 45, nullable: false })
  title: string;

  @Column('longtext', { nullable: true })
  content: string;

  @ManyToOne(() => User, { createForeignKeyConstraints: false })
  @JoinColumn({ name: 'user_id' })
  host: User;

  @OneToMany(() => ParticipantUser, 'study')
  participants: ParticipantUser[];

  @OneToMany(() => FrameWork, 'study')
  frameworks: FrameWork[];

  @Column({ name: 'front' })
  numberOfFrontEnd: number;

  @Column({ name: 'back' })
  numberOfBackEnd: number;

  @Column({ name: 'desing' })
  numberOfDesign: number;

  @Column({ name: 'ml' })
  numberOfML: number;

  @Column('boolean', { nullable: false, default: true })
  isDelete: boolean;

  @Column({ type: 'enum', enum: StudyPeriodType, nullable: false })
  studyPeriodType: StudyPeriodType;

  @Column({ type: 'enum', enum: StudyPlaceType, nullable: false })
  studyPlaceType: StudyPlaceType;
}
