import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Home screen
class HomeController extends GetxController {
  final GetStorage userData = GetStorage();

  final ScrollController listsScroller =
      ScrollController(initialScrollOffset: 0);

  final ScrollController songScroller =
      ScrollController(initialScrollOffset: 0);

  final ScrollController notesScroller =
      ScrollController(initialScrollOffset: 0);

  bool isTab1Busy = false, isTab2Busy = false,isTab3Busy = false;
  String selectedBooks = "";
  int mainBook = 0;

  List<Book>? books = [];
  List<Song>? searches = [], songs = [];

  List<Listed>? listeds = [];
  List<Draft>? drafts = [];

  BookDaoStorage? bookDao;
  DraftDaoStorage? draftDao;
  HistoryDaoStorage? historyDao;
  LikeDaoStorage? likeDao;
  ListedDaoStorage? listedDao;
  SearchDaoStorage? searchDao;
  SongDaoStorage? songDao;

  @override
  void onInit() {
    super.onInit();
    bookDao = Get.find<BookDaoStorage>();
    draftDao = Get.find<DraftDaoStorage>();
    historyDao = Get.find<HistoryDaoStorage>();
    likeDao = Get.find<LikeDaoStorage>();
    listedDao = Get.find<ListedDaoStorage>();
    searchDao = Get.find<SearchDaoStorage>();
    songDao = Get.find<SongDaoStorage>();

    selectedBooks = userData.read(PrefKeys.selectedBooks);
    var bookids = selectedBooks.split(",");
    mainBook = int.parse(bookids[0]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Get the lists data
  Future<void> fetchListData() async {
    isTab1Busy = true;
    update();

    listeds = await listedDao!.getAllListeds();

    isTab1Busy = false;
    update();
  }

  /// Get the songs data
  Future<void> fetchSongData() async {
    isTab2Busy = true;
    update();

    books = await bookDao!.getAllBooks();
    songs = searches = await songDao!.getAllSongs();
    songs!.removeWhere((item) => item.book != mainBook);

    isTab2Busy = false;
    update();
  }

  /// Get the drafts data
  Future<void> fetchDraftsData() async {
    isTab3Busy = true;
    update();

    drafts = await draftDao!.getAllDrafts();

    isTab3Busy = false;
    update();
  }
}
