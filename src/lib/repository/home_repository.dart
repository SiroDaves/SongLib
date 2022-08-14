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
import '../webservice/web_service.dart';

@lazySingleton
abstract class HomeRepository {
  @factoryMethod
  factory HomeRepository(
    BookDaoStorage bookDao,
    DraftDaoStorage draftDao,
    HistoryDaoStorage historyDao,
    ListedDaoStorage listedDao,
    SearchDaoStorage searchDao,
    SongDaoStorage songDao,
  ) = HomeRepo;

  Future<List<Book>> fetchBooks();
  Future<List<Draft>> fetchDrafts();
  Future<List<History>> fetchHistories();
  Future<List<Listed>> fetchListeds();
  Future<void> createListed(Listed listed);
  Future<List<Search>> fetchSearches();
  Future<List<Song>> fetchSongs();
}

class HomeRepo implements HomeRepository {
  final BookDaoStorage bookDao;
  final DraftDaoStorage draftDao;
  final HistoryDaoStorage historyDao;
  final ListedDaoStorage listedDao;
  final SearchDaoStorage searchDao;
  final SongDaoStorage songDao;

  HomeRepo(
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
  Future<void> createListed(Listed listed) async {
    return await listedDao.createListed(listed);
  }

  @override
  Future<List<Search>> fetchSearches() async {
    return await searchDao.getAllSearches();
  }

  @override
  Future<List<Song>> fetchSongs() async {
    return await songDao.getAllSongs();
  }
}
