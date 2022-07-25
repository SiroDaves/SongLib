import 'package:drift/drift.dart';

import '../../exports.dart';

@DataClassName('DbLike')
class DbLikeTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withLength(min: 3, max: 100)();

  IntColumn get song => integer().nullable()();

  TextColumn get createdAt => text().withLength(min: 3, max: 30)();
}

extension DbLikeExtension on DbLike {
  Like getModel() => Like(
        id: id,
        objectId: objectId,
        song: song,
        createdAt: createdAt,
      );
}

extension LikeExtension on Like {
  DbLikeTableCompanion getDbModel() {
    final id = this.id;
    return DbLikeTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: objectId,
      song: Value(song),
      createdAt: createdAt,
    );
  }
}
