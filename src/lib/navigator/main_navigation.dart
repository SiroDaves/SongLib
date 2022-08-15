import 'package:flutter/material.dart';

import '../model/base/song.dart';

abstract class MainNavigation {
  void goToSplash();

  void goToSelection();

  void goToHome();

  void goBack<T>({T? result});

  void closeDialog();

  void goToPresentor(Song song);

  void goToEditor(Song song);

  void goToLists();

  void goToHistory();

  void goToSettings();

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T>
    implements MainNavigation {}
