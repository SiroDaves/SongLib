import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/listed.dart';
import '../../model/base/listedext.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/home/home_vm.dart';
import '../../vm/lists/list_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../songs/presentor_screen.dart';

class ListViewScreen extends StatefulWidget {
  static const String routeName = RouteNames.listScreen;

  final HomeVm? homeVm;
  final Listed? listed;

  const ListViewScreen({Key? key, required this.homeVm, required this.listed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ListViewScreenState(homeVm, listed);
  }
}

@visibleForTesting
class ListViewScreenState extends State<ListViewScreen>
    with BackNavigatorMixin
    implements ListNavigator {
  ListViewScreenState(this.homeVm, this.listed);
  HomeVm? homeVm;
  Listed? listed;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<ListVm>(
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

  Widget screenWidget(ListVm viewModel) {
    viewModel.listed = listed;
    viewModel.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(listed!.title!),
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
      body: mainContainer(viewModel),
    );
  }

  Widget mainContainer(ListVm viewModel) {
    return SingleChildScrollView(
      child: viewModel.isBusy
          ? const ListLoading()
          : viewModel.listeds!.isNotEmpty
              ? listContainer(viewModel)
              : const NoDataToShow(
                  title: AppConstants.itsEmptyHere,
                  description: AppConstants.itsEmptyHereBody,
                ),
    );
  }

  Widget listContainer(ListVm viewModel) {
    return Container(
      height: size!.height * 0.7,
      padding: const EdgeInsets.only(right: 2),
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        child: ListView.builder(
          itemCount: viewModel.listeds!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) => songItemWidget(
            viewModel.listeds![index],
          ),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PresentorScreen(homeVm: homeVm, song: song);
            },
          ),
        );
      },
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
