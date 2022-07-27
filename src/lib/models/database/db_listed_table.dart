import 'package:drift/drift.dart';

import '../../exports.dart';

@DataClassName('DbListed')
class DbListedTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withLength(min: 0, max: 100)();

  IntColumn get parentid => integer().withDefault(const Constant(0))();

  TextColumn get title => text().withLength(min: 0, max: 100)();

  TextColumn get description => text().withLength(min: 0, max: 200)();

  IntColumn get position => integer().withDefault(const Constant(0))();

  TextColumn get createdAt => text().withDefault(Constant(dateNow()))();

  TextColumn get updatedAt => text().withDefault(Constant(dateNow()))();
}

extension DbListedExtension on DbListed {
  Listed getModel() => Listed(
        id: id,
        objectId: objectId,
        parentid: parentid,
        title: title,
        description: description,
        position: position,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension ListedExtension on Listed {
  DbListedTableCompanion getDbModel() {
    final id = this.id;
    return DbListedTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: objectId!,
      parentid: Value(parentid!),
      title: title!,
      description: description!,
      position: Value(position!),
      createdAt: Value(createdAt!),
      updatedAt: Value(updatedAt!),
    );
  }
}
