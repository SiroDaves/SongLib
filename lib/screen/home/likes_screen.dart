import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/home/likes_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';

/// Screen to show list of liked songs
class LikesScreen extends StatefulWidget {
  static const String routeName = RouteNames.likesScreen;
  const LikesScreen({Key? key}) : super(key: key);

  @override
  LikesScreenState createState() => LikesScreenState();
}

@visibleForTesting
class LikesScreenState extends State<LikesScreen>
    with BackNavigatorMixin
    implements LikesNavigator {
  LikesVm? vm;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<LikesVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        vm = viewModel;
        return screenWidget(context);
      },
    );
  }

  Widget screenWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.likesTitle),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, ThemeColors.accent, Colors.black],
          ),
        ),
        child: mainContainer(),
      ),
    );
  }

  Widget mainContainer() {
    return SingleChildScrollView(
      child: vm!.isBusy
          ? const ListLoading()
          : vm!.likes!.isNotEmpty
              ? listContainer()
              : const NoDataToShow(
                  title: AppConstants.itsEmptyHere,
                  description: AppConstants.itsEmptyHereBody,
                ),
    );
  }

  Widget listContainer() {
    return SizedBox(
      height: size!.height,
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        child: ListView.builder(
            itemCount: vm!.likes!.length,
            padding: EdgeInsets.all(
              size!.height * 0.0082,
            ),
            itemBuilder: (context, index) {
              final SongExt song = vm!.likes![index];
              return SongItem(
                song: song,
                height: size!.height,
                onTap: () => vm!.openPresentor(song: song),
              );
            }),
      ),
    );
  }

  @override
  void goToPresentor() => MainNavigatorWidget.of(context).goToPresentor();
}
