import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wakelock/wakelock.dart';

import '../../model/base/draft.dart';
import '../../model/base/songext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/utilities.dart';
import '../../vm/home/home_vm.dart';
import '../../vm/songs/presentor_vm.dart';
import '../../widget/general/vertical_tabs.dart';
import '../../widget/provider/provider_widget.dart';
import 'editor_screen.dart';

class PresentorScreen extends StatefulWidget {
  static const String routeName = RouteNames.presentorScreen;

  final HomeVm? homeVm;
  final SongExt? song;
  final Draft? draft;
  const PresentorScreen({Key? key, this.homeVm, this.song, this.draft})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return PresentorScreenState(homeVm, song, draft);
  }
}

@visibleForTesting
class PresentorScreenState extends State<PresentorScreen>
    with BackNavigatorMixin
    implements PresentorNavigator {
  PresentorScreenState(this.homeVm, this.song, this.draft);
  HomeVm? homeVm;
  SongExt? song;
  Draft? draft;
  Size? size;

  List<Tab>? viewerTabs;
  List<Widget>? viewerWidgets;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<PresentorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization: (
        context,
        viewModel,
        child,
        theme,
        localization,
      ) =>
          screenWidget(context, viewModel),
    );
  }

  Future<void> editSong(BuildContext context) async {
    try {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return EditorScreen(homeVm: homeVm, draft: draft);
          },
        ),
      );
    } catch (_) {}
  }

  Widget screenWidget(BuildContext context, PresentorVm viewModel) {
    viewModel.homeVm = homeVm;
    if (viewModel.enableWakeLock) Wakelock.enable();

    if (song != null) {
      viewModel.song = song;
    } else if (draft != null) {
      viewModel.draft = draft;
      viewModel.isDraft = true;
    }
    viewModel.loadPresentor();

    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.songTitle),
        actions: <Widget>[
          viewModel.isDraft
              ? InkWell(
                  onTap: () => editSong(context),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.edit),
                  ),
                )
              : InkWell(
                  onTap: viewModel.likeSong,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(viewModel.likeIcon),
                  ),
                ),
          popupMenu(viewModel),
        ],
      ),
      body: Container(
        height: size!.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.orange,
              ThemeColors.accent,
              ThemeColors.primary,
              Colors.black,
            ],
          ),
        ),
        child: mainContainer(context, viewModel),
      ),
      floatingActionButton: viewModel.isDraft
          ? FloatingActionButton(
              backgroundColor: ThemeColors.primary,
              onPressed: () => viewModel.confirmDelete(context),
              child: const Icon(Icons.delete, color: Colors.white),
            )
          : Container(),
    );
  }

  Widget popupMenu(PresentorVm viewModel) {
    return PopupMenuButton(itemBuilder: (context) {
      return [
        const PopupMenuItem<int>(
          value: 0,
          child: Text(AppConstants.copySong),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text(AppConstants.shareSong),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Text(viewModel.isDraft
              ? AppConstants.deleteSong
              : AppConstants.editSong),
        ),
      ];
    }, onSelected: (int value) {
      viewModel.popupActions(value);
    });
  }

  Widget mainContainer(BuildContext context, PresentorVm viewModel) {
    viewerTabs = List<Tab>.generate(
      viewModel.verseInfos.length,
      (int index) {
        return Tab(
          child: Center(
            child: Text(
              viewModel.verseInfos[index],
              style: TextStyle(
                fontSize: size!.height * 0.0489,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
    viewerWidgets = List<Widget>.generate(
      viewModel.verseInfos.length,
      (int index) {
        return Column(
          children: <Widget>[
            verseText(viewModel.verseTexts[index]),
            Row(
              children: [
                const Spacer(),
                copyVerse(index, viewModel.verseTexts[index], viewModel),
                shareVerse(index, viewModel.verseTexts[index], viewModel),
                //screenshotVerse(index, viewModel.verseTexts[index], context, viewModel),
                const Spacer(),
              ],
            ),
          ],
        );
      },
    );

    return VerticalTabs(
      tabsWidth: size!.height * 0.08156,
      tabsElevation: 5,
      indicatorWidth: size!.height * 0.08156,
      tabs: viewerTabs,
      contents: viewerWidgets,
      contentScrollAxis: Axis.vertical,
      indicatorColor: ThemeColors.accent,
    );
  }

  Widget verseText(String lyrics) {
    final double nfontsize = getFontSize(
      lyrics.length + 20,
      size!.height - 200,
      size!.width - 100,
    );
    return Container(
      height: size!.height * 0.755,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        elevation: 5,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              lyrics.replaceAll("#", "\n"),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: nfontsize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget copyVerse(int index, String lyrics, PresentorVm viewModel) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        heroTag: "CopyVerse_$index",
        tooltip: AppConstants.copyVerse,
        backgroundColor: ThemeColors.primary,
        onPressed: () => viewModel.copyVerse(lyrics),
        child: const Icon(Icons.content_copy),
      ),
    );
  }

  Widget shareVerse(int index, String lyrics, PresentorVm viewModel) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        heroTag: "ShareVerse_$index",
        tooltip: AppConstants.shareVerse,
        backgroundColor: ThemeColors.primary,
        onPressed: () => viewModel.shareVerse(lyrics),
        child: const Icon(Icons.share),
      ),
    );
  }

  Widget screenshotVerse(
      int index, String lyrics, BuildContext context, PresentorVm viewModel) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        heroTag: "ScreenshotVerse_$index",
        tooltip: AppConstants.shareVerse,
        backgroundColor: ThemeColors.primary,
        onPressed:
            () {}, //=> viewModel.screenshotVerse(context, size!, lyrics),
        child: const Icon(Icons.screenshot),
      ),
    );
  }
}
