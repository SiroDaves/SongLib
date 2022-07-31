import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../exports.dart';

// ignore: must_be_immutable
class LikesTab extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  Size? size;

  LikesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;

    return Scaffold(
      body: Container(
        height: size!.height,
        padding: const EdgeInsets.only(top: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.white,
              AppColors.secondaryColor,
              AppColors.black
            ],
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
      ),
    );
  }

  Widget titleContainer() {
    return SizedBox(
      height: size!.height * 0.0815,
      child: Center(
        child: Text(
          AppConstants.likesTitle,
          style: titleTextStyle.copyWith(
            fontSize: size!.height * 0.04375,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    Widget dataWidget;
    if (controller.likes!.isNotEmpty) {
      dataWidget = Column(
        children: [
          Tab2Search(
            books: controller.books,
            songs: controller.likes,
            height: size!.height,
          ),
          listContainer(context),
        ],
      );
    } else {
      dataWidget = const NoDataToShow(
        title: AppConstants.itsEmptyHere,
        description: AppConstants.itsEmptyHereBody3,
      );
    }

    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        child: controller.isBusy ? const ListLoading() : dataWidget,
      ),
    );
  }

  Widget listContainer(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.78125,
      child: Scrollbar(
        thickness: 10,
        trackVisibility: true,
        thumbVisibility: true,
        radius: const Radius.circular(20),
        controller: controller.listsScroller,
        child: ListView.builder(
          controller: controller.listsScroller,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0163,
          ),
          itemBuilder: (context, index) => GestureDetector(
            child: SongItem(
              song: controller.likes![index],
              height: size!.height,
            ),
            onTap: () {
              Get.to(
                () => PresentorView(
                  books: controller.books!,
                  song: controller.likes![index],
                ),
                transition: Transition.rightToLeft,
              );
            },
          ),
          itemCount: controller.likes!.length,
        ),
      ),
    );
  }
}
