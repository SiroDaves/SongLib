import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../../exports.dart';

/// The controller for the Todos screen
class TodosController extends GetxController {
  final GetStorage userData = GetStorage();
  Book? book;
  bool isLoading = false;
  String? bookTitle, bookContent;
  TextEditingController? titleController, contentController;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController?.dispose();
    contentController?.dispose();
  }

  Future<void> showCurrentBook() async {
    titleController!.text = book!.title!;
    contentController!.text = book!.subtitle!;
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    if (titleController!.text.isNotEmpty) {
      bookTitle = titleController!.text;
      bookContent = contentController!.text;
      validated = true;
    } else {
      validated = false;
    }
    return validated;
  }

  /// Save changes for a book be it a new one or simply updating an old one
  Future<bool?> saveBook() async {
    bool? success;

    if (validateInput()) {
      isLoading = true;
      update();

      bool isConnected = await hasReliableInternetConnectivity();

      if (isConnected) {
        final EventObject? eventObject = await httpPost(
          client: http.Client(),
          //appending the primary key is where the difference of updating vs new book comes in
          url: book != null
              ? ApiConstants.book
              : ApiConstants.book + "/${book!.objectId}",
          data: jsonEncode(<String, String>{
            'title': bookTitle!,
            'content': bookContent!,
          }),
        );

        isLoading = false;
        update();
        try {
          // Give the user the appropriate feedback
          switch (eventObject!.id) {
            case EventConstants.requestSuccessful:
              success = true;
              showToast(
                text: book != null
                    ? "Book updated successfully"
                    : "New book saved successfully",
                state: ToastStates.success,
              );
              Get.offAll(() => HomeView());
              break;

            case EventConstants.requestInvalid:
              success = false;
              showToast(
                text: "Invalid request",
                state: ToastStates.error,
              );
              break;

            case EventConstants.requestUnsuccessful:
              success = false;
              break;

            default:
              showToast(
                text: book != null
                    ? "Updating new book was not successful"
                    : "Saving new book was not successful",
                state: ToastStates.error,
              );
              success = null;
              break;
          }
        } catch (exception) {
          success = null;
        }
      } else {
        showToast(
          text: "You don't seem to have reliable internet connection",
          state: ToastStates.error,
        );
      }
    }
    return success;
  }

  /// Remove a book from the records
  Future<bool?> deleteBook() async {
    bool? success;

    if (validateInput()) {
      isLoading = true;
      update();

      bool isConnected = await hasReliableInternetConnectivity();

      if (isConnected) {
        final EventObject? eventObject = await httpDelete(
          client: http.Client(),
          url: ApiConstants.book + "/${book!.objectId}",
        );

        isLoading = false;
        update();
        try {
          switch (eventObject!.id) {
            // Give the user the appropriate feedback
            case EventConstants.requestSuccessful:
              success = true;
              showToast(
                text: "Book deleted successfully",
                state: ToastStates.success,
              );
              Get.offAll(() => HomeView());
              break;

            case EventConstants.requestInvalid:
              success = false;
              showToast(
                text: "Invalid request",
                state: ToastStates.error,
              );
              break;

            case EventConstants.requestUnsuccessful:
              success = false;
              break;

            default:
              showToast(
                text: "Deleting book was not successful",
                state: ToastStates.error,
              );
              success = null;
              break;
          }
        } catch (exception) {
          success = null;
        }
      } else {
        showToast(
          text: "You don't seem to have reliable internet connection",
          state: ToastStates.error,
        );
      }
    }
    return success;
  }

  Future<void> confirmCancel(BuildContext context) async {
    if (validateInput()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Just a Minute',
            style: appBarTextStyle.copyWith(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to close without saving your changes of the book: ${titleController!.text}?',
            style: appBarTextStyle.copyWith(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                saveBook();
              },
              child: const Text("SAVE"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Get.back();
              },
              child: const Text("DON'T SAVE"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
          ],
        ),
      );
    } else {
      Get.back();
    }
  }

  Future<void> confirmDelete(BuildContext context) async {
    if (validateInput()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Just a Minute',
            style: appBarTextStyle.copyWith(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to delete the book: ${titleController!.text}?',
            style: appBarTextStyle.copyWith(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                deleteBook();
              },
              child: const Text("DELETE"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
          ],
        ),
      );
    } else {
      Get.back();
    }
  }
}
