import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../model/base/listed.dart';
import '../../model/base/listedext.dart';
import '../../model/base/songext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../home/home_vm.dart';

@injectable
class ListVm with ChangeNotifierEx {
  late final ListNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository db;

  ListVm(this.db, this.localStorage);

  HomeVm? homeVm;
  Listed? listed;
  List<SongExt>? songs = [];
  List<ListedExt>? listeds = [];

  bool isBusy = false;
  List<SongExt>? likes = [];

  Future<void> init(ListNavigator screenNavigator) async {
    navigator = screenNavigator;
    homeVm = GetIt.instance<HomeVm>();
    listed = homeVm!.listed;
    await fetchData();
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();

    try {
      likes = await db.fetchLikedSongs();
      //listeds = await db.fetchListedSongs(listed!.id!);
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

abstract class ListNavigator implements BackNavigator {}
