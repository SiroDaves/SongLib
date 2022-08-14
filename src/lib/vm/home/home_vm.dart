import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/song.dart';
import '../../repository/home_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../widget/general/action/buttons.dart';
import '../../widget/general/inputs.dart';

@injectable
class HomeVm with ChangeNotifierEx {
  final HomeRepository homeRepo;
  final LocalStorage localStorage;

  HomeVm(this.homeRepo, this.localStorage);

  final ScrollController listsScroller =
      ScrollController(initialScrollOffset: 0);

  final ScrollController likesScroller =
      ScrollController(initialScrollOffset: 0);

  final ScrollController songScroller =
      ScrollController(initialScrollOffset: 0);

  final ScrollController notesScroller =
      ScrollController(initialScrollOffset: 0);

  bool isBusy = false;
  String selectedBooks = "";
  int mainBook = 0;

  List<Book>? books = [];
  List<Song>? searches = [], songs = [], likes = [];

  List<Listed>? listeds = [];
  List<Draft>? drafts = [];

  String? title, content;
  TextEditingController? titleController, contentController;

  Future<void> init(HomeNavigator navigator) async {
    titleController = TextEditingController();
    contentController = TextEditingController();

    selectedBooks = localStorage.getPrefString(PrefConstants.selectedBooksKey);
    var bookNos = selectedBooks.split(",");
    mainBook = int.parse(bookNos[0]);
  }

  /// Get the songs data
  Future<void> fetchSongData() async {
    isBusy = true;
    notifyListeners();

    books = await homeRepo.fetchBooks();
    //likes = await songDao!.getLikedSongs();
    drafts = await homeRepo.fetchDrafts();
    listeds = await homeRepo.fetchListeds();
    songs = searches = await homeRepo.fetchSongs();

    songs!.removeWhere((ik) => ik.book != mainBook);

    isBusy = false;
    notifyListeners();
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    if (titleController!.text.isNotEmpty) {
      title = titleController!.text;
      content = contentController!.text;

      validated = true;
    } else {
      validated = false;
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
              onPressed: () => saveListed(context),
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

  /// Save changes for a liste be it a new one or simply updating an old one
  Future<bool?> saveListed(BuildContext context) async {
    bool? success;

    if (validateInput()) {
      isBusy = true;
      notifyListeners();

      final Listed listed = Listed(
        objectId: '',
        title: titleController!.text,
        description: contentController!.text,
      );
      await homeRepo.createListed(listed);

      await clearForm();
      await fetchSongData();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      isBusy = false;
      notifyListeners();
    }

    return success;
  }

  /// clear data from the form
  Future<void> clearForm() async {
    titleController!.clear();
    contentController!.clear();
  }

  void newListForm(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppConstants.listedTitle),
            actions: [
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.done),
                ),
                onTap: () => saveListed(context),
              ),
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.clear),
                ),
                onTap: () => confirmCancel(context),
              ),
            ],
          ),
          body: Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FormInput(
                    iLabel: 'Title',
                    iController: titleController!,
                    prefix: const Icon(Icons.text_fields),
                    iOptions: const <String>[],
                  ),
                  FormInput(
                    iLabel: 'Description (Optional)',
                    iController: contentController!,
                    prefix: const Icon(Icons.text_format),
                    iOptions: const <String>[],
                  ),
                  ElevatedButton(
                    child: const Text('Save New List'),
                    onPressed: () => saveListed(context),
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

abstract class HomeNavigator {
  void goToHome();

  void goToSelection();
}
