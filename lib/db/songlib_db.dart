import 'package:drift/drift.dart';

import '../model/tables/db_book_table.dart';
import '../model/tables/db_draft_table.dart';
import '../model/tables/db_history_table.dart';
import '../model/tables/db_listed_table.dart';
import '../model/tables/db_search_table.dart';
import '../model/tables/db_song_table.dart';

part 'songlib_db.g.dart';

@DriftDatabase(tables: [
  DbBookTable,
  DbDraftTable,
  DbHistoryTable,
  DbListedTable,
  DbSearchTable,
  DbSongTable,
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
