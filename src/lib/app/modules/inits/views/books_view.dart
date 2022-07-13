import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// Books screen after Books
// ignore: must_be_immutable
class BooksView extends StatelessWidget {
  final BooksController controller = Get.put(BooksController());
  final GetStorage userData = GetStorage();
  final MyDatabase database;
  Size? size;

  BooksView({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.db = database;
    size = Get.size;

    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        title: Text(
          AppConstants.booksTitle,
          style: titleTextStyle.copyWith(),
        ),
      ),
      body: SizedBox(
        child: GetBuilder<BooksController>(
          builder: (controller) => listedItems(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.areYouDoneDialog(context),
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.check, color: AppColors.white),
      ),
    );
  }

  Widget listedItems(BuildContext context) {
    return FutureBuilder<List<Book>?>(
      future: controller.fetchBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>?> snapshot) {
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
            return noBookData();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return const CircularProgress();
        }
      },
    );
  }

  Widget noBookData() {
    return Center(
      child: Container(
        width: 500,
        height: 175,
        margin: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: AppColors.white,
          //border: Border.all(color: ),
          boxShadow: [BoxShadow(blurRadius: 5)],
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              Text(
                AppConstants.noConnection,
                style: titleTextStyle.copyWith(
                  fontSize: 20,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                AppConstants.noConnectionBody,
                style: TextStyle(fontSize: 16),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
