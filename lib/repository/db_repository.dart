import 'package:injectable/injectable.dart';

import '../db/dao/book_dao_storage.dart';
import '../db/dao/draft_dao_storage.dart';
import '../db/dao/history_dao_storage.dart';
import '../db/dao/listed_dao_storage.dart';
import '../db/dao/search_dao_storage.dart';
import '../db/dao/song_dao_storage.dart';
import '../model/base/book.dart';
import '../model/base/draft.dart';
import '../model/base/history.dart';
import '../model/base/listed.dart';
import '../model/base/search.dart';
import '../model/base/song.dart';

@lazySingleton
abstract class DbRepository {
  @factoryMethod
  factory DbRepository(
    BookDaoStorage bookDao,
    DraftDaoStorage draftDao,
    HistoryDaoStorage historyDao,
    ListedDaoStorage listedDao,
    SearchDaoStorage searchDao,
    SongDaoStorage songDao,
  ) = DbRepo;

  Future<List<Book>> fetchBooks();
  Future<List<Draft>> fetchDrafts();
  Future<List<History>> fetchHistories();
  Future<List<Listed>> fetchListeds();
  Future<List<Search>> fetchSearches();
  Future<List<Song>> fetchSongs();
  Future<List<Song>> fetchLikedSongs();

  Future<void> saveBook(Book book);
  Future<void> saveSong(Song song);
  Future<void> saveDraft(Draft draft);
  Future<void> saveListed(Listed listed);
  Future<void> saveHistory(History history);

  Future<void> editSong(Song song);
}

class DbRepo implements DbRepository {
  final BookDaoStorage bookDao;
  final DraftDaoStorage draftDao;
  final HistoryDaoStorage historyDao;
  final ListedDaoStorage listedDao;
  final SearchDaoStorage searchDao;
  final SongDaoStorage songDao;

  DbRepo(
    this.bookDao,
    this.draftDao,
    this.historyDao,
    this.listedDao,
    this.searchDao,
    this.songDao,
  );

  @override
  Future<List<Book>> fetchBooks() async {
    return await bookDao.getAllBooks();
  }

  @override
  Future<List<Draft>> fetchDrafts() async {
    return await draftDao.getAllDrafts();
  }

  @override
  Future<List<History>> fetchHistories() async {
    return await historyDao.getAllHistories();
  }

  @override
  Future<List<Listed>> fetchListeds() async {
    return await listedDao.getAllListeds();
  }

  @override
  Future<List<Search>> fetchSearches() async {
    return await searchDao.getAllSearches();
  }

  @override
  Future<List<Song>> fetchSongs() async {
    return await songDao.getAllSongs();
  }

  @override
  Future<List<Song>> fetchLikedSongs() async {
    return await songDao.getLikedSongs();
  }

  @override
  Future<void> saveBook(Book book) async {
    await bookDao.createBook(book);
  }

  @override
  Future<void> saveSong(Song song) async {
    await songDao.createSong(song);
  }

  @override
  Future<void> saveDraft(Draft draft) async {
    await draftDao.createDraft(draft);
  }

  @override
  Future<void> saveListed(Listed listed) async {
    return await listedDao.createListed(listed);
  }

  @override
  Future<void> saveHistory(History history) async {
    return await historyDao.createHistory(history);
  }

  @override
  Future<void> editSong(Song song) async {
    await songDao.updateSong(song);
  }
}
