
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/songext.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../util/constants/utilities.dart';
import '../../util/services/background_fetch.dart';
import '../../widget/action/buttons.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/toast.dart';

@injectable
class HomeVm with ChangeNotifierEx {
  late final HomeNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  HomeVm(this.dbRepo, this.localStorage);
  BuildContext? context;

  bool isBusy = false, shownDonation = false;
  String selectedBooks = "";
  List<String> bookNos = [];
  int mainBook = 0, currentPage = 1;

  List<Book>? books = [];
  List<SongExt>? filtered = [], songs = [];
  List<Listed>? listeds = [];
  List<Draft>? drafts = [];

  TextEditingController? titleController, contentController;

  Future<void> init(HomeNavigator screenNavigator) async {
    navigator = screenNavigator;
    titleController = TextEditingController();
    contentController = TextEditingController();

    selectedBooks = localStorage.getPrefString(PrefConstants.selectedBooksKey);
    shownDonation = localStorage.getPrefBool(PrefConstants.donationCheckKey);
    bookNos = selectedBooks.split(",");
    mainBook = int.parse(bookNos[0]);
    await fetchData();
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();

    listeds = await dbRepo.fetchListeds();
    books = await dbRepo.fetchBooks();
    songs = await dbRepo.fetchSongs();
    await selectSongbook(mainBook);
    drafts = await dbRepo.fetchDrafts();

    isBusy = false;
    notifyListeners();

    if (!shownDonation) {
      await donationDialog(context!);
    }
  }

  /// Get the listed data from the DB
  Future<void> fetchListedData() async {
    isBusy = true;
    notifyListeners();
    listeds = await dbRepo.fetchListeds();
    isBusy = false;
    notifyListeners();
  }

  /// Get the song data from the DB
  Future<void> fetchSearchData() async {
    isBusy = true;
    notifyListeners();
    books = await dbRepo.fetchBooks();
    songs = await dbRepo.fetchSongs();
    await selectSongbook(mainBook);
    isBusy = false;
    notifyListeners();
  }

  /// Get the notes data from the DB
  Future<void> fetchDraftsData() async {
    isBusy = true;
    notifyListeners();
    drafts = await dbRepo.fetchDrafts();
    isBusy = false;
    notifyListeners();
  }

  /// Set songbook
  Future<void> selectSongbook(int book) async {
    isBusy = true;
    notifyListeners();
    mainBook = book;

    try {
      filtered!.clear();
      for (int i = 0; i < songs!.length; i++) {
        if (songs![i].book == book) {
          filtered!.add(songs![i]);
        }
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    isBusy = false;
    notifyListeners();
  }

  /// Add a song to liked songs
  Future<void> likeSong(SongExt song) async {
    bool isLiked = song.liked!;
    isLiked = !isLiked;
    song.liked = isLiked;
    await dbRepo.editSong(song);
    if (isLiked) {
      showToast(
        text: '${song.title} ${AppConstants.songLiked}',
        state: ToastStates.success,
      );
    }
    notifyListeners();
  }

  Future<void> copySong(SongExt song) async {
    await Clipboard.setData(ClipboardData(
      text:
          '${songItemTitle(song.songNo!, song.title!)}\n${refineTitle(song.songbook!)}'
          '\n\n${song.content!.replaceAll("#", "\n")}',
    ));
    showToast(
      text: '${song.title} ${AppConstants.songCopied}',
      state: ToastStates.success,
    );
  }

  Future<void> shareSong(SongExt song) async {
    await Share.share(
      '${songItemTitle(song.songNo!, song.title!)}\n${refineTitle(song.songbook!)}'
      '\n\n${song.content!.replaceAll("#", "\n")}',
      subject: AppConstants.shareVerse,
    );
  }

  Future<void> deleteList(BuildContext context, Listed listed) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Just a Minute',
          style: TextStyle(fontSize: 18),
        ),
        content: Text(
          'Are you sure you want to delete the song list: ${listed.title}?',
          style: const TextStyle(fontSize: 14),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              dbRepo.deleteListed(listed);
              fetchListedData();
              showToast(
                text: '${listed.title} ${AppConstants.deleted}',
                state: ToastStates.success,
              );
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
  }

  /// Save changes for a listed be it a new one or simply updating an old one
  Future<void> saveNewList() async {
    if (titleController!.text.isNotEmpty) {
      isBusy = true;
      notifyListeners();
      final Listed listed = Listed(
        objectId: '',
        title: titleController!.text,
        description: contentController!.text,
      );
      await dbRepo.saveListed(listed);
      await fetchListedData();
      showToast(
        text: '${listed.title} ${AppConstants.listCreated}',
        state: ToastStates.success,
      );

      //localStorage.listed = listed;
      //navigator.goToListView();
      isBusy = false;
      notifyListeners();
    }
  }

  void openPresentor({SongExt? song, Draft? draft}) async {
    if (song != null) {
      localStorage.song = song;
      localStorage.draft = null;
    } else if (draft != null) {
      localStorage.song = null;
      localStorage.draft = draft;
    }
    navigator.goToPresentor();
  }

  void openEditor({SongExt? song, Draft? draft}) async {
    if (song != null) {
      localStorage.song = song;
      localStorage.draft = null;
    } else if (draft != null) {
      localStorage.song = null;
      localStorage.draft = draft;
    } else {
      localStorage.song = null;
      localStorage.draft = null;
    }
    navigator.goToEditor();
  }

  void openListView(Listed listed) {
    localStorage.listed = listed;
    navigator.goToListView();
  }

  Future<void> goToMerchandise() async {
    final Uri url = Uri.parse('https://forms.gle/iMq8GXjMGmUSJg949');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> donationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          AppConstants.supportSonglib,
          style: TextStyle(
            fontSize: 22,
            color: ThemeColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SizedBox(
          height: 200,
          child: Column(
            children: [
              const Text(
                AppConstants.donationRequestBody,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              CustomCard(
                title: 'Donate for the Project',
                description: 'Give Once, Weekly, Monthly or Quartely',
                onTap: () => navigator.goToDonation(),
              ),
              const SizedBox(height: 10),
              CustomCard(
                title: 'Buy our Merchandise',
                description: 'Order our branded T-Shirts (Kenya Only)',
                onTap: () => goToMerchandise(),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          SimpleButton(
            title: AppConstants.remind,
            onPressed: () => notificationDialog(context),
          ),
        ],
      ),
    );
  }

  Future<void> notificationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          AppConstants.notificationDialog,
          style: TextStyle(
            fontSize: 22,
            color: ThemeColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SizedBox(
          height: 200,
          child: Column(
            children: [
              CustomCard(
                title: 'After 5 Hours',
                onTap: () async {
                  await flutterLocalNotificationsPlugin.zonedSchedule(
                    300,
                    AppConstants.songlibReminderNotificationTitle,
                    AppConstants.songlibReminderNotificationBody5Hrs,
                    tz.TZDateTime.now(tz.local).add(
                      const Duration(minutes: 1),
                    ),
                    const NotificationDetails(
                      android: AndroidNotificationDetails(
                        AppConstants.songLibReminders,
                        AppConstants.songLibRemindersN,
                      ),
                    ),
                    androidAllowWhileIdle: true,
                    uiLocalNotificationDateInterpretation:
                        UILocalNotificationDateInterpretation.absoluteTime,
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomCard(
                title: 'After 1 day',
                onTap: () async {
                  await flutterLocalNotificationsPlugin.zonedSchedule(
                    300,
                    AppConstants.songlibReminderNotificationTitle,
                    AppConstants.songlibReminderNotificationBody1Day,
                    tz.TZDateTime.now(tz.local).add(
                      const Duration(days: 1),
                    ),
                    const NotificationDetails(
                      android: AndroidNotificationDetails(
                        AppConstants.songLibReminders,
                        AppConstants.songLibRemindersN,
                      ),
                    ),
                    androidAllowWhileIdle: true,
                    uiLocalNotificationDateInterpretation:
                        UILocalNotificationDateInterpretation.absoluteTime,
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomCard(
                title: 'After 2 days',
                onTap: () async {
                  await flutterLocalNotificationsPlugin.zonedSchedule(
                    300,
                    AppConstants.songlibReminderNotificationTitle,
                    AppConstants.songlibReminderNotificationBody2Days,
                    tz.TZDateTime.now(tz.local).add(
                      const Duration(days: 2),
                    ),
                    const NotificationDetails(
                      android: AndroidNotificationDetails(
                        AppConstants.songLibReminders,
                        AppConstants.songLibRemindersN,
                      ),
                    ),
                    androidAllowWhileIdle: true,
                    uiLocalNotificationDateInterpretation:
                        UILocalNotificationDateInterpretation.absoluteTime,
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomCard(
                title: 'After 5 days',
                onTap: () async {
                  await flutterLocalNotificationsPlugin.zonedSchedule(
                    300,
                    AppConstants.songlibReminderNotificationTitle,
                    AppConstants.songlibReminderNotificationBody5Days,
                    tz.TZDateTime.now(tz.local).add(
                      const Duration(days: 5),
                    ),
                    const NotificationDetails(
                      android: AndroidNotificationDetails(
                        AppConstants.songLibReminders,
                        AppConstants.songLibRemindersN,
                      ),
                    ),
                    androidAllowWhileIdle: true,
                    uiLocalNotificationDateInterpretation:
                        UILocalNotificationDateInterpretation.absoluteTime,
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomCard(
                title: 'After 10 days',
                onTap: () async {
                  await flutterLocalNotificationsPlugin.zonedSchedule(
                    300,
                    AppConstants.songlibReminderNotificationTitle,
                    AppConstants.songlibReminderNotificationBody10Days,
                    tz.TZDateTime.now(tz.local).add(
                      const Duration(days: 10),
                    ),
                    const NotificationDetails(
                      android: AndroidNotificationDetails(
                        AppConstants.songLibReminders,
                        AppConstants.songLibRemindersN,
                      ),
                    ),
                    androidAllowWhileIdle: true,
                    uiLocalNotificationDateInterpretation:
                        UILocalNotificationDateInterpretation.absoluteTime,
                  );
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          SimpleButton(
            title: AppConstants.remind,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

abstract class HomeNavigator {
  void goToPresentor();
  void goToEditor();
  void goToLikes();
  void goToListView();
  void goToHistories();
  void goToHelpDesk();
  void goToDonation();
  void goToMerchandise();
  void goToSettings();
}
