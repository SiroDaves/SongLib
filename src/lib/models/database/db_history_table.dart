import 'package:drift/drift.dart';

import '../../exports.dart';

@DataClassName('DbHistory')
class DbHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withLength(min: 0, max: 100)();

  IntColumn get song => integer().withDefault(const Constant(0))();

  TextColumn get createdAt => text().withDefault(Constant(dateNow()))();
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
      objectId: objectId!,
      song: Value(song!),
      createdAt: Value(createdAt!),
    );
  }
}
