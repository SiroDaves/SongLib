import 'package:flutter/material.dart';

abstract class MainNavigation {
  void goToSplash();

  void goToSelection();

  void goToUiTest();

  void goToHome();

  void goToSearch();

  void goBack<T>({T? result});

  void closeDialog();

  void goToLikes();

  void goToHistories();

  void goToSettings();

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T>
    implements MainNavigation {}
