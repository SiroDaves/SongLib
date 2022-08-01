import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

// ignore: must_be_immutable
class PresentorView extends StatelessWidget {
  final PresentorController controller = Get.put(PresentorController());
  final GetStorage userData = GetStorage();
  final List<Book>? books;
  final Song? song;
  Size? size;

  PresentorView({Key? key, required this.books, required this.song})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    controller.books = books;
    controller.song = song;
    controller.loadViewer();

    return GetBuilder<PresentorController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            songItemTitle(song!.songNo!, song!.title!),
            style: normalTextStyle,
          ),
          actions: <Widget>[
            InkWell(
              onTap: controller.likeSong,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(controller.likeIcon),
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
                AppColors.secondaryColor,
                AppColors.primaryColor,
                AppColors.black,
              ],
            ),
          ),
          child: mainContainer(context),
        ),
      ),
    );
  }

  Widget popupMenu() {
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
      controller.popupActions(value);
    });
  }

  Widget mainContainer(BuildContext context) {
    List<Tab> viewerTabs = List<Tab>.generate(
      controller.verseInfos.length,
      (int index) {
        return Tab(
          child: Center(
            child: Text(
              controller.verseInfos[index],
              style: titleTextStyle.copyWith(
                fontSize: size!.height * 0.0489,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
    List<Widget> viewerWidgets = List<Widget>.generate(
      controller.verseInfos.length,
      (int index) {
        return Column(
          children: <Widget>[
            verseText(controller.verseTexts[index]),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  const Spacer(),
                  copyVerse(index, controller.verseTexts[index]),
                  shareVerse(index, controller.verseTexts[index]),
                  //screenshotVerse(index, controller.verseTexts[index], context),
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
      indicatorColor: AppColors.secondaryColor,
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
              style: titleTextStyle.copyWith(
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
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        heroTag: "CopyVerse_$index",
        tooltip: AppConstants.copyVerse,
        onPressed: () => controller.copyVerse(lyrics),
        child: const Icon(Icons.content_copy),
      ),
    );
  }

  Widget shareVerse(int index, String lyrics) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        heroTag: "ShareVerse_$index",
        tooltip: AppConstants.shareVerse,
        onPressed: () => controller.shareVerse(lyrics),
        child: const Icon(Icons.share),
      ),
    );
  }

  Widget screenshotVerse(int index, String lyrics, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FloatingActionButton(
        heroTag: "ScreenshotVerse_$index",
        tooltip: AppConstants.shareVerse,
        onPressed: () => controller.screenshotVerse(context, size!, lyrics),
        child: const Icon(Icons.screenshot),
      ),
    );
  }
}
