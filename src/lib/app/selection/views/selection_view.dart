import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

// ignore: must_be_immutable
class SelectionView extends StatelessWidget {
  final SelectionController controller = Get.put(SelectionController());
  final GetStorage userData = GetStorage();
  Size? size;

  SelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;

    return GetBuilder<SelectionController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          title: Text(
            key: const ValueKey('${KeyConstants.booksScreen}title'),
            controller.isBusy
                ? AppConstants.booksTitleLoading
                : AppConstants.booksTitle,
            style: normalTextStyle,
          ),
        ),
        body: SizedBox(
          key: const ValueKey('${KeyConstants.booksScreen}sizedbox'),
          child: controller.isBusy
              ? const CircularProgress()
              : mainContainer(context),
        ),
        floatingActionButton: controller.isBusy
            ? Container()
            : FloatingActionButton(
                key: const ValueKey(KeyConstants.booksScreenFab),
                backgroundColor: AppColors.primaryColor,
                onPressed: () => areYouDoneDialog(context),
                child: const Icon(Icons.check, color: AppColors.white),
              ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return FutureBuilder<List<Book>?>(
      future: controller.fetchBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return listContainer(snapshot.data!);
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

  Widget listContainer(List<Book>? books) {
    return Scrollbar(
      key: const ValueKey('${KeyConstants.booksScreen}scrollbar'),
      child: ListView.builder(
        key: const ValueKey('${KeyConstants.booksScreen}listview'),
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) => BookItem(
          key: ValueKey('${KeyConstants.booksScreen}book_item_$index'),
          book: books![index],
          selected: controller.listedBooks[index]!.isSelected,
          onTap: () => controller.onBookSelected(index),
        ),
        itemCount: books!.length,
        controller: controller.listScrollController,
      ),
    );
  }

  Future<void> areYouDoneDialog(BuildContext context) {
    if (controller.selectables.isNotEmpty) {
      return Alert(
        context: context,
        alertTitle: AppConstants.doneSelecting,
        alertMessage: AppConstants.doneSelectingBody,
        style: const AlertStyle(alertHeight: 60),
        buttons: [
          AlertButton(
            key: const ValueKey('${KeyConstants.booksScreenAlertButton}cancel'),
            text: AppConstants.cancel,
            onPressed: () => Navigator.pop(context),
          ),
          AlertButton(
            key:
                const ValueKey('${KeyConstants.booksScreenAlertButton}proceed'),
            text: AppConstants.proceed,
            onPressed: () {
              Navigator.pop(context);
              controller.saveBooks();
            },
          ),
        ],
      ).show();
    } else {
      return Alert(
        context: context,
        alertTitle: AppConstants.noSelection,
        alertMessage: AppConstants.noSelectionBody,
        style: const AlertStyle(alertHeight: 40),
        buttons: [
          AlertButton(
            text: AppConstants.okay,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ).show();
    }
  }
}
