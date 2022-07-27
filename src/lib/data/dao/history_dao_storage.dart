import 'package:drift/drift.dart';

import '../../exports.dart';

part 'history_dao_storage.g.dart';

abstract class HistoryDaoStorage {
  factory HistoryDaoStorage(MyDatabase db) = _HistoryDaoStorage;

  Stream<List<DbHistory>> getAllHistoriesStream();

  Future<List<History>> getAllHistories();

  Future<void> createHistory(History history);
}

@DriftAccessor(tables: [
  DbHistoryTable,
])
class _HistoryDaoStorage extends DatabaseAccessor<MyDatabase>
    with _$_HistoryDaoStorageMixin
    implements HistoryDaoStorage {
  _HistoryDaoStorage(MyDatabase db) : super(db);

  @override
  Future<List<History>> getAllHistories() async {
    List<DbHistory> dbHistorys = await select(db.dbHistoryTable).get();
    List<History> historys = [];

    for (int i = 0; i < dbHistorys.length; i++) {
      historys.add(
        History(
          id: dbHistorys[i].id,
          objectId: dbHistorys[i].objectId,
          song: dbHistorys[i].song,
          createdAt: dbHistorys[i].createdAt,
        ),
      );
    }
    return historys;
  }

  @override
  Stream<List<DbHistory>> getAllHistoriesStream() => select(db.dbHistoryTable).watch();

  @override
  Future<void> createHistory(History history) => into(db.dbHistoryTable).insert(
        DbHistoryTableCompanion.insert(
          objectId: history.objectId!,
          song: Value(history.song!),
          createdAt: Value(history.createdAt!),
        ),
      );

}
