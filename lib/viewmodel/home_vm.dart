import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/base/book.dart';
import '../model/base/draft.dart';
import '../model/base/listed.dart';
import '../model/base/songext.dart';
import '../repository/db_repository.dart';
import '../repository/shared_prefs/local_storage.dart';
import '../util/constants/app_constants.dart';
import '../util/constants/pref_constants.dart';
import '../util/constants/utilities.dart';
import '../widget/general/toast.dart';

enum PageType { lists, search, likes, drafts, helpdesk, settings }

@singleton
class HomeVm with ChangeNotifierEx {
  late final HomeNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  HomeVm(this.dbRepo, this.localStorage);
  BuildContext? context;

  bool isLoading = false;
  int currentPage = 1;

  Book setBook = Book();
  List<Book>? books = [];

  SongExt setSong = SongExt();
  SongExt setLiked = SongExt();
  List<SongExt>? filtered = [], songs = [], likes = [];

  Listed setListed = Listed();
  List<Listed>? listeds = [];

  Draft setDraft = Draft();
  List<Draft>? drafts = [];

  TextEditingController? searchController = TextEditingController();
  TextEditingController? titleController, contentController;
  PageType setPage = PageType.search;

  List<PageType> pages = [
    PageType.lists,
    PageType.search,
    PageType.likes,
    PageType.drafts,
    PageType.helpdesk,
    PageType.settings,
  ];
  Future<void> init(HomeNavigator screenNavigator) async {
    navigator = screenNavigator;
    titleController = TextEditingController();
    contentController = TextEditingController();

    await fetchData();
  }

  void setCurrentPage(PageType page) async {
    setPage = page;
    searchController!.clear();
    notifyListeners();
  }

  /// Get the data from the DB
  Future<void> fetchData({bool showLoading = true}) async {
    if (showLoading) isLoading = true;
    notifyListeners();

    books = await dbRepo.fetchBooks();

    songs = await dbRepo.fetchSongs();

    likes = await dbRepo.fetchLikedSongs();
    setLiked = likes![0];

    listeds = await dbRepo.fetchListeds();
    setListed = listeds![0];

    drafts = await dbRepo.fetchDrafts();
    setDraft = drafts![0];

    await selectSongbook(books![0]);

    isLoading = false;
    notifyListeners();
  }

  /// Get the listed data from the DB
  Future<void> fetchListedData({bool showLoading = true}) async {
    if (showLoading) isLoading = true;
    notifyListeners();
    listeds = await dbRepo.fetchListeds();
    setListed = listeds![0];
    isLoading = false;
    notifyListeners();
  }

  /// Get the song data from the DB
  Future<void> fetchSearchData({bool showLoading = true}) async {
    if (showLoading) isLoading = true;
    notifyListeners();
    books = await dbRepo.fetchBooks();
    songs = await dbRepo.fetchSongs();
    await selectSongbook(books![0]);
    isLoading = false;
    notifyListeners();
  }

  /// Get the notes data from the DB
  Future<void> fetchDraftsData({bool showLoading = true}) async {
    if (showLoading) isLoading = true;
    notifyListeners();
    drafts = await dbRepo.fetchDrafts();
    setDraft = drafts![0];
    isLoading = false;
    notifyListeners();
  }

  /// Set songbook
  Future<void> selectSongbook(Book book, {bool showLoading = true}) async {
    if (showLoading) isLoading = true;
    notifyListeners();
    setBook = book;

    try {
      filtered!.clear();
      for (int i = 0; i < songs!.length; i++) {
        if (songs![i].book == setBook.bookNo) {
          filtered!.add(songs![i]);
        }
      }
      setSong = filtered![0];
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    isLoading = false;
    notifyListeners();
  }

  /// Get the data from the DB
  Future<void> fetchLikedSongs({bool showLoading = true}) async {
    if (showLoading) isLoading = true;
    notifyListeners();

    try {
      likes = await dbRepo.fetchLikedSongs();
      setLiked = likes![0];
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    isLoading = false;
    notifyListeners();
  }

  /// Add a song to liked songs
  Future<void> likeSong(SongExt song) async {
    bool isLiked = song.liked!;
    isLiked = !isLiked;
    song.liked = isLiked;
    await dbRepo.editSong(song);
    await fetchLikedSongs(showLoading: false);
    if (isLiked) {
      showToast(
        text: '${song.title} ${AppConstants.songLiked}',
        state: ToastStates.success,
      );
    }
    notifyListeners();
  }

  Future<void> copySong(SongExt song) async {
    await Clipboard.setData(ClipboardData(
      text:
          '${songItemTitle(song.songNo!, song.title!)}\n${refineTitle(song.songbook!)}'
          '\n\n${song.content!.replaceAll("#", "\n")}',
    ));
    showToast(
      text: '${song.title} ${AppConstants.songCopied}',
      state: ToastStates.success,
    );
  }

  Future<void> shareSong(SongExt song) async {
    await Share.share(
      '${songItemTitle(song.songNo!, song.title!)}\n${refineTitle(song.songbook!)}'
      '\n\n${song.content!.replaceAll("#", "\n")}',
      subject: AppConstants.shareVerse,
    );
  }

  Future<void> deleteList(BuildContext context, Listed listed) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Just a Minute',
          style: TextStyle(fontSize: 18),
        ),
        content: Text(
          'Are you sure you want to delete the song list: ${listed.title}?',
          style: const TextStyle(fontSize: 14),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              dbRepo.deleteListed(listed);
              fetchListedData();
              showToast(
                text: '${listed.title} ${AppConstants.deleted}',
                state: ToastStates.success,
              );
            },
            child: const Text("DELETE"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("CANCEL"),
          ),
        ],
      ),
    );
  }

  void onSearch(String query) async {
    switch (setPage) {
      case PageType.lists:
        if (query.isNotEmpty) {
          /*list = notes
              .where(
                  (e) => e.title!.toLowerCase().contains(query.toLowerCase()))
              .toList();*/
        }
        break;
      case PageType.search:
        if (query.isNotEmpty) {
          filtered = songs!.where((s) {
            return (isNumeric(query) && s.songNo == int.parse(query)) ||
                s.title!.toLowerCase().contains(query.toLowerCase()) ||
                s.alias!.toLowerCase().contains(query.toLowerCase()) ||
                s.content!.toLowerCase().contains(query.toLowerCase());
          }).toList();
        }
        break;
      case PageType.likes:
        if (query.isNotEmpty) {}
        break;
      case PageType.drafts:
        if (query.isNotEmpty) {}
        break;
      default:
        break;
    }
    notifyListeners();
  }

  void onClear() async {
    //filteredTeachers = teachers;
    searchController!.clear();
    notifyListeners();
  }

  /// Save changes for a listed be it a new one or simply updating an old one
  Future<void> saveNewList() async {
    if (titleController!.text.isNotEmpty) {
      isLoading = true;
      notifyListeners();
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

      //localStorage.listed = listed;
      //navigator.goToListView();
      isLoading = false;
      notifyListeners();
    }
  }

  void openPresentor({SongExt? song, Draft? draft}) async {
    if (song != null) {
      localStorage.song = setSong = song;
      localStorage.setPrefBool(PrefConstants.notDraftKey, true);
    } else if (draft != null) {
      localStorage.draft = setDraft = draft;
      localStorage.setPrefBool(PrefConstants.notDraftKey, false);
    }
    notifyListeners();
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      navigator.goToPresentor();
    }
  }

  void openEditor({SongExt? song, Draft? draft}) async {
    if (song != null) {
      localStorage.song = song;
      localStorage.draft = null;
    } else if (draft != null) {
      localStorage.song = null;
      localStorage.draft = draft;
    } else {
      localStorage.song = null;
      localStorage.draft = null;
    }
    navigator.goToEditor();
  }

  void openListView(Listed listed) {
    localStorage.listed = listed;
    navigator.goToListView();
  }

  Future<void> goToMerchandise() async {
    final Uri url = Uri.parse(AppConstants.tshirtOrderLink);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }
}

abstract class HomeNavigator {
  void goToPresentor();
  void goToEditor();
  void goToListView();
  void goToHelpDesk();
  void goToDonation();
  void goToSettings();
}
