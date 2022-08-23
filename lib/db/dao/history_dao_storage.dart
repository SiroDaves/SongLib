import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:songlib/util/constants/utilities.dart';

import '../../model/base/history.dart';
import '../../model/tables/db_history_table.dart';
import '../songlib_db.dart';

part 'history_dao_storage.g.dart';

@lazySingleton
abstract class HistoryDaoStorage {
  @factoryMethod
  factory HistoryDaoStorage(SongLibDb db) = _HistoryDaoStorage;

  Stream<List<DbHistory>> getAllHistoriesStream();

  Future<List<History>> getAllHistories();

  Future<void> createHistory(History history);
}

@DriftAccessor(tables: [
  DbHistoryTable,
])
class _HistoryDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_HistoryDaoStorageMixin
    implements HistoryDaoStorage {
  _HistoryDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<History>> getAllHistories() async {
    final List<DbHistory> dbHistoryies = await select(db.dbHistoryTable).get();
    final List<History> historyies = [];

    for (int i = 0; i < dbHistoryies.length; i++) {
      historyies.add(
        History(
          id: dbHistoryies[i].id,
          objectId: dbHistoryies[i].objectId,
          song: dbHistoryies[i].song,
          createdAt: dbHistoryies[i].createdAt,
        ),
      );
    }
    return historyies;
  }

  @override
  Stream<List<DbHistory>> getAllHistoriesStream() =>
      select(db.dbHistoryTable).watch();

  @override
  Future<void> createHistory(History history) => into(db.dbHistoryTable).insert(
        DbHistoryTableCompanion.insert(
          song: Value(history.song!),
          createdAt: Value(dateNow()),
        ),
      );
}
