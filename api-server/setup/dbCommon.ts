import { TypeOrmModule } from '@nestjs/typeorm';

export const commonDBConfig: TypeOrmModule = {
  type: 'mysql',
  host: 'localhost',
  username: 'root',
  password: '1234',
  database: 'study',
  entities: [],
  synchronize: true,
};
