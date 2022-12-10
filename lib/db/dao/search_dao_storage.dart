import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../models/base/search.dart';
import '../../models/tables/searches_table.dart';
import '../songlib_db.dart';

part 'search_dao_storage.g.dart';

@lazySingleton
abstract class SearchDaoStorage {
  @factoryMethod
  factory SearchDaoStorage(SongLibDb db) = _SearchDaoStorage;

  Future<List<Search>> getAllSearches();
  Future<void> createSearch(Search search);
  Future<void> deleteSearch(Search search);
}

@DriftAccessor(tables: [
  SearchesTable,
])
class _SearchDaoStorage extends DatabaseAccessor<SongLibDb>
    with _$_SearchDaoStorageMixin
    implements SearchDaoStorage {
  _SearchDaoStorage(SongLibDb db) : super(db);

  @override
  Future<List<Search>> getAllSearches() async {
    final Stream<List<Search>> streams = customSelect(
      'SELECT * FROM ${db.searchesTable.actualTableName} '
      'ORDER BY ${db.searchesTable.id.name} DESC;',
      readsFrom: {db.searchesTable},
    ).watch().map(
      (rows) {
        final List<Search> drafts = [];
        for (final row in rows) {
          drafts.add(
            Search(
              id: const IntType().mapFromDatabaseResponse(row.data['id'])!,
              objectId: const StringType()
                  .mapFromDatabaseResponse(row.data['object_id'])!,
              title: const StringType()
                  .mapFromDatabaseResponse(row.data['title'])!,
              createdAt: const StringType()
                  .mapFromDatabaseResponse(row.data['created_at'])!,
            ),
          );
        }
        return drafts;
      },
    );
    return await streams.first;
  }

  @override
  Future<void> createSearch(Search search) => into(db.searchesTable).insert(
        SearchesTableCompanion.insert(
          objectId: Value(search.objectId!),
          title: Value(search.title!),
          createdAt: Value(search.createdAt!),
        ),
      );

  @override
  Future<void> deleteSearch(Search search) =>
      (delete(db.searchesTable)..where((row) => row.id.equals(search.id))).go();
}
