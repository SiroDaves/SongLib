import 'package:drift/drift.dart';
import 'package:songlib/model/database/todo/db_todo_table.dart';

part 'myapp_database.g.dart';

@DriftDatabase(tables: [
  DbTodoTable,
])
class MyappDatabase extends _$MyappDatabase {
  MyappDatabase(QueryExecutor db) : super(db);

  MyappDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  Future<void> deleteAllData() {
    return transaction(() async {
      for (final table in allTables) {
        await delete<Table, dynamic>(table).go();
      }
    });
  }
}
