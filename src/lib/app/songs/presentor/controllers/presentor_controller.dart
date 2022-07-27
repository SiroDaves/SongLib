import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../exports.dart';

/// The controller for the Presentor screen
class PresentorController extends GetxController {
  final GetStorage userData = GetStorage();
  List<Book>? books;
  Book? book;
  Song? song;
  bool isBusy = false, isLiked = true, hasChorus = false;

  String songContent = '';
  int curStanza = 0, curSong = 0;
  List<String> songVerses = [], verseInfos = [], verseTexts = [];

  BookDaoStorage? bookDao;
  HistoryDaoStorage? historyDao;
  ListedDaoStorage? listedDao;
  SearchDaoStorage? searchDao;
  SongDaoStorage? songDao;

  ScreenshotController screenshotController = ScreenshotController();

  IconData likeIcon = Icons.favorite_border;

  @override
  void onInit() {
    super.onInit();
    bookDao = Get.find<BookDaoStorage>();
    historyDao = Get.find<HistoryDaoStorage>();
    listedDao = Get.find<ListedDaoStorage>();
    searchDao = Get.find<SearchDaoStorage>();
    songDao = Get.find<SongDaoStorage>();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> loadViewer() async {
    books!.retainWhere((item) => item.bookid == song!.book);
    book = books![0];

    isLiked = song!.liked!;
    likeIcon = isLiked ? Icons.favorite : Icons.favorite_border;
    songVerses = song!.content!.split("##");
    int verseCount = songVerses.length;

    if (song!.content!.contains("CHORUS")) {
      hasChorus = true;
    } else {
      hasChorus = false;
    }

    if (hasChorus) {
      String chorus = songVerses[1].toString().replaceAll("CHORUS#", "");

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

  Future<void> popupActions(int value) async {
    switch (value) {
      case 0:
        copySong();
        break;

      case 1:
        copySong();
        break;
      case 2:
        break;
    }
  }

  Future<void> copySong() async {
    String songText = song!.content!.replaceAll("#", "\n");
    Clipboard.setData(ClipboardData(
      text: '${songItemTitle(song!.songno!, song!.title!)}\n\n$songText',
    ));
    showToast(
      text: '${song!.title} ${AppConstants.songCopied}',
      state: ToastStates.success,
    );
  }

  Future<void> shareSong() async {
    String songText = song!.content!.replaceAll("#", "\n");
    await Share.share(
      '${songItemTitle(song!.songno!, song!.title!)}\n\n$songText',
      subject: AppConstants.shareVerse,
    );
    showToast(
      text: AppConstants.verseReadyShare,
      state: ToastStates.success,
    );
  }

  Future<void> likeSong() async {
    isLiked = !isLiked;
    song!.liked = isLiked;
    await songDao!.updateSong(song!);
    likeIcon = isLiked ? Icons.favorite : Icons.favorite_border;
    if (isLiked) {
      showToast(
        text: '${song!.title} ${AppConstants.songLiked}',
        state: ToastStates.success,
      );
    }
    update();
  }

  Future<void> copyVerse(String lyrics) async {
    Clipboard.setData(
      ClipboardData(
        text: '${lyrics.replaceAll("#", "\n")}\n\n'
            '${songItemTitle(song!.songno!, song!.title!)},\n'
            '${book!.title}',
      ),
    );
    showToast(
      text: AppConstants.verseCopied,
      state: ToastStates.success,
    );
  }

  Future<void> shareVerse(String lyrics) async {
    await Share.share(
      '${lyrics.replaceAll("#", "\n")}\n\n'
      '${songItemTitle(song!.songno!, song!.title!)},\n'
      '${book!.title}',
      subject: AppConstants.shareVerse,
    );
    showToast(
      text: AppConstants.verseReadyShare,
      state: ToastStates.success,
    );
  }

  Future<void> screenshotVerse(
    BuildContext context,
    Size size,
    String lyrics,
  ) async {
    Widget screenshotWidget = Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                verseTexts[0].replaceAll("#", "\n"),
                style: normalTextStyle.copyWith(
                  fontSize: getFontSize(
                    verseTexts[0].length + 20,
                    size.height - 200,
                    size.width - 100,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                songItemTitle(song!.songno!, song!.title!),
                style: titleTextStyle.copyWith(
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                book!.title!.toUpperCase(),
                style: titleTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Divider(color: AppColors.secondaryColor, height: 10),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    AppConstants.appIconPath,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    AppConstants.appTitle,
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget screenshotContainer = Container(
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Colors.orange,
            AppColors.secondaryColor,
            AppColors.primaryColor,
            AppColors.black
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          const Spacer(),
          screenshotWidget,
          const Spacer(),
        ],
      ),
    );
    final directory = (await getApplicationDocumentsDirectory()).path;
    String fileName = DateTime.now().microsecondsSinceEpoch as String;

    screenshotController
        .captureFromWidget(
            InheritedTheme.captureAll(context, screenshotContainer),
            delay: const Duration(seconds: 1))
        .then((capturedImage) {
      //showCapturedWidget(context, capturedImage);
    });
    showToast(
      text: AppConstants.screenshoted,
      state: ToastStates.success,
    );
  }

  Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Captured screenshot"),
        ),
        body: Center(
          child: capturedImage.isNotEmpty
              ? Image.memory(capturedImage)
              : Container(),
        ),
      ),
    );
  }
}
