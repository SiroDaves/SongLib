import 'package:flutter/material.dart';

abstract class MainNavigation {
  void goBack<T>({T? result});

  void goToSplash();
  void goToOnboarding();
  void goToSelection();
  void goToProgress();
  void goToHome();
  void goToEditor();  
  void goToPresentor();
  void goToProjector();
  void closeDialog();
  void goToListView();
  void goToSettings();
  void goToHelpDesk();
  void goToDonation();

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T>
    implements MainNavigation {}
