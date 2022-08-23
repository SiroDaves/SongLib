import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../model/base/listed.dart';
import '../../model/base/listedext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../theme/theme_colors.dart';

@injectable
class ListVm with ChangeNotifierEx {
  late final ListNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository db;

  bool isBusy = false;
  ListVm(this.db, this.localStorage);

  Listed? listed;
  List<ListedExt>? songs = [];

  String? title, content;
  TextEditingController? titleController, contentController;

  Future<void> init(ListNavigator screenNavigator) async {
    navigator = screenNavigator;
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  Future<void> loadEditor() async {
    if (listed != null) {
      titleController!.text = listed!.title!;
      contentController!.text = listed!.description!;
    }
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();

    try {
      songs = await db.fetchListedSongs(listed!.song!);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    isBusy = false;
    notifyListeners();
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    try {
      if (titleController!.text.isNotEmpty) {
        title = titleController!.text;
        content = contentController!.text;

        validated = true;
      } else {
        validated = false;
      }
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    return validated;
  }

  Future<void> confirmCancel(BuildContext context) async {
    if (validateInput()) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Just a Minute',
            style: TextStyle(
              fontSize: 22,
              color: ThemeColors.primaryDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to close without saving your changes of the list: ${titleController!.text}?',
            style: const TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => saveChanges(),
              child: const Text("SAVE"),
            ),
            TextButton(
              onPressed: () {
                clearForm();
                Navigator.pop(context);
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
      Navigator.pop(context);
    }
  }

  /// Save changes for a listed be it a new one or simply updating an old one
  Future<bool?> saveChanges() async {
    bool? success;

    if (validateInput()) {
      isBusy = true;
      notifyListeners();

      try {
        final Listed listed = Listed(
          objectId: '',
          title: titleController!.text,
          description: contentController!.text,
        );
        await db.saveListed(listed);

        await clearForm();
        await fetchData();
      } catch (_) {}
      isBusy = false;
      notifyListeners();
    }

    return success;
  }

  /// clear data from the form
  Future<void> clearForm() async {
    try {
      titleController!.clear();
      contentController!.clear();
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  void onBackPressed() => navigator.goBack<void>();
}

abstract class ListNavigator implements BackNavigator {
  void goToHome();

  void goToSelection();
}
