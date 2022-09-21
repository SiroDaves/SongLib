import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/listedext.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/lists/list_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';

/// Screen for viewing a song list
class ListViewScreen extends StatefulWidget {
  static const String routeName = RouteNames.listScreen;

  const ListViewScreen({Key? key}) : super(key: key);

  @override
  ListViewScreenState createState() => ListViewScreenState();
}

@visibleForTesting
class ListViewScreenState extends State<ListViewScreen>
    with BackNavigatorMixin
    implements ListNavigator {
  ListVm? vm;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<ListVm>(
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
        title: Text(vm!.listed!.title!),
        actions: <Widget>[
          InkWell(
            onTap: () => {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.edit),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: mainContainer(),
    );
  }

  Widget mainContainer() {
    return Container(
      height: size!.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, ThemeColors.accent, Colors.black],
        ),
      ),
      child: SingleChildScrollView(
        child: vm!.isBusy
            ? const ListLoading()
            : vm!.listeds!.isNotEmpty
                ? listContainer()
                : const NoDataToShow(
                    title: AppConstants.itsEmptyHere,
                    description: AppConstants.itsEmptyHereBody,
                  ),
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
          itemCount: vm!.listeds!.length,
          padding: EdgeInsets.all(
            size!.height * 0.0082,
          ),
          itemBuilder: (context, index) => songItemWidget(vm!.listeds![index]),
        ),
      ),
    );
  }

  Widget songItemWidget(ListedExt listed) {
    final SongExt song = SongExt(
      songbook: listed.songbook,
      songNo: listed.songNo,
      book: listed.book,
      title: listed.title,
      alias: listed.alias,
      content: listed.content,
      views: listed.views,
      likes: listed.likes,
      author: listed.author,
      key: listed.key,
      id: listed.songId,
    );

    return SongItem(
      song: song,
      height: size!.height,
      onTap: () => vm!.openPresentor(song: song),
    );
  }

  @override
  void goToPresentor() => MainNavigatorWidget.of(context).goToPresentor();
}
