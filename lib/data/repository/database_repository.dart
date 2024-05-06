import '../models/book.dart';
import '../models/song.dart';
import '../models/songext.dart';

abstract class DatabaseRepository{
  Future<List<Book>> fetchBooks();

  Future<void> saveBook(Book book);

  Future<void> removeBook(Book book);

  Future<void> removeAllBooks();

  Future<List<Song>> fetchSongs();

  Future<List<SongExt>> fetchSongExts();

  Future<void> saveSong(Song song);

  Future<void> removeSong(Song song);

  Future<void> removeAllSongs();
}
