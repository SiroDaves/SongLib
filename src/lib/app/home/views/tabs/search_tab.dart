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
      padding: const EdgeInsets.only(top: 40),
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
            titleContainer(),
            mainContainer(context),
          ],
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        child: controller.isBusy
            ? const ListLoading()
            : Column(
                children: [
                  Tab2Search(
                    books: controller.books,
                    songs: controller.searches,
                    height: size!.height,
                  ),
                  bookContainer(context),
                  listContainer(context),
                ],
              ),
      ),
    );
  }

  Widget titleContainer() {
    return SizedBox(
      height: size!.height * 0.0815,
      child: Center(
        child: Text(
          AppConstants.appTitle,
          style: titleTextStyle.copyWith(
            fontSize: size!.height * 0.05,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget bookContainer(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.0897,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) => SongBook(
          book: controller.books![index],
          height: size!.height,
          onTap: () {
            controller.mainBook = controller.books![index].bookid!;
            controller.fetchSongData();
          },
        ),
        itemCount: controller.books!.length,
      ),
    );
  }

  Widget listContainer(BuildContext context) {
    return Container(
      height: size!.height * 0.7961,
      padding: const EdgeInsets.only(right: 2),
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        controller: controller.songScroller,
        child: ListView.builder(
          controller: controller.songScroller,
          itemCount: controller.songs!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) => SongItem(
            song: controller.songs![index],
            height: size!.height,
            onTap: () {
              Get.to(
                () => PresentorView(
                  books: controller.books!,
                  song: controller.songs![index],
                ),
                transition: Transition.rightToLeft,
              );
            },
          ),
        ),
      ),
    );
  }
}
