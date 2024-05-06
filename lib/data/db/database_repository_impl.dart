import '../models/book.dart';
import '../models/song.dart';
import '../models/songext.dart';
import '../repository/database_repository.dart';
import 'app_database.dart';

/// Implementor of Database Repository
class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Book>> fetchBooks() async {
    return _appDatabase.bookDao.fetchBooks();
  }

  @override
  Future<void> removeBook(Book book) async {
    return _appDatabase.bookDao.deleteBook(book);
  }

  @override
  Future<void> saveBook(Book book) async {
    return _appDatabase.bookDao.insertBook(book);
  }

  @override
  Future<void> removeAllBooks() async {
    return _appDatabase.bookDao.deleteAllBooks();
  }

  @override
  Future<List<Song>> fetchSongs() async {
    return _appDatabase.songDao.fetchSongs();
  }

  @override
  Future<List<SongExt>> fetchSongExts() async {
    final Stream<List<SongExt>> streams = _appDatabase.songDao.fetchSongExts();
    return await streams.first;
  }

  @override
  Future<void> removeSong(Song song) async {
    return _appDatabase.songDao.deleteSong(song);
  }

  @override
  Future<void> saveSong(Song song) async {
    return _appDatabase.songDao.insertSong(song);
  }

  @override
  Future<void> removeAllSongs() async {
    return _appDatabase.songDao.deleteAllSongs();
  }
}
