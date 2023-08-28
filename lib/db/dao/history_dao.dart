import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/history.dart';
import '../../model/base/historyext.dart';
import '../../model/tables/historys_table.dart';
import '../../utils/utilities.dart';
import '../app_database.dart';

part 'history_dao.g.dart';

@lazySingleton
abstract class HistoryDao {
  @factoryMethod
  factory HistoryDao(AppDatabase db) = _HistoryDao;

  Future<List<History>> getHistories();
  Future<List<HistoryExt>> getAllHistories();
  Future<void> createHistory(History history);
  Future<void> deleteHistory(History history);
}

@DriftAccessor(tables: [
  HistorysTable,
])
class _HistoryDao extends DatabaseAccessor<AppDatabase>
    with _$_HistoryDaoMixin
    implements HistoryDao {
  _HistoryDao(AppDatabase db) : super(db);

  @override
  Future<List<History>> getHistories() async {
    final List<Historys> results = await select(db.historysTable).get();
    return results
        .map(
          (result) => History(
            id: const IntType().mapFromDatabaseResponse(result.id)!,
            song: const IntType().mapFromDatabaseResponse(result.song)!,
            historyId:
                const IntType().mapFromDatabaseResponse(result.historyId)!,
            created:
                const StringType().mapFromDatabaseResponse(result.created)!,
          ),
        )
        .toList();
  }

  @override
  Future<List<HistoryExt>> getAllHistories() async {
    return await customSelect(
      'SELECT histories.${db.historysTable.id.name}, histories.${db.historysTable.created.name}, '
      'songs.${db.songsTable.book.name}, songs.${db.songsTable.songNo.name}, songs.${db.songsTable.title.name}, '
      'songs.${db.songsTable.alias.name}, songs.${db.songsTable.content.name}, songs.${db.songsTable.key.name}, '
      'songs.${db.songsTable.author.name}, songs.${db.songsTable.views.name}, songs.${db.songsTable.likes.name}, '
      'songs.${db.songsTable.liked.name}, songs.${db.songsTable.id.name} AS songId, '
      'books.${db.booksTable.title.name} AS songbook '
      'FROM ${db.historysTable.actualTableName} AS histories '
      'LEFT JOIN ${db.songsTable.actualTableName} AS songs '
      'ON histories.${db.historysTable.song.name}=songs.${db.songsTable.id.name} '
      'LEFT JOIN ${db.booksTable.actualTableName} AS books '
      'ON songs.${db.songsTable.book.name}=books.${db.booksTable.bookNo.name} '
      'ORDER BY ${db.songsTable.id.name} DESC;',
      readsFrom: {db.songsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => HistoryExt.fromData(row.data)).toList();
      },
    ).first;
  }

  @override
  Future<void> createHistory(History history) => into(db.historysTable).insert(
        HistorysTableCompanion.insert(
          song: Value(history.song!),
          created: Value(dateNow()),
        ),
      );

  @override
  Future<void> deleteHistory(History history) =>
      (delete(db.historysTable)..where((row) => row.id.equals(history.id)))
          .go();
}
