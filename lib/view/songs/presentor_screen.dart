import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../viewmodel/songs/presentor_vm.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../lists/list_view_popup.dart';

/// Screen to present a song in slide format
class PresentorScreen extends StatefulWidget {
  static const String routeName = RouteNames.presentorScreen;
  const PresentorScreen({Key? key}) : super(key: key);

  @override
  PresentorScreenState createState() => PresentorScreenState();
}

@visibleForTesting
class PresentorScreenState extends State<PresentorScreen>
    with BackNavigatorMixin
    implements PresentorNavigator {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<PresentorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, vm, child, theme, localization) {
        vm.size = size;

        Future<void> popupActions(int value) async {
          switch (value) {
            case 0:
              await vm.copySong();
              break;
            case 1:
              vm.navigator.goToEditor();
              break;
            case 2:
              if (vm.notDraft) {
                await showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return ListViewPopup(song: vm.song!);
                    });
              } else {
                await vm.confirmDelete(context);
              }
              break;
          }
        }

        var popupMenu = PopupMenuButton(
          itemBuilder: (context) {
            return vm.notDraft
                ? [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text(AppConstants.copySong),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text(AppConstants.editSong),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text(AppConstants.addtoList),
                    ),
                  ]
                : [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text(AppConstants.copySong),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text(AppConstants.editSong),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text(AppConstants.deleteSong),
                    ),
                  ];
          },
          onSelected: (int value) {
            popupActions(value);
          },
        );

        var appBarWidget = AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(vm.songTitle),
              Text(
                vm.songBook,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
              onTap: vm.notDraft ? vm.likeSong : vm.navigator.goToEditor,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(vm.notDraft ? vm.likeIcon : Icons.edit),
              ),
            ),
            popupMenu,
          ],
        );

        var fabButton = FloatingActionButton(
          backgroundColor: ThemeColors.primary,
          onPressed: () {
            Share.share(
              '${vm.songTitle}\n${vm.songBook}\n\n${vm.songContent}',
              subject: AppConstants.shareVerse,
            );
          },
          child: const Icon(Icons.share, color: Colors.white),
        );

        return Scaffold(
          appBar: appBarWidget,
          body: Container(
            height: size!.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Colors.orange,
                  ThemeColors.accent,
                  ThemeColors.primary,
                  Colors.black,
                ],
              ),
            ),
            child: SizedBox(
              child: vm.isLoading ? const CircularProgress() : vm.slides,
            ),
          ),
          floatingActionButton: fabButton,
        );
      },
    );
  }

  @override
  void goToEditor() => MainNavigatorWidget.of(context).goToEditor();
}
