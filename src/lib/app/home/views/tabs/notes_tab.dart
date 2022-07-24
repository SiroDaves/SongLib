import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../exports.dart';

// ignore: must_be_immutable
class NotesTab extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  Size? size;

  NotesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;

    return Container(
      height: size!.height,
      padding: const EdgeInsets.only(top: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
                  SearchContainer(
                    songs: controller.searchList,
                    height: size!.height,
                    hint: 'Search a Draft',
                  ),
                  listContainer(context),
                ],
              ),
      ),
    );
  }

  Widget titleContainer() {
    return SizedBox(
      height: size!.height * 0.0625,
      child: Center(
        child: Text(
          AppConstants.draftTitle,
          style: titleTextStyle.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget listContainer(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.78125,
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
