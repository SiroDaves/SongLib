import 'package:drift/drift.dart';

import '../../exports.dart';

part 'search_dao_storage.g.dart';

abstract class SearchDaoStorage {
  factory SearchDaoStorage(MyDatabase db) = _SearchDaoStorage;

  Stream<List<DbSearch>> getAllSearchsStream();

  Future<List<Search>> getAllSearchs();

  Future<void> createSearch(Search search);
}

@DriftAccessor(tables: [
  DbSearchTable,
])
class _SearchDaoStorage extends DatabaseAccessor<MyDatabase>
    with _$_SearchDaoStorageMixin
    implements SearchDaoStorage {
  _SearchDaoStorage(MyDatabase db) : super(db);

  @override
  Future<List<Search>> getAllSearchs() async {
    List<DbSearch> dbSearchs = await select(db.dbSearchTable).get();
    List<Search> searchs = [];

    for (int i = 0; i < dbSearchs.length; i++) {
      searchs.add(
        Search(
          id: dbSearchs[i].id,
          objectId: dbSearchs[i].objectId,
          title: dbSearchs[i].title,
          createdAt: dbSearchs[i].createdAt,
        ),
      );
    }
    return searchs;
  }

  @override
  Stream<List<DbSearch>> getAllSearchsStream() => select(db.dbSearchTable).watch();

  @override
  Future<void> createSearch(Search search) => into(db.dbSearchTable).insert(
        DbSearchTableCompanion.insert(
          objectId: search.objectId!,
          title: search.title!,
          createdAt: Value(search.createdAt!),
        ),
      );

}
