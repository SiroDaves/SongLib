import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/book.dart';
import '../models/song.dart';
import '../models/songext.dart';
import 'dao/books_dao.dart';
import 'dao/songs_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [Book, Song],
  views: [SongExt],
)
abstract class AppDatabase extends FloorDatabase {
  BooksDao get bookDao;
  SongsDao get songDao;
}
