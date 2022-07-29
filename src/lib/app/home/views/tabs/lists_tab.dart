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
              controller.listeds!.isNotEmpty
                  ? Tab1Search(
                      listeds: controller.listeds,
                      height: size!.height,
                    )
                  : Container(),
              mainContainer(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => newListForm(context),
        child: const Icon(Icons.add, color: AppColors.white),
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
    if (controller.likes!.isEmpty && controller.listeds!.isEmpty) {
      dataWidget = const NoDataToShow(
        title: AppConstants.itsEmptyHere,
        description: AppConstants.itsEmptyHereBody1,
      );
    } else {
      dataWidget = Column(
        children: [
          SizedBox(
            height: size!.height * 0.78125,
            child: Scrollbar(
              thickness: 10,
              radius: const Radius.circular(20),
              child: ListView(children: [
                controller.likes!.isNotEmpty
                    ? likesContainer(context)
                    : Container(),
                controller.listeds!.isNotEmpty
                    ? listContainer(context)
                    : const NoDataToShow(
                        title: AppConstants.itsEmptyHere1,
                        description: AppConstants.itsEmptyHereBody4,
                      ),
              ]),
            ),
          ),
        ],
      );
    }

    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        child: controller.isTab1Busy ? const ListLoading() : dataWidget,
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
              itemBuilder: (context, index) => GestureDetector(
                child: SongGrid(
                  song: controller.likes![index],
                  books: controller.books!,
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
        ],
      ),
    );
  }

  Widget listContainer(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.78125,
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        child: ListView.builder(
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0163,
          ),
          itemBuilder: (context, index) => GestureDetector(
            child: ListedItem(
                listed: controller.listeds![index], height: size!.height),
            onTap: () {},
          ),
          itemCount: controller.listeds!.length,
        ),
      ),
    );
  }

  void newListForm(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppConstants.listedTitle,
              style: normalTextStyle,
            ),
            actions: [
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.clear),
                ),
                onTap: () => controller.confirmCancel(context),
              ),
            ],
          ),
          body: Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FormInput(
                    iLabel: 'Title',
                    iController: controller.titleController!,
                    prefix: const Icon(Icons.text_fields),
                    iOptions: const <String>[],
                  ),
                  FormInput(
                    iLabel: 'Description (Optional)',
                    iController: controller.contentController!,
                    prefix: const Icon(Icons.text_format),
                    iOptions: const <String>[],
                  ),
                  ElevatedButton(
                    child: const Text('Save New List'),
                    onPressed: () {
                      controller.saveListed();
                      controller.fetchListData();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
