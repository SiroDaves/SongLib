import 'package:drift/drift.dart';

class TbSongs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get objectId => text().withLength(min: 3, max: 50)();
  IntColumn get book => integer().nullable()();
  IntColumn get songno => integer().nullable()();
  TextColumn get title => text().withLength(min: 3, max: 50)();
  TextColumn get alias => text().withLength(min: 0, max: 50)();
  TextColumn get content => text().named('body')();
  TextColumn get key => text().withLength(min: 0, max: 50)();
  TextColumn get author => text().withLength(min: 0, max: 50)();
  IntColumn get views => integer().nullable()();
  TextColumn get createdAt => text().withLength(min: 3, max: 50)();
  TextColumn get updatedAt => text().withLength(min: 3, max: 50)();
}
