import 'package:drift/drift.dart';

import '../../db/songlib_db.dart';
import '../base/listed.dart';

@DataClassName('Listeds')
class ListedsTable extends Table {
  @override
  String get tableName => 'db_listed_table';
  
  IntColumn get id => integer().autoIncrement()();
  TextColumn get objectId => text().withDefault(const Constant(''))();
  IntColumn get parentid => integer().withDefault(const Constant(0))();
  IntColumn get song => integer().withDefault(const Constant(0))();
  TextColumn get title => text().withDefault(const Constant(''))();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get position => integer().withDefault(const Constant(0))();
  TextColumn get createdAt => text().withDefault(const Constant(''))();
  TextColumn get updatedAt => text().withDefault(const Constant(''))();
}

extension ListedsExtension on Listeds {
  Listed getModel() => Listed(
        id: id,
        song: song,
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
  ListedsTableCompanion getDbModel() {
    final id = this.id;
    return ListedsTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: Value(objectId!),
      song: Value(song!),
      parentid: Value(parentid!),
      title: Value(title!),
      description: Value(description!),
      position: Value(position!),
      createdAt: Value(createdAt!),
      updatedAt: Value(updatedAt!),
    );
  }
}
