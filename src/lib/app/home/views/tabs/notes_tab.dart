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

    return Scaffold(
      body: Container(
        height: size!.height,
        padding: const EdgeInsets.only(top: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
        onPressed: () {
          Get.to(
            () => EditorView(),
            transition: Transition.downToUp,
          );
        },
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    Widget dataWidget;
    if (controller.listeds!.isNotEmpty) {
      dataWidget = Column(
        children: [
          Tab3Search(
            drafts: controller.drafts,
            height: size!.height,
          ),
          listContainer(context),
        ],
      );
    } else {
      dataWidget = const NoDataToShow(
        title: AppConstants.itsEmptyHere,
        description: AppConstants.itsEmptyHereBody2,
      );
    }

    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        child: controller.isBusy ? const ListLoading() : dataWidget,
      ),
    );
  }

  Widget titleContainer() {
    return SizedBox(
      height: size!.height * 0.0815,
      child: Center(
        child: Text(
          AppConstants.draftTitle,
          style: titleTextStyle.copyWith(
            fontSize: size!.height * 0.04375,
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
      child: Scrollbar(
        thickness: 10,
        trackVisibility: true,
        thumbVisibility: true,
        radius: const Radius.circular(20),
        controller: controller.notesScroller,
        child: ListView.builder(
          controller: controller.notesScroller,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0163,
          ),
          itemBuilder: (context, index) => GestureDetector(
            child: DraftItem(
                draft: controller.drafts![index], height: size!.height),
            onTap: () {},
          ),
          itemCount: controller.drafts!.length,
        ),
      ),
    );
  }
}
