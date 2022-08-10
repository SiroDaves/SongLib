import 'package:drift/drift.dart';

import '../model/database/career_calendar_event_winners.dart';
import '../model/database/career_results.dart';
import '../model/database/db_book_table.dart';
import '../model/database/db_draft_table.dart';
import '../model/database/db_history_table.dart';
import '../model/database/db_listed_table.dart';
import '../model/database/db_search_table.dart';
import '../model/database/db_song_table.dart';
import '../model/database/tour_results.dart';

part 'songlib_database.g.dart';

@DriftDatabase(tables: [
  DbTourResultsTable,
  DbCareerCalendarEventWinnersTable,
  DbCareerResultsTable,
  DbBookTable,
  DbDraftTable,
  DbHistoryTable,
  DbListedTable,
  DbSearchTable,
  DbSongTable,
])
class SongLibDatabase extends _$SongLibDatabase {
  SongLibDatabase(QueryExecutor db) : super(db);

  SongLibDatabase.connect(DatabaseConnection connection)
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
