import 'package:drift/drift.dart';

class TbSongs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get objectId => text().withLength(min: 3, max: 20)();
  IntColumn get book => integer().nullable()();
  IntColumn get songno => integer().nullable()();
  TextColumn get title => text().withLength(min: 3, max: 100)();
  TextColumn get alias => text().withLength(min: 0, max: 100)();
  TextColumn get content => text().named('body')();
  TextColumn get key => text().withLength(min: 0, max: 20)();
  TextColumn get author => text().withLength(min: 0, max: 100)();
  IntColumn get views => integer().nullable()();
  TextColumn get createdAt => text().withLength(min: 3, max: 30)();
  TextColumn get updatedAt => text().withLength(min: 3, max: 30)();
}
