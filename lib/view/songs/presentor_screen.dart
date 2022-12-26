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
          (context, viewModel, child, theme, localization) {
        viewModel.size = size;

        Future<void> popupActions(int value) async {
          switch (value) {
            case 0:
              await viewModel.copySong();
              break;
            case 1:
              await viewModel.openSongEditor();
              break;
            case 2:
              if (viewModel.isDraft) {
                await viewModel.confirmDelete(context);
              } else {
                await showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return ListViewPopup(song: viewModel.song!);
                    });
              }
              break;
          }
        }

        var popupMenu = PopupMenuButton(
          itemBuilder: (context) {
            return viewModel.isDraft
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
                      child: Text(AppConstants.deleteSong),
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
                      child: Text(AppConstants.addtoList),
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
              Text(viewModel.songTitle),
              Text(
                viewModel.songBook,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
              onTap: viewModel.openSongEditor,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(viewModel.likeIcon),
              ),
            ),
            popupMenu,
          ],
        );

        var fabButton = FloatingActionButton(
          backgroundColor: ThemeColors.primary,
          onPressed: () {
            Share.share(
              '${viewModel.songTitle}\n${viewModel.songBook}\n\n${viewModel.songContent}',
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
              child: viewModel.isBusy
                  ? const CircularProgress()
                  : viewModel.slides,
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
