import 'package:flutter/material.dart';

abstract class MainNavigation {
  void goToSplash();

  void goToSelection();

  void goToHome();

  void goBack<T>({T? result});

  void closeDialog();

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T>
    implements MainNavigation {}
