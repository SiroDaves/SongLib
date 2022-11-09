import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/song.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/pref_constants.dart';
import '../../webservice/song_response.dart';

@injectable
class ProgressVm with ChangeNotifierEx {
  late final ProgressNavigator navigator;
  final SongResponse api;
  final DbRepository db;
  final LocalStorage localStorage;

  int progress = 0;
  String state = '';
  String time = '00:00';

  ProgressVm(this.api, this.db, this.localStorage);

  bool isBusy = false, onBoarded = false;
  List<Song>? songs = [];
  String selectedBooks = "", predistinatedBooks = "";
  List<String> newBooks = [], oldBooks = [], predistinated = [];

  Future<void> init(ProgressNavigator screenNavigator) async {
    navigator = screenNavigator;
    onBoarded = localStorage.getPrefBool(PrefConstants.onboardedCheckKey);
    selectedBooks = localStorage.getPrefString(PrefConstants.selectedBooksKey);
    predistinatedBooks =
        localStorage.getPrefString(PrefConstants.predistinatedBooksKey);

    if (predistinatedBooks.isNotEmpty) {
      isBusy = true;
      notifyListeners();
      await db.majorCleanUp(selectedBooks);
    }

    await fetchSongs();
  }

  /// Get the list of songs and save theme
  Future<void> fetchSongs() async {
    isBusy = true;
    notifyListeners();

    songs = await api.fetchSongs(selectedBooks);

    isBusy = false;
    notifyListeners();

    await saveSongs();
  }

  /// Get the list of songs and save theme
  Future<void> saveSongs() async {
    if (songs!.isNotEmpty) {
      for (int i = 0; i < songs!.length; i++) {
        try {
          progress = (i / songs!.length * 100).toInt();

          switch (progress) {
            case 1:
              state = "On your\nmarks ...";
              break;
            case 5:
              state = "Set,\nReady ...";
              break;
            case 10:
              state = "Loading\nsongs ...";
              break;
            case 20:
              state = "Patience\npays ...";
              break;
            case 40:
              state = "Loading\nsongs ...";
              break;
            case 75:
              state = "Thanks for\nyour patience!";
              break;
            case 85:
              state = "Finishing up";
              break;
            case 95:
              state = "Almost done";
              break;
          }
          notifyListeners();

          await db.saveSong(songs![i]);
        } catch (_) {}
      }
    }

    localStorage.setPrefBool(PrefConstants.dataLoadedCheckKey, true);
    localStorage.setPrefBool(PrefConstants.wakeLockCheckKey, true);
    localStorage.setPrefBool(PrefConstants.slideHorizontalKey, false);

    if (onBoarded) {
      navigator.goToHome();
    } else {
      navigator.goToOnboarding();
    }
  }
}

abstract class ProgressNavigator {
  void goToHome();
  void goToOnboarding();
}
