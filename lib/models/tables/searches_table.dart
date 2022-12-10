import 'package:drift/drift.dart';

import '../../db/songlib_db.dart';
import '../base/search.dart';

@DataClassName('Searches')
class SearchesTable extends Table {
  @override
  String get tableName => 'db_search_table';
  
  IntColumn get id => integer().autoIncrement()();
  TextColumn get objectId => text().withDefault(const Constant(''))();
  TextColumn get title => text().withDefault(const Constant(''))();
  TextColumn get createdAt => text().withDefault(const Constant(''))();
}

extension SearchesExtension on Searches {
  Search getModel() => Search(
        id: id,
        objectId: objectId,
        title: title,
        createdAt: createdAt,
      );
}

extension SearchExtension on Search {
  SearchesTableCompanion getDbModel() {
    final id = this.id;
    return SearchesTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: Value(objectId!),
      title: Value(title!),
      createdAt: Value(createdAt!),
    );
  }
}
