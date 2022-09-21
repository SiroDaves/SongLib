import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/songs/presentor_vm.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';

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
  PresentorVm? vm;
  Size? size;

  Future<void> popupActions(int value) async {
    switch (value) {
      case 0:
        await vm!.copySong();
        break;
      case 1:
        await vm!.shareSong();
        break;
      case 2:
        await vm!.editSong();
        break;
      case 3:
        await vm!.confirmDelete(context!);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<PresentorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        vm = viewModel;
        vm!.size = size;
        vm!.context = context;
        return screenWidget(context);
      },
    );
  }

  Widget screenWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vm!.songTitle),
            Text(
              vm!.songBook,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: <Widget>[
          InkWell(
            onTap: vm!.likeSong,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(vm!.likeIcon),
            ),
          ),
          popupMenu(),
        ],
      ),
      body: mainContainer(),
    );
  }

  Widget popupMenu() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return vm!.isDraft
            ? [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(AppConstants.copySong),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text(AppConstants.shareSong),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text(AppConstants.editSong),
                ),
                const PopupMenuItem<int>(
                  value: 3,
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
                  child: Text(AppConstants.shareSong),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text(AppConstants.editSong),
                ),
              ];
      },
      onSelected: (int value) {
        popupActions(value);
      },
    );
  }

  Widget mainContainer() {
    return Container(
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
        child: vm!.isBusy ? const CircularProgress() : vm!.slides,
      ),
    );
  }
}
