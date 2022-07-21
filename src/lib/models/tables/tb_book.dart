import 'package:drift/drift.dart';

class TbBooks extends Table {
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
