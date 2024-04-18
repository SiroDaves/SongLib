import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/book.dart';
import '../models/rider.dart';
import 'dao/riders_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [Rider, Book],
)
abstract class AppDatabase extends FloorDatabase {
  RidersDao get riderDao;
}
