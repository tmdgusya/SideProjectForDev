import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { commonDBConfig } from '../setup/dbCommon';
import { UserModule } from './user/user.module';
import { CoreModule } from './core/core.module';
import { StudyModule } from './study/study.module';
import { FrameworkModule } from './framework/framework.module';
import { CommentModule } from './comment/comment.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      ...commonDBConfig,
      name: 'master-db',
      port: 3306
    }),
    TypeOrmModule.forRoot({
      ...commonDBConfig,
      name: 'test-db',
      port: 3307
    }),
    UserModule,
    CoreModule,
    StudyModule,
    FrameworkModule,
    CommentModule
  ],
  controllers: [],
  providers: []
})
export class AppModule {}
