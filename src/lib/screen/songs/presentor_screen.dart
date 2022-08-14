import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/book.dart';
import '../../model/base/song.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/utilities.dart';
import '../../vm/songs/presentor_vm.dart';
import '../../widget/general/vertical_tabs.dart';
import '../../widget/provider/provider_widget.dart';

class PresentorScreen extends StatefulWidget {
  static const String routeName = RouteNames.viewerScreen;

  final List<Book>? books;
  final Song? song;

  const PresentorScreen({Key? key, this.books, this.song}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return PresentorScreenState(books, song);
  }
}

@visibleForTesting
class PresentorScreenState extends State<PresentorScreen>
    with BackNavigatorMixin
    implements PresentorNavigator {
  PresentorScreenState(this.books, this.song);
  List<Book>? books;
  Song? song;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<PresentorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) => Scaffold(
        appBar: AppBar(
          title: Text(
            songItemTitle(song!.songNo!, song!.title!),
          ),
          actions: <Widget>[
            InkWell(
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
      ),
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
        const PopupMenuItem<int>(
          value: 2,
          child: Text(AppConstants.editSong),
        ),
      ];
    }, onSelected: (int value) {
      viewModel.popupActions(value);
    });
  }

  Widget mainContainer(BuildContext context, PresentorVm viewModel) {
    viewModel.books = books;
    viewModel.song = song;
    viewModel.loadViewer();
    
    final List<Tab> viewerTabs = List<Tab>.generate(
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
    final List<Widget> viewerWidgets = List<Widget>.generate(
      viewModel.verseInfos.length,
      (int index) {
        return Column(
          children: <Widget>[
            verseText(viewModel.verseTexts[index]),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  const Spacer(),
                  copyVerse(index, viewModel.verseTexts[index], viewModel),
                  shareVerse(index, viewModel.verseTexts[index], viewModel),
                  //screenshotVerse(index, viewModel.verseTexts[index], context, viewModel),
                  const Spacer(),
                ],
              ),
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
    double nfontsize = getFontSize(
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
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        heroTag: "CopyVerse_$index",
        tooltip: AppConstants.copyVerse,
        onPressed: () => viewModel.copyVerse(lyrics),
        child: const Icon(Icons.content_copy),
      ),
    );
  }

  Widget shareVerse(int index, String lyrics, PresentorVm viewModel) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        heroTag: "ShareVerse_$index",
        tooltip: AppConstants.shareVerse,
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
        onPressed:
            () {}, //=> viewModel.screenshotVerse(context, size!, lyrics),
        child: const Icon(Icons.screenshot),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
