import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/book.dart';
import 'dao/books_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [Book],
)
abstract class AppDatabase extends FloorDatabase {
  BooksDao get bookDao;
}
