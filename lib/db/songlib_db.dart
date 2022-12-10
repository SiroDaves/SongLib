import 'package:drift/drift.dart';

import '../models/tables/books_table.dart';
import '../models/tables/drafts_table.dart';
import '../models/tables/histories_table.dart';
import '../models/tables/listeds_table.dart';
import '../models/tables/searches_table.dart';
import '../models/tables/songs_table.dart';

part 'songlib_db.g.dart';

@DriftDatabase(tables: [
  BooksTable,
  DraftsTable,
  HistoriesTable,
  ListedsTable,
  SearchesTable,
  SongsTable,
])
class SongLibDb extends _$SongLibDb {
  SongLibDb(QueryExecutor db) : super(db);

  SongLibDb.connect(DatabaseConnection connection)
      : super.connect(connection);

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
