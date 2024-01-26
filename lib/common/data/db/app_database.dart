import 'package:drift/drift.dart';

import 'tables/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TodoEntries,
    Categories,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor db) : super(db);

  AppDatabase.connect(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 3;

}
