import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

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
          key: const ValueKey('${KeyConstants.booksScreen}title'),
          AppConstants.booksTitle,
          style: titleTextStyle,
        ),
      ),
      body: SizedBox(
        key: const ValueKey('${KeyConstants.booksScreen}sizedbox'),
        child: listedItems(context),
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey(KeyConstants.booksScreenFab),
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
            return GetBuilder<BooksController>(
              builder: (controller) => Scrollbar(
                key: const ValueKey('${KeyConstants.booksScreen}scrollbar'),
                child: ListView.builder(
                  key: const ValueKey('${KeyConstants.booksScreen}listview'),
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (context, index) => GestureDetector(
                    key:
                        ValueKey('${KeyConstants.booksScreen}book_item_$index'),
                    child: BookItem(
                      book: snapshot.data![index],
                      selected: controller.listedBooks[index]!.isSelected,
                    ),
                    onTap: () => controller.onBookSelected(index),
                  ),
                  itemCount: snapshot.data!.length,
                  controller: controller.listScrollController,
                ),
              ),
            );
          } else {
            return const NoDataToShow(
              title: AppConstants.errorOccurred,
              description: AppConstants.errorOccurredBody,
            );
          }
        } else if (snapshot.hasError) {
          return const NoDataToShow(
            title: AppConstants.errorOccurred,
            description: AppConstants.noConnectionBody,
          );
        } else {
          return const CircularProgress(
            key: ValueKey(KeyConstants.circularProgress),
          );
        }
      },
    );
  }
}
