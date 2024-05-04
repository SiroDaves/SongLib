import 'package:injectable/injectable.dart';

import '../models/book.dart';
import '../models/song.dart';

@injectable
abstract class DatabaseRepository {
  Future<List<Book>> getSavedBooks();

  Future<void> saveBook(Book book);

  Future<void> removeBook(Book book);

  Future<void> removeAllBooks();

  Future<List<Song>> getSavedSongs();

  Future<void> saveSong(Song song);

  Future<void> removeSong(Song song);

  Future<void> removeAllSongs();
}
