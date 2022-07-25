import 'package:drift/drift.dart';

import '../../exports.dart';

@DataClassName('DbHistory')
class DbHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withLength(min: 3, max: 100)();

  IntColumn get song => integer().nullable()();

  TextColumn get createdAt => text().withLength(min: 3, max: 30)();
}

extension DbHistoryExtension on DbHistory {
  History getModel() => History(
        id: id,
        objectId: objectId,
        song: song,
        createdAt: createdAt,
      );
}

extension HistoryExtension on History {
  DbHistoryTableCompanion getDbModel() {
    final id = this.id;
    return DbHistoryTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: objectId,
      song: Value(song),
      createdAt: createdAt,
    );
  }
}
