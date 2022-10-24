import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../model/base/draft.dart';
import '../../model/base/songext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';

@injectable
class LikesVm with ChangeNotifierEx {
  late final LikesNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository dbRepo;

  LikesVm(this.dbRepo, this.localStorage);

  bool isBusy = false;
  List<SongExt>? likes = [];

  Future<void> init(LikesNavigator screenNavigator) async {
    navigator = screenNavigator;
    await fetchData();
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();

    try {
      likes = await dbRepo.fetchLikedSongs();
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
  
  void openPresentor({SongExt? song, Draft? draft}) async {
    if (song != null) {
      localStorage.song = song;
      localStorage.draft = null;
    } else if (draft != null) {
      localStorage.song = null;
      localStorage.draft = draft;
    }
    navigator.goToPresentor();
  }
}

abstract class LikesNavigator implements BackNavigator {
  void goToPresentor();
}
