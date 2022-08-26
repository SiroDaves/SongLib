import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/historyext.dart';
import '../../model/base/songext.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/home/histories_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../songs/presentor_screen.dart';

class HistoriesScreen extends StatefulWidget {
  static const String routeName = RouteNames.historiesScreen;

  const HistoriesScreen({Key? key}) : super(key: key);

  @override
  HistoriesScreenState createState() => HistoriesScreenState();
}

@visibleForTesting
class HistoriesScreenState extends State<HistoriesScreen>
    with BackNavigatorMixin
    implements HistoriesNavigator {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<HistoriesVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization: (
        context,
        viewModel,
        child,
        theme,
        localization,
      ) =>
          screenWidget(viewModel),
    );
  }

  Widget screenWidget(HistoriesVm viewModel) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConstants.historiesTitle),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'SONGS'),
              Tab(text: 'SEARCHES'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            mainContainer(context, viewModel),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context, HistoriesVm viewModel) {
    return SizedBox(
      child: viewModel.isBusy
          ? const ListLoading()
          : viewModel.histories!.isNotEmpty
              ? listContainer(context, viewModel)
              : const NoDataToShow(
                  title: AppConstants.itsEmptyHere1,
                  description: AppConstants.itsEmptyHereBody4,
                ),
    );
  }

  Widget listContainer(BuildContext context, HistoriesVm viewModel) {
    return Container(
      height: size!.height * 0.7,
      padding: const EdgeInsets.only(right: 2),
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        child: ListView.builder(
          itemCount: viewModel.histories!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) {
            return songItemWidget(viewModel.histories![index]);
          },
        ),
      ),
    );
  }

  Widget songItemWidget(HistoryExt history) {
    final SongExt song = SongExt(
      songbook: history.songbook,
      songNo: history.songNo,
      book: history.book,
      title: history.title,
      alias: history.alias,
      content: history.content,
      views: history.views,
      likes: history.likes,
      author: history.author,
      key: history.key,
      id: history.songId,
    );

    return SongItem(
      song: song,
      height: size!.height,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PresentorScreen(song: song);
            },
          ),
        );
      },
    );
  }
}
