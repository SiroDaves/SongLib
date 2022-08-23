import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/listed.dart';
import '../../model/base/listedext.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/lists/list_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../songs/presentor_screen.dart';

class ListScreen extends StatefulWidget {
  static const String routeName = RouteNames.listScreen;
  final Listed? listed;

  const ListScreen({
    Key? key,
    required this.listed,
  }) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

@visibleForTesting
class ListScreenState extends State<ListScreen>
    with BackNavigatorMixin
    implements ListNavigator {
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
      body: viewModel.isBusy
          ? const ListLoading()
          : viewModel.songs!.isNotEmpty
              ? listContainer(context, viewModel)
              : const NoDataToShow(
                  title: AppConstants.itsEmptyHere,
                  description: AppConstants.itsEmptyHereBody,
                ),
    );
  }

  Widget listContainer(BuildContext context, ListVm viewModel) {
    return Container(
      height: size!.height * 0.7,
      padding: const EdgeInsets.only(right: 2),
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        child: ListView.builder(
          itemCount: viewModel.songs!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) => songItemWidget(
            viewModel.songs![index],
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
              return PresentorScreen(song: song);
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
