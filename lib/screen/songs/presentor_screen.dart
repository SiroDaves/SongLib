import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/utilities.dart';
import '../../vm/songs/presentor_vm.dart';
import '../../widget/general/vertical_tabs.dart';
import '../../widget/provider/provider_widget.dart';

/// Screen to present a song in slide format
class PresentorScreen extends StatefulWidget {
  static const String routeName = RouteNames.presentorScreen;

  const PresentorScreen({Key? key}) : super(key: key);

  @override
  PresentorScreenState createState() => PresentorScreenState();
}

@visibleForTesting
class PresentorScreenState extends State<PresentorScreen>
    with BackNavigatorMixin
    implements PresentorNavigator {
  PresentorVm? vm;
  Size? size;

  List<Tab>? viewerTabs;
  List<Widget>? viewerWidgets;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<PresentorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        vm = viewModel;
        return screenWidget(context);
      },
    );
  }

  Widget screenWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vm!.songTitle),
            Text(
              vm!.songTitle,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: <Widget>[
          InkWell(
            onTap: vm!.likeSong,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(vm!.likeIcon),
            ),
          ),
          popupMenu(),
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
        child: mainContainer(context),
      ),
    );
  }

  Widget popupMenu() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return vm!.isDraft
            ? [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(AppConstants.copySong),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text(AppConstants.shareSong),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text(AppConstants.editSong),
                ),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Text(AppConstants.deleteSong),
                ),
              ]
            : [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(AppConstants.copySong),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text(AppConstants.shareSong),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text(AppConstants.editSong),
                ),
              ];
      },
      onSelected: (int value) {
        vm!.popupActions(value);
      },
    );
  }

  Widget mainContainer(BuildContext context) {
    viewerTabs = List<Tab>.generate(
      vm!.verseInfos.length,
      (int index) {
        return Tab(
          child: Center(
            child: Text(
              vm!.verseInfos[index],
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
      vm!.verseInfos.length,
      (int index) {
        return Column(
          children: <Widget>[
            verseText(vm!.verseTexts[index]),
            Row(
              children: [
                const Spacer(),
                copyVerse(index, vm!.verseTexts[index]),
                shareVerse(index, vm!.verseTexts[index]),
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

  Widget copyVerse(int index, String lyrics) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        heroTag: "CopyVerse_$index",
        tooltip: AppConstants.copyVerse,
        backgroundColor: ThemeColors.primary,
        onPressed: () => vm!.copyVerse(lyrics),
        child: const Icon(Icons.content_copy),
      ),
    );
  }

  Widget shareVerse(int index, String lyrics) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        heroTag: "ShareVerse_$index",
        tooltip: AppConstants.shareVerse,
        backgroundColor: ThemeColors.primary,
        onPressed: () => vm!.shareVerse(lyrics),
        child: const Icon(Icons.share),
      ),
    );
  }
}
