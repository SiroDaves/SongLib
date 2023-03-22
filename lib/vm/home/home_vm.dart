import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/listedext.dart';
import '../../model/base/songext.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/utilities.dart';
import '../../widget/general/toast.dart';

enum PageType { lists, search, likes, drafts, helpdesk, settings }

@singleton
class HomeVm with ChangeNotifierEx {
  late final HomeNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  HomeVm(this.dbRepo, this.localStorage);
  AppLocalizations? tr;

  bool isLoading = false, isSearching = false;
  int currentPage = 1;

  Book setBook = Book();
  List<Book>? books = [];

  String songTitle = 'Song Title';
  SongExt setSong = SongExt();
  SongExt setLiked = SongExt();
  List<SongExt>? filtered = [], songs = [], likes = [], listSongs = [];
  List<String> verses = [];

  Listed setListed = Listed();
  List<ListedExt>? listedSongs = [];
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

    listeds = await dbRepo.fetchListeds();

    drafts = await dbRepo.fetchDrafts();

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

  /// Get the data from the DB
  Future<void> fetchSetListedData() async {
    isLoading = true;
    notifyListeners();

    listedSongs = await dbRepo.fetchListedSongs(setListed.id!);
    for (var listed in listedSongs!) {
      listSongs!.add(
        SongExt(
          songbook: listed.songbook,
          songNo: listed.songNo,
          book: listed.book,
          title: listed.title,
          alias: listed.alias,
          content: listed.content,
          views: listed.views,
          likes: listed.likes,
          liked: listed.liked,
          author: listed.author,
          key: listed.key,
          id: listed.songId,
        ),
      );
    }
    
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
    isSearching = false;
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
        text: '${song.title} ${tr!.songLiked}',
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
      text: '${song.title} ${tr!.songCopied}',
      state: ToastStates.success,
    );
  }

  Future<void> shareSong(SongExt song) async {
    await Share.share(
      '${songItemTitle(song.songNo!, song.title!)}\n${refineTitle(song.songbook!)}'
      '\n\n${song.content!.replaceAll("#", "\n")}',
      subject: tr!.shareVerse,
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
              dbRepo.removeListed(listed);
              fetchListedData();
              showToast(
                text: '${listed.title} ${tr!.deleted}',
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
        isSearching = true;
        if (query.isNotEmpty) {
          final qry = query.toLowerCase();

          filtered = songs!.where((s) {
            // Check if the song number matches the query (if query is numeric)
            if (isNumeric(query) && s.songNo == int.parse(query)) {
              return true;
            }

            // Create a regular expression pattern to match "," and "!" characters
            RegExp charsPtn = RegExp(r'[!,]');

            // Split the query into words if it contains commas
            List<String> words;
            if (query.contains(',')) {
              words = query.split(',');
              // Trim whitespace from each word
              words = words.map((w) => w.trim()).toList();
            } else {
              words = [qry];
            }

            // Create a regular expression pattern to match the words in the query
            RegExp queryPtn = RegExp(words.map((w) => '($w)').join('.*'));

            // Remove "," and "!" characters from s.title, s.alias, and s.content
            String title = s.title!.replaceAll(charsPtn, '').toLowerCase();
            String alias = s.alias!.replaceAll(charsPtn, '').toLowerCase();
            String content = s.content!.replaceAll(charsPtn, '').toLowerCase();

            // Check if the song title matches the query, ignoring "," and "!" characters
            if (queryPtn.hasMatch(title)) {
              return true;
            }

            // Check if the song alias matches the query, ignoring "," and "!" characters
            if (queryPtn.hasMatch(alias)) {
              return true;
            }

            // Check if the song content matches the query, ignoring "," and "!" characters
            if (queryPtn.hasMatch(content)) {
              return true;
            }

            return false;
          }).toList();
          /*filtered = songs!.where((s) {
            return (isNumeric(query) && s.songNo == int.parse(query)) ||
                s.title!.toLowerCase().contains(query.toLowerCase()) ||
                s.alias!.toLowerCase().contains(query.toLowerCase()) ||
                s.content!.toLowerCase().contains(query.toLowerCase());
          }).toList();*/
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

  /// Add a song to a list
  Future<void> addSongToList(Listed listed, SongExt song) async {
    isLoading = true;
    notifyListeners();
    await dbRepo.saveListedSong(listed, song);
    showToast(
      text: '${song.title}${tr!.songAddedToList}${listed.title} list',
      state: ToastStates.success,
    );
    listeds = await dbRepo.fetchListeds();
    isLoading = false;
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
        text: '${listed.title} ${tr!.listCreated}',
        state: ToastStates.success,
      );

      isLoading = false;
      notifyListeners();
    }
  }

  /// rebuild the widget tree
  void rebuild() async {
    notifyListeners();
  }
}

abstract class HomeNavigator {
  void goToSongPresentor();
  void goToSongPresentorPc();
  void goToDraftPresentor();
  void goToDraftPresentorPc();
  void goToSongEditor();
  void goToSongEditorPc();
  void goToDraftEditor(bool notEmpty);
  void goToDraftEditorPc(bool notEmpty);
  void goToListView();
  void goToHelpDesk();
  void goToDonation();
  void goToSettings();
}
