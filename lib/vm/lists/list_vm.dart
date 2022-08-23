import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../model/base/book.dart';
import '../../model/base/listed.dart';
import '../../model/base/song.dart';
import '../../model/base/songext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';

@injectable
class ListVm with ChangeNotifierEx {
  late final ListNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository db;

  bool isBusy = false;
  ListVm(this.db, this.localStorage);
  
  Listed? listed;
  List<SongExt>? songs = [];

  Future<void> init(ListNavigator screenNavigator) async {
    navigator = screenNavigator;
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();

    try {
      songs = await db.fetchSongs();

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

abstract class ListNavigator implements BackNavigator {
  void goToHome();

  void goToSelection();
}
