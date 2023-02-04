import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wakelock/wakelock.dart';

import '../../di/injectable.dart';
import '../../model/base/draft.dart';
import '../../model/base/history.dart';
import '../../model/base/songext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../util/constants/utilities.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/presentor_slides.dart';
import '../../widget/general/toast.dart';
import '../home_vm.dart';

@injectable
class PresentorVm with ChangeNotifierEx {
  final LocalStorage localStorage;
  final DbRepository dbRepo;

  PresentorVm(this.dbRepo, this.localStorage);

  late final PresentorNavigator navigator;
  late HomeVm homeVm;
  SongExt? song;
  Draft? draft;

  bool isLoading = false, enableWakeLock = false, slideHorizontal = false;
  bool isLiked = false, hasChorus = false, notDraft = false;

  String songTitle = '', songBook = '', songContent = '';
  int curStanza = 0, curSong = 0;
  List<String> songVerses = [], verseInfos = [], verseTexts = [];

  Size? size;
  PresentorSlides? slides;
  List<Tab> widgetTabs = [];
  List<Widget> widgetContent = [];

  IconData likeIcon = Icons.favorite_border;

  Future<void> init(PresentorNavigator screenNavigator) async {
    navigator = screenNavigator;
    draft = localStorage.draft;
    song = localStorage.song;

    enableWakeLock = localStorage.getPrefBool(PrefConstants.wakeLockCheckKey);
    notDraft = localStorage.getPrefBool(PrefConstants.notDraftKey);
    slideHorizontal =
        localStorage.getPrefBool(PrefConstants.slideHorizontalKey);
    if (enableWakeLock) await Wakelock.enable();

    homeVm = HomeVm(dbRepo, localStorage);
    homeVm = getIt.get<HomeVm>();
    await loadPresentor();
  }

  /// Prepare song lyrics to be shown in slide format
  Future<void> loadPresentor() async {
    isLoading = true;
    notifyListeners();

    verseInfos.clear();
    verseTexts.clear();

    if (notDraft) {
      await loadSong(song!);
      await dbRepo.saveHistory(History(song: song!.id));
    } else {
      await loadSong(
        SongExt(
          songNo: 0,
          id: draft!.id,
          alias: draft!.alias,
          title: draft!.title,
          songbook: 'My Draft Book',
          content: draft!.content,
          author: draft!.author,
          liked: draft!.liked,
          key: draft!.key,
        ),
      );
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadSong(SongExt data) async {
    songBook = refineTitle(data.songbook!);
    songTitle = notDraft
        ? songItemTitle(data.songNo!, data.title!)
        : refineTitle(data.title!);

    isLiked = data.liked!;
    likeIcon = isLiked ? Icons.favorite : Icons.favorite_border;
    songVerses = data.content!.split("##");
    final int verseCount = songVerses.length;

    if (data.content!.contains("CHORUS")) {
      hasChorus = true;
    } else {
      hasChorus = false;
    }

    if (hasChorus) {
      final String chorus = songVerses[1].toString().replaceAll("CHORUS#", "");

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

    // Generate presentor slides
    for (final verse in verseInfos) {
      widgetTabs.add(
        Tab(
          child: PresentorInfo(info: verse, fontSize: size!.height * 0.0489),
        ),
      );
    }
    for (final verse in verseTexts) {
      widgetContent.add(PresentorText(
        lyrics: verse,
        size: size!,
        onDoubleTap: () => Share.share(
          '${verse.replaceAll("#", "\n")}\n\n$songTitle,\n$songBook',
          subject: AppConstants.shareVerse,
        ),
        onLongPress: () => copyVerse(verse),
      ));
    }

    slides = PresentorSlides(
      tabsElevation: 5,
      tabs: widgetTabs,
      contents: widgetContent,
      tabsWidth: size!.height * 0.08156,
      indicatorWidth: size!.height * 0.08156,
      indicatorColor: ThemeColors.accent,
      contentScrollAxis: slideHorizontal ? Axis.horizontal : Axis.vertical,
    );
  }

  /// Add a song to liked songs
  Future<void> likeSong() async {
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
  }

  /// Add a song to liked songs
  Future<void> copySong() async {
    await Clipboard.setData(ClipboardData(
      text: '$songTitle\n$songBook\n\n$songContent',
    ));
    showToast(
      text: '$songTitle ${AppConstants.songCopied}',
      state: ToastStates.success,
    );
  }

  Future<void> copyVerse(String lyrics) async {
    await Clipboard.setData(
      ClipboardData(
        text: '${lyrics.replaceAll("#", "\n")}\n\n$songTitle,\n$songBook',
      ),
    );
    showToast(
      text: 'Verse ${AppConstants.textCopied}',
      state: ToastStates.success,
    );
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
              dbRepo.deleteDraft(draft!);
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

  Future<void> onBackPressed() async {
    await homeVm.fetchData();
    navigator.goBack<void>();
    await Wakelock.disable();
  }
}

abstract class PresentorNavigator implements BackNavigator {
  void goToEditor();
}
