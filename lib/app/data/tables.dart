import 'package:drift/drift.dart';

@DataClassName('Books')
class TableBook extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookid => integer().nullable()();
  IntColumn get enabled => integer().nullable()();
  TextColumn get title => text().withLength(min: 10, max: 50)();
  TextColumn get subtitle => text().withLength(min: 10, max: 50)();
  IntColumn get songs => integer().nullable()();
  IntColumn get position => integer().nullable()();
  TextColumn get created => text().withLength(min: 10, max: 50)();
  TextColumn get updated => text().withLength(min: 10, max: 50)();
}

@DataClassName('Songs')
class TableSong extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get book => integer().nullable()();
  IntColumn get songno => integer().nullable()();
  TextColumn get title => text().withLength(min: 10, max: 50)();
  TextColumn get alias => text().withLength(min: 10, max: 50)();
  TextColumn get content => text().named('body')();
  TextColumn get key => text().withLength(min: 10, max: 50)();
  TextColumn get author => text().withLength(min: 10, max: 50)();
  IntColumn get views => integer().nullable()();
  TextColumn get created => text().withLength(min: 10, max: 50)();
  TextColumn get updated => text().withLength(min: 10, max: 50)();
}
