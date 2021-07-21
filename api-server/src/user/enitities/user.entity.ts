import { Core } from 'src/core/core.entity';
import { Column, Entity } from 'typeorm';
import { Role } from './role.enum';

@Entity()
export class User extends Core {
  @Column({ length: 45, nullable: false })
  private email: string;

  @Column({ length: 30, nullable: false })
  private password: string;

  @Column({ length: 15, nullable: false })
  private nickname: string;

  @Column({
    type: 'enum',
    enum: Role,
    default: [Role.GUEST],
    nullable: false
  })
  private role: Role;

  @Column('boolean', { nullable: false, default: false })
  private isDelete: boolean;

  get getEmail(): string {
    return this.email;
  }

  get getPassword(): string {
    return this.password;
  }

  get getNickName(): string {
    return this.nickname;
  }
}
