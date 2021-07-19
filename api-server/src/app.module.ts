import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { commonDBConfig } from '../setup/dbCommon';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      ...commonDBConfig,
      name: 'master-db',
      port: 3306,
    }),
    TypeOrmModule.forRoot({
      ...commonDBConfig,
      name: 'test-db',
      port: 3307,
    }),
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
