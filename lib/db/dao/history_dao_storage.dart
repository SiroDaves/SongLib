import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../models/base/history.dart';
import '../../models/exts/historyext.dart';
import '../../models/tables/histories_table.dart';
import '../../utils/constants/utilities.dart';
import '../songlib_db.dart';

part 'history_dao_storage.g.dart';

@lazySingleton
abstract class HistoryDaoStorage {
  @factoryMethod
  factory HistoryDaoStorage(SongLibDb db) = _HistoryDaoStorage;

  Future<List<History>> getHistories();
  Future<List<HistoryExt>> getAllHistories();
  Future<void> createHistory(History history);
  Future<void> deleteHistory(History history);
}

@DriftAccessor(tables: [
  HistoriesTable,
])
class _HistoryDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_HistoryDaoStorageMixin
    implements HistoryDaoStorage {
  _HistoryDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<History>> getHistories() async {
    final List<Histories> results = await select(db.historiesTable).get();
    final List<History> histories = [];
    for (final result in results) {
      histories.add(
        History(
          id: const IntType().mapFromDatabaseResponse(result.id)!,
          song: const IntType().mapFromDatabaseResponse(result.song)!,
          objectId:
              const StringType().mapFromDatabaseResponse(result.objectId)!,
          createdAt:
              const StringType().mapFromDatabaseResponse(result.createdAt)!,
        ),
      );
    }
    return histories;
  }

  @override
  Future<List<HistoryExt>> getAllHistories() async {
    final Stream<List<HistoryExt>> streams = customSelect(
      'SELECT ${db.historiesTable.actualTableName}.${db.historiesTable.id.name}, ${db.historiesTable.actualTableName}.${db.historiesTable.createdAt.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.book.name}, ${db.songsTable.actualTableName}.${db.songsTable.songNo.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.title.name}, ${db.songsTable.actualTableName}.${db.songsTable.alias.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.content.name}, ${db.songsTable.actualTableName}.${db.songsTable.key.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.author.name}, ${db.songsTable.actualTableName}.${db.songsTable.views.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.likes.name}, ${db.songsTable.actualTableName}.${db.songsTable.liked.name}, '
      '${db.songsTable.actualTableName}.${db.songsTable.id.name} AS songId, ${db.booksTable.actualTableName}.${db.booksTable.title.name} AS songbook '
      'FROM ${db.historiesTable.actualTableName} AS histories '
      'LEFT JOIN ${db.songsTable.actualTableName} AS songs '
      'ON ${db.historiesTable.actualTableName}.${db.historiesTable.song.name}=${db.songsTable.actualTableName}.${db.songsTable.id.name} '
      'LEFT JOIN ${db.booksTable.actualTableName} AS books '
      'ON ${db.songsTable.actualTableName}.${db.songsTable.book.name}=${db.booksTable.actualTableName}.${db.booksTable.bookNo.name} '
      'ORDER BY ${db.songsTable.id.name} DESC;',
      readsFrom: {db.songsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => HistoryExt.fromData(row.data)).toList();
      },
    );
    return await streams.first;
  }

  @override
  Future<void> createHistory(History history) => into(db.historiesTable).insert(
        HistoriesTableCompanion.insert(
          song: Value(history.song!),
          createdAt: Value(dateNow()),
        ),
      );

  @override
  Future<void> deleteHistory(History history) =>
      (delete(db.historiesTable)..where((row) => row.id.equals(history.id)))
          .go();
}
