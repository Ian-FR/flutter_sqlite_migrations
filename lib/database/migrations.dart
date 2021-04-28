import 'migration_service.dart';

initDB(MigrationService migration) {
  migration.createTable(
    name: 'APP_CONFIG',
    script: '''
    create table if not exists APP_CONFIG
      (
        created_at datetime default current_timestamp not null,
        updated_at datetime default current_timestamp not null,
        some_column  varchar(15)
      );
  ''',
  );

  migration.addColumn(
    name: 'other_column',
    table: 'APP_CONFIG',
    script: '''
      alter table APP_CONFIG
      add other_column varchar(40);
    ''',
  );

  migration.runCommands(commands: [
    '''
      select other_column
        from APP_CONFIG;
    ''',
    '''
      update APP_CONFIG
         set some_column = 'test';
    ''',
  ]);

  migration.initDB();
}
