import { Core } from 'src/core/core.entity';
import { Study } from 'src/study/entities/study.entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { FrameWorkType } from './framework.type';

@Entity({ name: 'frameworks' })
export class FrameWork extends Core {
  @Column({ length: 45, nullable: false })
  name: string;

  @Column({ length: 100, nullable: true })
  imgUrl: string;

  @Column({ type: 'enum', enum: FrameWorkType, nullable: false })
  type: FrameWorkType;

  @ManyToOne(() => Study, { createForeignKeyConstraints: false })
  @JoinColumn({ name: 'study_id' })
  study: Study;
}
