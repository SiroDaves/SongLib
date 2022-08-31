import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:songlib/util/constants/utilities.dart';

import '../../model/base/history.dart';
import '../../model/base/historyext.dart';
import '../../model/tables/db_history_table.dart';
import '../songlib_db.dart';

part 'history_dao_storage.g.dart';

@lazySingleton
abstract class HistoryDaoStorage {
  @factoryMethod
  factory HistoryDaoStorage(SongLibDb db) = _HistoryDaoStorage;

  Future<List<HistoryExt>> getAllHistories();

  Future<void> createHistory(History history);

  Future<void> deleteHistory(History history);
}

@DriftAccessor(tables: [
  DbHistoryTable,
])
class _HistoryDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_HistoryDaoStorageMixin
    implements HistoryDaoStorage {
  _HistoryDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<HistoryExt>> getAllHistories() async {
    final Stream<List<HistoryExt>> streams = customSelect(
      'SELECT histories.${db.dbHistoryTable.id.name}, histories.${db.dbHistoryTable.createdAt.name}, '
      'songs.${db.dbSongTable.book.name}, songs.${db.dbSongTable.songNo.name}, songs.${db.dbSongTable.title.name}, '
      'songs.${db.dbSongTable.alias.name}, songs.${db.dbSongTable.content.name}, songs.${db.dbSongTable.key.name}, '
      'songs.${db.dbSongTable.author.name}, songs.${db.dbSongTable.views.name}, songs.${db.dbSongTable.likes.name}, '
      'songs.${db.dbSongTable.liked.name}, songs.${db.dbSongTable.id.name} AS songId, '
      'books.${db.dbBookTable.title.name} AS songbook '
      'FROM ${db.dbHistoryTable.actualTableName} AS histories '
      'LEFT JOIN ${db.dbSongTable.actualTableName} AS songs '
      'ON histories.${db.dbHistoryTable.song.name}=songs.${db.dbSongTable.id.name} '
      'LEFT JOIN ${db.dbBookTable.actualTableName} AS books '
      'ON songs.${db.dbSongTable.book.name}=books.${db.dbBookTable.bookNo.name} '
      'ORDER BY ${db.dbSongTable.id.name} DESC;',
      readsFrom: {db.dbSongTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => HistoryExt.fromData(row.data)).toList();
      },
    );
    return await streams.first;
  }

  @override
  Future<void> createHistory(History history) => into(db.dbHistoryTable).insert(
        DbHistoryTableCompanion.insert(
          song: Value(history.song!),
          createdAt: Value(dateNow()),
        ),
      );

  @override
  Future<void> deleteHistory(History history) =>
      (delete(db.dbHistoryTable)..where((row) => row.id.equals(history.id))).go();
}
