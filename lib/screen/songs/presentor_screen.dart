import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/base/listed.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/songs/presentor_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/general/toast.dart';
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
        await Clipboard.setData(ClipboardData(
          text: '${vm!.songTitle}\n${vm!.songBook}\n\n${vm!.songContent}',
        ));
        showToast(
          text: '${vm!.songTitle} ${AppConstants.songCopied}',
          state: ToastStates.success,
        );
        break;
      case 1:
        await vm!.editSong();
        break;
      case 2:
        showLists();
        break;
      case 3:
        await vm!.confirmDelete(context);
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.primary,
        onPressed: () {
          Share.share(
            '${vm!.songTitle}\n${vm!.songBook}\n\n${vm!.songContent}',
            subject: AppConstants.shareVerse,
          );
          showToast(
            text: AppConstants.readyShare,
            state: ToastStates.success,
          );
        },
        child: const Icon(Icons.share, color: Colors.white),
      ),
    );
  }

  void showLists() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: size!.height * 0.75,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(AppConstants.addSongtoList),
              actions: <Widget>[
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.clear),
                  ),
                ),
              ],
            ),
            body: Scrollbar(
              thickness: 10,
              radius: const Radius.circular(20),
              child: listContainer(),
            ),
          ),
        );
      },
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
                  child: Text(AppConstants.editSong),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text(AppConstants.addSongtoList),
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
                  child: Text(AppConstants.editSong),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text(AppConstants.addSongtoList),
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

  Widget listContainer() {
    return FutureBuilder<List<Listed>?>(
      future: vm!.fetchListedData(),
      builder: (BuildContext context, AsyncSnapshot<List<Listed>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final Listed listed = snapshot.data![index];
                return ListedItem(
                  listed: listed,
                  height: size!.height,
                  onTap: () => {},
                );
              },
            );
          } else {
            return const NoDataToShow(
              title: AppConstants.errorOccurred,
              description: AppConstants.errorOccurredBody1,
            );
          }
        } else if (snapshot.hasError) {
          return const NoDataToShow(
            title: AppConstants.errorOccurred,
            description: AppConstants.errorOccurredBody1,
          );
        } else {
          return const CircularProgress();
        }
      },
    );
  }
}
