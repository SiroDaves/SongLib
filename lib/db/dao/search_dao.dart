import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/search.dart';
import '../../model/tables/searchs_table.dart';
import '../app_database.dart';

part 'search_dao.g.dart';

@lazySingleton
abstract class SearchDao {
  @factoryMethod
  factory SearchDao(AppDatabase db) = _SearchDao;

  Future<List<Search>> getAllSearches();
  Future<void> createSearch(Search search);
  Future<void> deleteSearch(Search search);
}

@DriftAccessor(tables: [
  SearchsTable,
])
class _SearchDao extends DatabaseAccessor<AppDatabase>
    with _$_SearchDaoMixin
    implements SearchDao {
  _SearchDao(AppDatabase db) : super(db);

  @override
  Future<List<Search>> getAllSearches() async {
    return await customSelect(
      'SELECT * FROM ${db.searchsTable.actualTableName} '
      'ORDER BY ${db.searchsTable.id.name} DESC;',
      readsFrom: {db.searchsTable},
    ).watch().map(
      (rows) {
        return rows.map((row) => Search.fromData(row.data)).toList();
      },
    ).first;
  }

  @override
  Future<void> createSearch(Search search) => into(db.searchsTable).insert(
        SearchsTableCompanion.insert(
          searchId: Value(search.searchId!),
          title: Value(search.title!),
          created: Value(search.created!),
        ),
      );

  @override
  Future<void> deleteSearch(Search search) =>
      (delete(db.searchsTable)..where((row) => row.id.equals(search.id))).go();
}
