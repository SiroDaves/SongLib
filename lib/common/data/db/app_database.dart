import 'package:drift/drift.dart';

import '../models/tables/books_table.dart';
import '../models/tables/drafts_table.dart';
import '../models/tables/edits_table.dart';
import '../models/tables/historys_table.dart';
import '../models/tables/listeds_table.dart';
import '../models/tables/searchs_table.dart';
import '../models/tables/songs_table.dart';
import 'dao/book_dao.dart';
import 'dao/draft_dao.dart';
import 'dao/edit_dao.dart';
import 'dao/history_dao.dart';
import 'dao/listed_dao.dart';
import 'dao/search_dao.dart';
import 'dao/song_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    BooksTable,
    DraftsTable,
    EditsTable,
    HistorysTable,
    ListedsTable,
    SearchsTable,
    SongsTable,
  ],
  daos: [BookDao, DraftDao, EditDao, HistoryDao, ListedDao, SearchDao, SongDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor db) : super(db);

  AppDatabase.connect(DatabaseConnection connection)
      : super.connect(connection);

  @override
  int get schemaVersion => 2;

}
