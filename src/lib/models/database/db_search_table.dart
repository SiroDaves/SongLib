import 'package:drift/drift.dart';

import '../../exports.dart';

@DataClassName('DbSearch')
class DbSearchTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withLength(min: 3, max: 100)();

  TextColumn get title => text().withLength(min: 3, max: 100)();

  TextColumn get createdAt => text().withLength(min: 3, max: 30)();
}

extension DbSearchExtension on DbSearch {
  Search getModel() => Search(
        id: id,
        objectId: objectId,
        title: title,
        createdAt: createdAt,
      );
}

extension SearchExtension on Search {
  DbSearchTableCompanion getDbModel() {
    final id = this.id;
    return DbSearchTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: objectId,
      title: title,
      createdAt: createdAt,
    );
  }
}
