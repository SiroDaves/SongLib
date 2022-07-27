import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

import '../../exports.dart';

@DataClassName('DbBook')
class DbBookTable extends Table {
  String date = DateFormat.yMMMd().format(DateTime.now());
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withLength(min: 0, max: 100)();

  IntColumn get bookid => integer().withDefault(const Constant(0))();

  IntColumn get enabled => integer().withDefault(const Constant(0))();

  TextColumn get title => text().withLength(min: 0, max: 100)();

  TextColumn get subtitle => text().withLength(min: 0, max: 100)();

  IntColumn get songs => integer().withDefault(const Constant(0))();

  IntColumn get position => integer().withDefault(const Constant(0))();

  TextColumn get createdAt => text().withDefault(Constant(dateNow()))();

  TextColumn get updatedAt => text().withDefault(Constant(dateNow()))();
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
      objectId: objectId!,
      bookid: Value(bookid!),
      enabled: Value(enabled!),
      title: title!,
      subtitle: subtitle!,
      songs: Value(songs!),
      position: Value(position!),
      createdAt: Value(createdAt!),
      updatedAt:Value( updatedAt!),
    );
  }
}
