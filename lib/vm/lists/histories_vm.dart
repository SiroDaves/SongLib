import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../model/base/book.dart';
import '../../model/base/history.dart';
import '../../model/base/song.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';

@injectable
class HistoriesVm with ChangeNotifierEx {
  late final HistoriesNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository db;

  HistoriesVm(this.db, this.localStorage);

  final ScrollController listsScroller =
      ScrollController(initialScrollOffset: 0);

  bool isBusy = false;
  List<Book>? books = [];
  List<Song>? songs = [];
  List<History>? histories = [];

  Future<void> init(HistoriesNavigator screenNavigator) async {
    navigator = screenNavigator;
    await fetchData();
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();

    try {
      songs = await db.fetchSongs();
      histories = await db.fetchHistories();
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    isBusy = false;
    notifyListeners();
  }

  void onBackPressed() => navigator.goBack<void>();
}

abstract class HistoriesNavigator implements BackNavigator {}
