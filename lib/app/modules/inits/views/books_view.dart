import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../exports.dart';

/// Books screen after Books
// ignore: must_be_immutable
class BooksView extends StatelessWidget {
  final BooksController controller = Get.put(BooksController());
  final GetStorage userData = GetStorage();
  Size? size;

  BooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    controller.fetchBooks();

    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        title: Text(
          AppConstants.booksTitle,
          style: appBarTextStyle.copyWith(),
        ),
      ),
      body: SizedBox(
        child: GetBuilder<BooksController>(
          builder: (controller) => listedItems(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => TodosView(),
            transition: Transition.rightToLeft,
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.check, color: AppColors.white),
      ),
    );
  }

  Widget listedItems(BuildContext context) {
    return FutureBuilder<List<Book>?>(
      future: controller.fetchBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>?> snapshot) {
        Widget? widget;
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, index) => GestureDetector(
                child: BookItem(
                  book: snapshot.data![index],
                  selected: controller.listedBooks[index]!.isSelected,
                ),
                onTap: () => controller.onBookSelected(index),
              ),
              itemCount: snapshot.data!.length,
              controller: controller.listScrollController,
            );
          } else {
            return const Center(
              child: Text("It's empty here, no books yet"),
            );
          }
        } else if (snapshot.hasError) {
          widget = Container();
        } else {
          widget = const CircularProgress();
        }
        return widget;
      },
    );
  }
}
