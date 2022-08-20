import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/draft.dart';
import '../../model/base/song.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';

@injectable
class EditorVm with ChangeNotifierEx {
  late final EditorNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository db;

  EditorVm(this.db, this.localStorage);
  Song? song;
  Draft? draft;

  bool isBusy = false;
  String? title, content, alias, key;
  TextEditingController? titleController, contentController;
  TextEditingController? aliasController, keyController;

  Future<void> init(EditorNavigator screenNavigator) async {
    navigator = screenNavigator;
    titleController = TextEditingController();
    contentController = TextEditingController();
    aliasController = TextEditingController();
    keyController = TextEditingController();
  }

  Future<void> showCurrentSong() async {
    titleController!.text = song!.title!;
    titleController!.text = song!.title!;
    aliasController!.text = song!.alias!;
    keyController!.text = song!.key!;
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    if (titleController!.text.isNotEmpty) {
      title = titleController!.text;
      content = contentController!.text;
      alias = aliasController!.text;
      key = keyController!.text;

      validated = true;
    } else {
      validated = false;
    }
    return validated;
  }

  /// Save changes for a song be it a new one or simply updating an old one
  Future<bool?> saveSong() async {
    bool? success;

    if (validateInput()) {
      isBusy = true;
      notifyListeners();

      if (song != null) {
        song!.title = titleController!.text;
        song!.content = contentController!.text;
        song!.alias = aliasController!.text;
        song!.key = keyController!.text;
        await db.editSong(song!);
      } else {
        draft = Draft(
          title: titleController!.text,
          content: contentController!.text,
          alias: aliasController!.text,
          key: keyController!.text,
        );
        await db.saveDraft(draft!);
      }

      isBusy = false;
      notifyListeners();
    }

    return success;
  }

  /// Remove a song from the records
  Future<bool?> deleteSong() async {
    bool? success;

    if (validateInput()) {
      isBusy = true;
      notifyListeners();

      await db.saveDraft(draft!);

      isBusy = true;
      notifyListeners();
    }
    return success;
  }

  Future<void> confirmCancel(BuildContext context) async {
    if (validateInput()) {
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text(
            'Just a Minute',
            style: TextStyle(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to close without saving your changes of the song: ${titleController!.text}?',
            style: const TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                saveSong();
              },
              child: const Text("SAVE"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onBackPressed();
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
      onBackPressed();
    }
  }

  Future<void> confirmDelete(BuildContext context) async {
    if (validateInput()) {
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text(
            'Just a Minute',
            style: TextStyle(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to delete the song: ${titleController!.text}?',
            style: const TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                deleteSong();
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
      onBackPressed();
    }
  }

  void onBackPressed() => navigator.goBack<void>();
}

abstract class EditorNavigator implements BackNavigator {
  void goToHome();

  void goToSelection();
}
