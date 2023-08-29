import 'dart:developer' as logger show log;

import 'package:injectable/injectable.dart';

import '../db/dao/app_dao.dart';
import '../db/dao/book_dao.dart';
import '../db/dao/draft_dao.dart';
import '../db/dao/edit_dao.dart';
import '../db/dao/history_dao.dart';
import '../db/dao/listed_dao.dart';
import '../db/dao/search_dao.dart';
import '../db/dao/song_dao.dart';
import '../model/base/book.dart';
import '../model/base/draft.dart';
import '../model/base/edit.dart';
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
    AppDao appDao,
    BookDao bookDao,
    DraftDao draftDao,
    EditDao editDao,
    HistoryDao historyDao,
    ListedDao listedDao,
    SearchDao searchDao,
    SongDao songDao,
  ) = DbRepo;

  Future<void> checkAppDatabase();
  Future<List<Book>> fetchBooks();
  Future<List<Draft>> fetchDrafts();
  Future<List<HistoryExt>> fetchHistories();
  Future<List<Listed>> fetchListeds();
  Future<List<ListedExt>> fetchListedSongs(int listed);
  Future<List<Search>> fetchSearches();
  Future<List<SongExt>> fetchSongs();
  Future<List<SongExt>> fetchLikedSongs();
  Future<List<Edit>> fetchEdits();

  Future<void> saveBook(Book book);
  Future<void> saveSong(Song song);
  Future<void> saveDraft(Draft draft);
  Future<int> saveListed(Listed listed);
  Future<void> saveListedSong(Listed listed, SongExt song);
  Future<void> saveHistory(History history);
  Future<void> saveEdit(Edit edit);

  Future<void> editSong(SongExt song);
  Future<void> editDraft(Draft draft);
  Future<void> editListed(Listed listed);

  Future<void> removeBooks();
  Future<void> removeDraft(Draft draft);
  Future<void> removeEdit(Edit edit);
  Future<void> removeListed(Listed listed);
  Future<void> removeListedSongs(Listed listed);
  Future<void> majorCleanUp(String selectedBooks);
}

class DbRepo implements DbRepository {
  final AppDao appDao;
  final BookDao bookDao;
  final DraftDao draftDao;
  final EditDao editDao;
  final HistoryDao historyDao;
  final ListedDao listedDao;
  final SearchDao searchDao;
  final SongDao songDao;

  DbRepo(
    this.appDao,
    this.bookDao,
    this.draftDao,
    this.editDao,
    this.historyDao,
    this.listedDao,
    this.searchDao,
    this.songDao,
  );

  @override
  Future<void> checkAppDatabase() async {
    await appDao.checkAppDatabase();
  }

  @override
  Future<List<Book>> fetchBooks() async {
    try {
      return await bookDao.getAllBooks();
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<List<Draft>> fetchDrafts() async {
    try {
      return await draftDao.getAllDrafts();
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<List<HistoryExt>> fetchHistories() async {
    try {
      return await historyDao.getAllHistories();
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<List<Listed>> fetchListeds() async {
    try {
      return await listedDao.getAllListeds();
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<List<ListedExt>> fetchListedSongs(int parentid) async {
    try {
      return await listedDao.getListedSongs(parentid);
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<List<Search>> fetchSearches() async {
    try {
      return await searchDao.getAllSearches();
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<List<SongExt>> fetchSongs() async {
    try {
      return await songDao.getAllSongs();
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<List<Edit>> fetchEdits() async {
    try {
      return await editDao.getAllEdits();
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<List<SongExt>> fetchLikedSongs() async {
    try {
      return await songDao.getLikedSongs();
    } catch (e) {
      logger.log(e.toString());
      return [];
    }
  }

  @override
  Future<void> saveBook(Book book) async {
    try {
      await bookDao.createBook(book);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> saveSong(Song song) async {
    try {
      await songDao.createSong(song);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> saveDraft(Draft draft) async {
    try {
      await draftDao.createDraft(draft: draft, isSimple: true);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<int> saveListed(Listed listed) async {
    try {
      return await listedDao.createListed(listed);
    } catch (e) {
      logger.log(e.toString());
      return 0;
    }
  }

  @override
  Future<void> saveEdit(Edit edit) async {
    try {
      await editDao.createEdit(edit);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> saveListedSong(Listed listed, SongExt song) async {
    try {
      await listedDao.updateListed(listed);
      return await listedDao.createListedSong(listed, song);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> saveHistory(History history) async {
    try {
      return await historyDao.createHistory(history);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> editSong(SongExt song) async {
    try {
      await editDao.createEdit(
        Edit(
          song: song.objectId,
          book: song.book,
          songNo: song.songNo,
          title: song.title,
          content: song.content,
          key: song.key,
          alias: song.alias,
        ),
      );
      await songDao.updateSong(song);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> editDraft(Draft draft) async {
    try {
      await draftDao.updateDraft(draft);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> editListed(Listed listed) async {
    try {
      await listedDao.updateListed(listed);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> removeBooks() async {
    try {
      await bookDao.deleteBooks();
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> removeDraft(Draft draft) async {
    try {
      await draftDao.deleteDraft(draft);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> removeEdit(Edit edit) async {
    try {
      await editDao.deleteEdit(edit);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> removeListed(Listed listed) async {
    try {
      await listedDao.deleteListed(listed);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> removeListedSongs(Listed listed) async {
    try {
      await listedDao.deleteListedSongs(listed);
    } catch (e) {
      logger.log(e.toString());
    }
  }

  @override
  Future<void> majorCleanUp(String selectedBooks) async {
    final List<String> books = selectedBooks.split(",");
    final List<SongExt> songs = await songDao.getAllSongs();
    final List<History> histories = await historyDao.getHistories();
    final List<Listed> listeds = await listedDao.getAllListeds();
    //final List<Edit> edits = await editDao.getAllEdits();
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
