import '../../repository/database_repository.dart';
import '../models/models.dart';
import 'app_database.dart';

/// Implementor of Database Repository
class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Book>> fetchBooks() async {
    return _appDatabase.booksDao.fetchBooks();
  }

  @override
  Future<void> removeBook(Book book) async {
    return _appDatabase.booksDao.deleteBook(book);
  }

  @override
  Future<void> saveBook(Book book) async {
    return _appDatabase.booksDao.insertBook(book);
  }

  @override
  Future<void> removeAllBooks() async {
    return _appDatabase.booksDao.deleteAllBooks();
  }

  @override
  Future<List<Song>> fetchSongs() async {
    return _appDatabase.songsDao.fetchSongs();
  }

  @override
  Future<Song?> findSongById(int rid) async {
    return _appDatabase.songsDao.findSongById(rid);
  }

  @override
  Future<List<SongExt>> fetchSongExts() async {
    final Stream<List<SongExt>> streams = _appDatabase.songsDao.fetchSongExts();
    return await streams.first;
  }

  @override
  Future<void> removeSong(Song song) async {
    return _appDatabase.songsDao.deleteSong(song);
  }

  @override
  Future<void> saveSong(Song song) async {
    return _appDatabase.songsDao.insertSong(song);
  }

  @override
  Future<void> updateSong(Song song) async {
    return _appDatabase.songsDao.updateSong(song);
  }

  @override
  Future<void> removeAllSongs() async {
    return _appDatabase.songsDao.deleteAllSongs();
  }

  @override
  Future<List<Edit>> fetchEdits() async {
    return _appDatabase.editsDao.fetchEdits();
  }

  @override
  Future<void> removeEdit(Edit edit) async {
    return _appDatabase.editsDao.deleteEdit(edit);
  }

  @override
  Future<void> saveEdit(Edit edit) async {
    return _appDatabase.editsDao.insertEdit(edit);
  }

  @override
  Future<void> removeAllEdits() async {
    return _appDatabase.editsDao.deleteAllEdits();
  }

  @override
  Future<List<Draft>> fetchDrafts() async {
    return _appDatabase.draftsDao.fetchDrafts();
  }

  @override
  Future<void> removeDraft(Draft draft) async {
    return _appDatabase.draftsDao.deleteDraft(draft);
  }

  @override
  Future<void> saveDraft(Draft draft) async {
    return _appDatabase.draftsDao.insertDraft(draft);
  }

  @override
  Future<void> removeAllDrafts() async {
    return _appDatabase.draftsDao.deleteAllDrafts();
  }

  @override
  Future<List<Listed>> fetchListeds() async {
    return _appDatabase.listedsDao.fetchListeds();
  }

  @override
  Future<List<ListedExt>> fetchListedExts() async {
    final Stream<List<ListedExt>> streams = _appDatabase.listedsDao.fetchListedExts();
    return await streams.first;
  }

  @override
  Future<void> removeListed(Listed listed) async {
    return _appDatabase.listedsDao.deleteListed(listed);
  }

  @override
  Future<void> saveListed(Listed listed) async {
    return _appDatabase.listedsDao.insertListed(listed);
  }

  @override
  Future<void> removeAllListeds() async {
    return _appDatabase.listedsDao.deleteAllListeds();
  }

  @override
  Future<List<Search>> fetchSearches() async {
    return _appDatabase.searchesDao.fetchSearches();
  }

  @override
  Future<void> removeSearch(Search search) async {
    return _appDatabase.searchesDao.deleteSearch(search);
  }

  @override
  Future<void> saveSearch(Search search) async {
    return _appDatabase.searchesDao.insertSearch(search);
  }

  @override
  Future<void> removeAllSearches() async {
    return _appDatabase.searchesDao.deleteAllSearches();
  }

  @override
  Future<List<History>> fetchHistories() async {
    return _appDatabase.historiesDao.fetchHistories();
  }

  @override
  Future<List<HistoryExt>> fetchHistoryExts() async {
    final Stream<List<HistoryExt>> streams = _appDatabase.historiesDao.fetchHistoryExts();
    return await streams.first;
  }

  @override
  Future<void> removeHistory(History history) async {
    return _appDatabase.historiesDao.deleteHistory(history);
  }

  @override
  Future<void> saveHistory(History history) async {
    return _appDatabase.historiesDao.insertHistory(history);
  }

  @override
  Future<void> removeAllHistories() async {
    return _appDatabase.historiesDao.deleteAllHistories();
  }
}
