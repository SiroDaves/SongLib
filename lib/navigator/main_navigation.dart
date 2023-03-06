import 'package:flutter/material.dart';

abstract class MainNavigation {
  void goBack<T>({T? result});

  void goToSplash();
  void goToOnboarding();
  void goToSelection();
  void goToProgress();
  void goToHome(); 
  void goToPresentSong();
  void goToPresentSongPc();
  void goToPresentDraft();
  void goToPresentDraftPc();
  void goToEditSong();
  void goToEditSongPc();
  void goToEditDraft(bool emptyDraft);
  void goToEditDraftPc(bool emptyDraft);
  void closeDialog();
  void goToListView();
  void goToSettings();
  void goToHelpDesk();
  void goToDonation();

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T>
    implements MainNavigation {}
