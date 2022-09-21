import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wakelock/wakelock.dart';

import '../../model/base/draft.dart';
import '../../model/base/history.dart';
import '../../model/base/songext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../util/constants/utilities.dart';
import '../../widget/general/toast.dart';
import '../home/home_vm.dart';

@injectable
class PresentorVm with ChangeNotifierEx {
  late final PresentorNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository dbRepo;

  PresentorVm(this.dbRepo, this.localStorage);

  HomeVm? homeVm;
  SongExt? song;
  Draft? draft;
  BuildContext? context;

  bool isBusy = false, enableWakeLock = false;
  bool isLiked = true, hasChorus = false, isDraft = false;

  String songTitle = '', songContent = '';
  int curStanza = 0, curSong = 0;
  List<String> songVerses = [], verseInfos = [], verseTexts = [];

  IconData likeIcon = Icons.favorite_border;

  Future<void> init(PresentorNavigator screenNavigator) async {
    enableWakeLock = localStorage.getPrefBool(PrefConstants.wakeLockCheckKey);
    if (enableWakeLock) await Wakelock.enable();

    navigator = screenNavigator;
    homeVm = GetIt.instance<HomeVm>();
    if (localStorage.draft != null) {
      isDraft = true;
      draft = localStorage.draft;
    } else if (localStorage.song != null) {
      isDraft = false;
      song = localStorage.song;
    }
    await loadPresentor();
  }

  /// Prepare song lyrics to be shown in slide format
  Future<void> loadPresentor() async {
    try {
      verseInfos.clear();
      verseTexts.clear();

      if (isDraft) {
        songTitle = draft!.title!;
        songVerses = draft!.content!.split("##");
        final int verseCount = songVerses.length;

        if (draft!.content!.contains("CHORUS")) {
          hasChorus = true;
        } else {
          hasChorus = false;
        }

        if (hasChorus) {
          final String chorus =
              songVerses[1].toString().replaceAll("CHORUS#", "");

          verseInfos.add("1");
          verseInfos.add("C");
          verseTexts.add(songVerses[0]);
          verseTexts.add(chorus);

          for (int i = 2; i < verseCount; i++) {
            verseInfos.add(i.toString());
            verseInfos.add("C");
            verseTexts.add(songVerses[i]);
            verseTexts.add(chorus);
          }
        } else {
          for (int i = 0; i < verseCount; i++) {
            verseInfos.add((i + 1).toString());
            verseTexts.add(songVerses[i]);
          }
        }
      } else {
        songTitle = songItemTitle(song!.songNo!, refineTitle(song!.title!));

        isLiked = song!.liked!;
        likeIcon = isLiked ? Icons.favorite : Icons.favorite_border;
        songVerses = song!.content!.split("##");
        final int verseCount = songVerses.length;

        if (song!.content!.contains("CHORUS")) {
          hasChorus = true;
        } else {
          hasChorus = false;
        }

        if (hasChorus) {
          final String chorus =
              songVerses[1].toString().replaceAll("CHORUS#", "");

          verseInfos.add("1");
          verseInfos.add("C");
          verseTexts.add(songVerses[0]);
          verseTexts.add(chorus);

          for (int i = 2; i < verseCount; i++) {
            verseInfos.add(i.toString());
            verseInfos.add("C");
            verseTexts.add(songVerses[i]);
            verseTexts.add(chorus);
          }
        } else {
          for (int i = 0; i < verseCount; i++) {
            verseInfos.add((i + 1).toString());
            verseTexts.add(songVerses[i]);
          }
        }
      }
    } catch (_) {}
    try {
      await dbRepo.saveHistory(History(song: song!.id));
    } catch (_) {}
  }

  Future<void> popupActions(int value) async {
    switch (value) {
      case 0:
        await copySong();
        break;

      case 1:
        await shareSong();
        break;
      case 2:
        await editSong();
        break;
      case 3:
        await confirmDelete(context!);
        break;
    }
  }

  Future<void> likeSong() async {
    try {
      isLiked = !isLiked;
      song!.liked = isLiked;
      await dbRepo.editSong(song!);
      likeIcon = isLiked ? Icons.favorite : Icons.favorite_border;
      if (isLiked) {
        showToast(
          text: '${song!.title} ${AppConstants.songLiked}',
          state: ToastStates.success,
        );
      }
      notifyListeners();
    } catch (_) {}
  }

  Future<void> copySong() async {
    final String songText = song!.content!.replaceAll("#", "\n");
    try {
      await Clipboard.setData(ClipboardData(
        text: '${songItemTitle(song!.songNo!, song!.title!)}\n\n$songText',
      ));
      showToast(
        text: '${song!.title} ${AppConstants.songCopied}',
        state: ToastStates.success,
      );
    } catch (_) {}
  }

  Future<void> shareSong() async {
    final String songText = song!.content!.replaceAll("#", "\n");
    try {
      await Share.share(
        '${songItemTitle(song!.songNo!, song!.title!)}\n\n$songText',
        subject: AppConstants.shareVerse,
      );
      showToast(
        text: AppConstants.verseReadyShare,
        state: ToastStates.success,
      );
    } catch (_) {}
  }

  Future<void> copyVerse(String lyrics) async {
    try {
      await Clipboard.setData(
        ClipboardData(
          text: '${lyrics.replaceAll("#", "\n")}\n\n'
              '${songItemTitle(song!.songNo!, song!.title!)},\n'
              '${song!.songbook}',
        ),
      );
      showToast(
        text: 'Verse ${AppConstants.textCopied}',
        state: ToastStates.success,
      );
    } catch (_) {}
  }

  Future<void> shareVerse(String lyrics) async {
    try {
      await Share.share(
        '${lyrics.replaceAll("#", "\n")}\n\n'
        '${songItemTitle(song!.songNo!, song!.title!)},\n'
        '${song!.songbook}',
        subject: AppConstants.shareVerse,
      );
      showToast(
        text: AppConstants.verseReadyShare,
        state: ToastStates.success,
      );
    } catch (_) {}
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
          'Are you sure you want to delete the song: $songTitle?',
          style: const TextStyle(fontSize: 14),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              deleteSong();
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

  /// Remove a song from the records
  Future<bool?> deleteSong() async {
    bool? success;

    isBusy = true;
    notifyListeners();

    await dbRepo.deleteDraft(draft!);

    isBusy = true;
    notifyListeners();

    return success;
  }

  Future<void> onBackPressed() async {
    await homeVm!.fetchDraftsData();
    navigator.goBack<void>();
    await Wakelock.disable();
  }

  Future<void> editSong() async {
    try {} catch (_) {}
  }
}

abstract class PresentorNavigator implements BackNavigator {}
