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
import '../../util/constants/app_constants.dart';
import '../../widget/general/toast.dart';
import '../home/home_vm.dart';

@injectable
class ListPopupVm with ChangeNotifierEx {
  late final ListPopupNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository dbRepo;

  ListPopupVm(this.dbRepo, this.localStorage);

  HomeVm? homeVm;
  List<ListedExt>? listeds = [];

  bool isBusy = false;

  Future<void> init(ListPopupNavigator screenNavigator) async {
    navigator = screenNavigator;
    homeVm = GetIt.instance<HomeVm>();
  }

  /// Get the listed data from the DB
  Future<List<Listed>?> fetchListedData() async {
    List<Listed>? listeds = [];
    try {
      listeds = await dbRepo.fetchListeds();
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    return listeds;
  }

  /// Add a song to a list
  Future<void> addSongToList(Listed selected, SongExt song) async {
    isBusy = true;
    notifyListeners();
    final Listed listed = Listed(
      objectId: '',
      parentid: selected.id,
      song: song.id,
      title: song.title,
      description: song.content,
    );
    await dbRepo.saveListedChild(listed);
    showToast(
      text: '${song.title} ${AppConstants.songAddedToList}',
      state: ToastStates.success,
    );
    isBusy = false;
    notifyListeners();
  }

  void onBackPressed() => navigator.goBack<void>();
}

abstract class ListPopupNavigator implements BackNavigator {
  void goToPresentor();
}
