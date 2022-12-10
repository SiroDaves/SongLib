import 'package:drift/drift.dart';

import '../../db/songlib_db.dart';
import '../base/history.dart';

@DataClassName('Histories')
class HistoriesTable extends Table {
  @override
  String get tableName => 'db_history_table';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get objectId => text().withDefault(const Constant(''))();
  IntColumn get song => integer().withDefault(const Constant(0))();
  TextColumn get createdAt => text().withDefault(const Constant(''))();
}

extension HistoriesExtension on Histories {
  History getModel() => History(
        id: id,
        objectId: objectId,
        song: song,
        createdAt: createdAt,
      );
}

extension HistoryExtension on History {
  HistoriesTableCompanion getDbModel() {
    final id = this.id;
    return HistoriesTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: Value(objectId!),
      song: Value(song!),
      createdAt: Value(createdAt!),
    );
  }
}
