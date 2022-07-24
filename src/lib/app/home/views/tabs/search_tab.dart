import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../exports.dart';

// ignore: must_be_immutable
class SearchTab extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  Size? size;

  SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;

    return Container(
      height: size!.height,
      margin: const EdgeInsets.only(top: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.secondaryColor, AppColors.black],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            titleBox(),
            mainWrapper(context),
          ],
        ),
      ),
    );
  }

  Widget mainWrapper(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        child: controller.isBusy
            ? const ListLoading()
            : Column(
                children: [
                  SearchView(
                    songs: controller.searchList,
                    height: size!.height,
                  ),
                  bookList(context),
                  songList(context),
                ],
              ),
      ),
    );
  }

  Widget titleBox() {
    return SizedBox(
      height: size!.height * 0.0625,
      child: Center(
        child: Text(
          AppConstants.appTitle,
          style: titleTextStyle.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget bookList(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.0875,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) => GestureDetector(
          child: SongBook(book: controller.booksList![index]),
          onTap: () {
            controller.mainBook = controller.booksList![index].bookid!;
            controller.fetchSongData();
          },
        ),
        itemCount: controller.booksList!.length,
        controller: controller.bookListScrollController,
      ),
    );
  }

  Widget songList(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.69375,
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) => GestureDetector(
          child: SongItem(song: controller.songsList![index]),
          onTap: () {
            Get.to(
              () => SongView(song: controller.songsList![index]),
              transition: Transition.rightToLeft,
            );
          },
        ),
        itemCount: controller.songsList!.length,
        controller: controller.songListScrollController,
      ),
    );
  }
}
