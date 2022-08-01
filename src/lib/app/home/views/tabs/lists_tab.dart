import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../exports.dart';

// ignore: must_be_immutable
class ListsTab extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  Size? size;

  ListsTab({Key? key}) : super(key: key);

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => controller.newListForm(context),
        child: const Icon(Icons.add, color: AppColors.white),
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
                  controller.listeds!.isNotEmpty
                      ? Tab1Search(
                          listeds: controller.listeds,
                          height: size!.height,
                        )
                      : Container(),
                  controller.likes!.isNotEmpty
                      ? likesContainer(context)
                      : Container(),
                  controller.listeds!.isNotEmpty
                      ? listContainer(context)
                      : const NoDataToShow(
                          title: AppConstants.itsEmptyHere1,
                          description: AppConstants.itsEmptyHereBody4,
                        ),
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
          AppConstants.listTitle,
          style: titleTextStyle.copyWith(
            fontSize: size!.height * 0.05,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget likesContainer(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.125,
      child: Column(
        children: [
          SizedBox(
            height: size!.height * 0.03125,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'SONG LIKES',
                    style: titleTextStyle.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.arrow_forward,
                        color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size!.height * 0.0897,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, index) => SongGrid(
                song: controller.likes![index],
                books: controller.books!,
                height: size!.height,
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
        ],
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
        //controller: controller.listsScroller,
        child: ListView.builder(
          //controller: controller.listsScroller,
          itemCount: controller.listeds!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) => ListedItem(
            listed: controller.listeds![index],
            height: size!.height,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
