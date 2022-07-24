import 'package:drift/drift.dart';

import '../../exports.dart';

@DataClassName('DbSong')
class DbSongTable extends Table {
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

extension DbSongExtension on DbSong {
  Song getModel() => Song(
        id: id,
        objectId: objectId,
        book: book,
        songno: songno,
        title: title,
        alias: alias,
        content: content,
        key: key,
        author: author,
        views: views,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension SongExtension on Song {
  DbSongTableCompanion getDbModel() {
    final id = this.id;
    return DbSongTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
          objectId: objectId,
          book: Value(book),
          songno: Value(songno),
          title: title,
          alias: alias,
          content: content,
          author: author,
          key: key,
          createdAt: createdAt,
          updatedAt: updatedAt,
    );
  }
}
