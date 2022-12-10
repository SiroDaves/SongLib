import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../models/base/draft.dart';
import '../../models/base/listed.dart';
import '../../models/exts/listedext.dart';
import '../../models/exts/songext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../utils/constants/app_constants.dart';
import '../../widgets/general/toast.dart';
import '../home/home_vm.dart';

@injectable
class ListViewVm with ChangeNotifierEx {
  late final ListViewNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository dbRepo;

  ListViewVm(this.dbRepo, this.localStorage);

  HomeVm? homeVm;
  Listed? listed;
  List<SongExt>? songs = [];
  List<ListedExt>? listeds = [];

  bool isBusy = false, showSearch = false;
  TextEditingController? titleController, contentController;

  Future<void> init(ListViewNavigator screenNavigator) async {
    navigator = screenNavigator;

    homeVm = GetIt.instance<HomeVm>();
    listed = localStorage.listed;
    titleController = TextEditingController(text: listed!.title);
    contentController = TextEditingController(text: listed!.description);
    await fetchData();
  }

  /// Show search widget
  Future<void> showSearchWidget(bool show) async {
    showSearch = show;
    notifyListeners();
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();
    songs = await dbRepo.fetchSongs();
    listeds = await dbRepo.fetchListedSongs(listed!.id!);
    isBusy = false;
    notifyListeners();
  }

  /// Save changes for a listed be it a new one or simply updating an old one
  Future<void> saveChanges() async {
    if (titleController!.text.isNotEmpty) {
      isBusy = true;
      notifyListeners();
      listed!.title = titleController!.text;
      listed!.description = contentController!.text;
      await dbRepo.editListed(listed!);
      showToast(
        text: '${listed!.title} ${AppConstants.listUpdated}',
        state: ToastStates.success,
      );
      isBusy = false;
      notifyListeners();
    }
  }

  Future<void> confirmDelete(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Just a Minute',
          style: TextStyle(fontSize: 18),
        ),
        content: Text(
          'Are you sure you want to delete the song list: ${listed!.title}?',
          style: const TextStyle(fontSize: 14),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              showToast(
                text: '${listed!.title} ${AppConstants.deleted}',
                state: ToastStates.success,
              );
              Navigator.pop(context);
              dbRepo.deleteListed(listed!);
              homeVm!.fetchListedData();
              onBackPressed();
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

  /// Add a song to a list
  Future<void> addSongToList(SongExt song) async {
    isBusy = true;
    notifyListeners();
    await dbRepo.saveListedSong(listed!, song);
    await showSearchWidget(false);
    await fetchData();
    showToast(
      text: '${song.title} ${AppConstants.songAddedToList}',
      state: ToastStates.success,
    );
    isBusy = false;
    notifyListeners();
  }

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

  void onBackPressed() => navigator.goBack<void>();
}

abstract class ListViewNavigator implements BackNavigator {
  void goToPresentor();
}
