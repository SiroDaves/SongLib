import 'package:drift/drift.dart';

import '../../exports.dart';

@DataClassName('DbBook')
class DbBookTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withLength(min: 3, max: 100)();

  IntColumn get bookid => integer().nullable()();

  IntColumn get enabled => integer().nullable()();

  TextColumn get title => text().withLength(min: 3, max: 100)();

  TextColumn get subtitle => text().withLength(min: 3, max: 100)();

  IntColumn get songs => integer().nullable()();

  IntColumn get position => integer().nullable()();

  TextColumn get createdAt => text().withLength(min: 3, max: 30)();

  TextColumn get updatedAt => text().withLength(min: 3, max: 30)();
}

extension DbBookExtension on DbBook {
  Book getModel() => Book(
        id: id,
        objectId: objectId,
        bookid: bookid,
        enabled: enabled,
        title: title,
        subtitle: subtitle,
        songs: songs,
        position: position,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension BookExtension on Book {
  DbBookTableCompanion getDbModel() {
    final id = this.id;
    return DbBookTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: objectId,
      bookid: Value(bookid),
      enabled: Value(enabled),
      title: title,
      subtitle: subtitle,
      songs: Value(songs),
      position: Value(position),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
