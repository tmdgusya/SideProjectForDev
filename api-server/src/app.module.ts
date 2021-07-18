import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

const defaultDBOptions: TypeOrmModule = {
  type: 'mysql',
  host: 'localhost',
  username: 'root',
  password: '1234',
  database: 'study',
  entities: [],
  synchronize: true,
};

@Module({
  imports: [
    TypeOrmModule.forRoot({
      ...defaultDBOptions,
      name: 'master',
      port: 3307,
    }),
    TypeOrmModule.forRoot({
      ...defaultDBOptions,
      name: 'test',
      port: 3307,
    }),
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
