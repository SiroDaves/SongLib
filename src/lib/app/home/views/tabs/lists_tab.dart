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
    if (controller.listeds!.isNotEmpty) {
      dataWidget = Column(
        children: [
          Tab1Search(
            listeds: controller.listeds,
            height: size!.height,
          ),
          listContainer(context),
        ],
      );
    } else {
      dataWidget = const NoDataToShow(
        title: AppConstants.itsEmptyHere,
        description: AppConstants.itsEmptyHereBody1,
      );
    }

    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        child: controller.isTab1Busy ? const ListLoading() : dataWidget,
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
