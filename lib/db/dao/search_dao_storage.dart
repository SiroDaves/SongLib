import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/search.dart';
import '../../model/tables/db_search_table.dart';
import '../songlib_db.dart';


part 'search_dao_storage.g.dart';

@lazySingleton
abstract class SearchDaoStorage {
  @factoryMethod
  factory SearchDaoStorage(SongLibDb db) = _SearchDaoStorage;

  Stream<List<DbSearch>> getAllSearchesStream();

  Future<List<Search>> getAllSearches();

  Future<void> createSearch(Search search);
}

@DriftAccessor(tables: [
  DbSearchTable,
])
class _SearchDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_SearchDaoStorageMixin
    implements SearchDaoStorage {
  _SearchDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<Search>> getAllSearches() async {
    final List<DbSearch> dbSearches = await select(db.dbSearchTable).get();
    final List<Search> searches = [];

    for (int i = 0; i < dbSearches.length; i++) {
      searches.add(
        Search(
          id: dbSearches[i].id,
          objectId: dbSearches[i].objectId,
          title: dbSearches[i].title,
          createdAt: dbSearches[i].createdAt,
        ),
      );
    }
    return searches;
  }

  @override
  Stream<List<DbSearch>> getAllSearchesStream() => select(db.dbSearchTable).watch();

  @override
  Future<void> createSearch(Search search) => into(db.dbSearchTable).insert(
        DbSearchTableCompanion.insert(
          objectId: Value(search.objectId!),
          title: Value(search.title!),
          createdAt: Value(search.createdAt!),
        ),
      );

}
