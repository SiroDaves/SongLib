import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/songext.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../util/constants/utilities.dart';
import '../../widget/general/toast.dart';

@injectable
class HomeVm with ChangeNotifierEx {
  late final HomeNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  HomeVm(this.dbRepo, this.localStorage);

  bool isBusy = false;
  String selectedBooks = "";
  List<String> bookNos = [];
  int mainBook = 0, currentPage = 1;

  List<Book>? books = [];
  List<SongExt>? filtered = [], songs = [];
  List<Listed>? listeds = [];
  List<Draft>? drafts = [];

  String? title, content;
  TextEditingController? titleController, contentController;

  Future<void> init(HomeNavigator navigator) async {
    navigator = navigator;
    titleController = TextEditingController();
    contentController = TextEditingController();

    selectedBooks = localStorage.getPrefString(PrefConstants.selectedBooksKey);
    bookNos = selectedBooks.split(",");
    mainBook = int.parse(bookNos[0]);
    await fetchData();
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();

    listeds = await dbRepo.fetchListeds();
    books = await dbRepo.fetchBooks();
    songs = await dbRepo.fetchSongs();
    await selectSongbook(mainBook);
    drafts = await dbRepo.fetchDrafts();

    isBusy = false;
    notifyListeners();
  }

  /// Get the listed data from the DB
  Future<void> fetchListedData() async {
    notifyListeners();
    try {
      listeds = await dbRepo.fetchListeds();
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    notifyListeners();
  }

  /// Get the song data from the DB
  Future<void> fetchSearchData() async {
    notifyListeners();
    try {
      books = await dbRepo.fetchBooks();
      songs = await dbRepo.fetchSongs();
      await selectSongbook(mainBook);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    notifyListeners();
  }

  /// Get the notes data from the DB
  Future<void> fetchDraftsData() async {
    notifyListeners();
    try {
      drafts = await dbRepo.fetchDrafts();
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    notifyListeners();
  }

  /// Set songbook
  Future<void> selectSongbook(int book) async {
    isBusy = true;
    notifyListeners();
    mainBook = book;

    try {
      filtered!.clear();
      for (int i = 0; i < songs!.length; i++) {
        if (songs![i].book == book) {
          filtered!.add(songs![i]);
        }
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    isBusy = false;
    notifyListeners();
  }

  Future<void> likeSong(SongExt song) async {
    try {
      await dbRepo.editSong(song);
      if (!song.liked!) {
        showToast(
          text: '${song.title} ${AppConstants.songLiked}',
          state: ToastStates.success,
        );
      }
      notifyListeners();
    } catch (_) {}
  }

  Future<void> copySong(SongExt song) async {
    final String songText = song.content!.replaceAll("#", "\n");
    try {
      await Clipboard.setData(ClipboardData(
        text: '${songItemTitle(song.songNo!, song.title!)}\n\n$songText',
      ));
      showToast(
        text: '${song.title} ${AppConstants.songCopied}',
        state: ToastStates.success,
      );
    } catch (_) {}
  }

  Future<void> shareSong(SongExt song) async {
    final String songText = song.content!.replaceAll("#", "\n");
    try {
      await Share.share(
        '${songItemTitle(song.songNo!, song.title!)}\n\n$songText',
        subject: AppConstants.shareVerse,
      );
      showToast(
        text: AppConstants.verseReadyShare,
        state: ToastStates.success,
      );
    } catch (_) {}
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    try {
      if (titleController!.text.isNotEmpty) {
        title = titleController!.text;
        content = contentController!.text;

        validated = true;
      } else {
        validated = false;
      }
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    return validated;
  }

  /// Save changes for a listed be it a new one or simply updating an old one
  Future<void> saveNewList() async {
    if (validateInput()) {
      isBusy = true;
      notifyListeners();

      try {
        final Listed listed = Listed(
          objectId: '',
          title: titleController!.text,
          description: contentController!.text,
        );
        await dbRepo.saveListed(listed);
        await fetchListedData();
        showToast(
          text: '${listed.title} ${AppConstants.listCreated}',
          state: ToastStates.success,
        );

        localStorage.listed = listed;
        navigator.goToListView();
      } catch (_) {}
      isBusy = false;
      notifyListeners();
    }
  }

  void openPresentor({SongExt? song, Draft? draft}) async {
    if (song != null) {
      localStorage.song = song;
    } else if (draft != null) {
      localStorage.draft = draft;
    }
    navigator.goToPresentor();
  }

  void openEditor({SongExt? song, Draft? draft}) async {
    if (song != null) {
      localStorage.song = song;
      localStorage.draft = null;
    } else if (draft != null) {
      localStorage.song = null;
      localStorage.draft = draft;
    }
    navigator.goToEditor();
  }

  void openListView(Listed listed) {
    localStorage.listed = listed;
    navigator.goToListView();
  }
}

abstract class HomeNavigator {
  void goToPresentor();
  void goToEditor();
  void goToLikes();
  void goToListView();
  void goToHistories();
  void goToHelpDesk();
  void goToSettings();
}
