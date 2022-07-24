import 'package:drift/drift.dart';

import '../exports.dart';

part 'my_database.g.dart';

@DriftDatabase(tables: [
  DbBookTable,
  DbSongTable,
])
class MyDatabase extends _$MyDatabase {
  MyDatabase(QueryExecutor db) : super(db);

  MyDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  Future<void> deleteAllData() async {
    return transaction(() async {
      for (final table in allTables) {
        await delete<Table, dynamic>(table).go();
      }
    });
  }
}
