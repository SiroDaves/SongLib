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
import '../model/base/historyext.dart';
import '../model/base/listed.dart';
import '../model/base/listedext.dart';
import '../model/base/search.dart';
import '../model/base/song.dart';
import '../model/base/songext.dart';

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
  Future<List<HistoryExt>> fetchHistories();
  Future<List<Listed>> fetchListeds();
  Future<List<ListedExt>> fetchListedSongs(int song);
  Future<List<Search>> fetchSearches();
  Future<List<SongExt>> fetchSongs();
  Future<List<SongExt>> fetchLikedSongs();

  Future<void> saveBook(Book book);
  Future<void> saveSong(Song song);
  Future<void> saveDraft(Draft draft);
  Future<int> saveListed(Listed listed);
  Future<void> saveListedSong(Listed listed, SongExt song);
  Future<void> saveHistory(History history);

  Future<void> editSong(SongExt song);
  Future<void> editDraft(Draft draft);
  Future<void> editListed(Listed listed);

  Future<void> deleteBooks();
  Future<void> deleteDraft(Draft draft);
  Future<void> deleteListed(Listed listed);
  Future<void> deleteListedSongs(Listed listed);
  Future<void> majorCleanUp(String selectedBooks);
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
  Future<List<HistoryExt>> fetchHistories() async {
    return await historyDao.getAllHistories();
  }

  @override
  Future<List<Listed>> fetchListeds() async {
    return await listedDao.getAllListeds();
  }

  @override
  Future<List<ListedExt>> fetchListedSongs(int parentid) async {
    return await listedDao.getListedSongs(parentid);
  }

  @override
  Future<List<Search>> fetchSearches() async {
    return await searchDao.getAllSearches();
  }

  @override
  Future<List<SongExt>> fetchSongs() async {
    return await songDao.getAllSongs();
  }

  @override
  Future<List<SongExt>> fetchLikedSongs() async {
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
    await draftDao.createDraft(draft: draft, isSimple: true);
  }

  @override
  Future<int> saveListed(Listed listed) async {
    return await listedDao.createListed(listed);
  }

  @override
  Future<void> saveListedSong(Listed listed, SongExt song) async {
    await listedDao.updateListed(listed);
    return await listedDao.createListedSong(listed, song);
  }

  @override
  Future<void> saveHistory(History history) async {
    return await historyDao.createHistory(history);
  }

  @override
  Future<void> editSong(SongExt song) async {
    await songDao.updateSong(song);
  }

  @override
  Future<void> editDraft(Draft draft) async {
    await draftDao.updateDraft(draft);
  }

  @override
  Future<void> editListed(Listed listed) async {
    await listedDao.updateListed(listed);
  }

  @override
  Future<void> deleteBooks() async {
    await bookDao.deleteBooks();
  }

  @override
  Future<void> deleteDraft(Draft draft) async {
    await draftDao.deleteDraft(draft);
  }

  @override
  Future<void> deleteListed(Listed listed) async {
    await listedDao.deleteListed(listed);
  }

  @override
  Future<void> deleteListedSongs(Listed listed) async {
    await listedDao.deleteListedSongs(listed);
  }

  @override
  Future<void> majorCleanUp(String selectedBooks) async {
    final List<String> books = selectedBooks.split(",");
    final List<SongExt> songs = await songDao.getAllSongs();
    final List<History> histories = await historyDao.getHistories();
    final List<Listed> listeds = await listedDao.getAllListeds();
    for (final song in songs) {
      if (!books.contains(song.book.toString())) {
        for (final history in histories) {
          if (history.song == song.id) await historyDao.deleteHistory(history);
        }
        for (final listed in listeds) {
          if (listed.song == song.id) await listedDao.deleteListed(listed);
        }
        await songDao.deleteSong(song);
      }
    }
  }
}
