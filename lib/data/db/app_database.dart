import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../common/utils/constants/app_constants.dart';
import '../../common/utils/logger.dart';
import '../models/book.dart';
import '../models/draft.dart';
import '../models/edit.dart';
import '../models/history.dart';
import '../models/historyext.dart';
import '../models/listed.dart';
import '../models/listedext.dart';
import '../models/search.dart';
import '../models/song.dart';
import '../models/songext.dart';
import 'dao/books_dao.dart';
import 'dao/drafts_dao.dart';
import 'dao/edits_dao.dart';
import 'dao/histories_dao.dart';
import 'dao/listeds_dao.dart';
import 'dao/searches_dao.dart';
import 'dao/songs_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [Book, Song, Draft, Edit, History, Search, Listed],
  views: [SongExt, HistoryExt, ListedExt],
)
abstract class AppDatabase extends FloorDatabase {
  BooksDao get booksDao;
  SongsDao get songsDao;
  EditsDao get editsDao;
  DraftsDao get draftsDao;
  ListedsDao get listedsDao;
  SearchesDao get searchesDao;
  HistoriesDao get historiesDao;
}

final addViewSongs = Migration(1, 2, (database) async {
  logger("Migrating songs view");
  await database.execute("""
DROP VIEW IF EXISTS `${AppConstants.songsTableViews}`;
CREATE VIEW IF NOT EXISTS `${AppConstants.songsTableViews}` AS
  ${AppConstants.songExtSql}
 """);
});
