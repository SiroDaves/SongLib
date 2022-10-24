import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/listedext.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../viewmodel/lists/list_view_vm.dart';
import '../../widget/general/inputs.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
import 'list_song_search.dart';

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
    implements ListViewNavigator {
  ListViewVm? vm;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<ListViewVm>(
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
            onTap: () => editListForm(context),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.edit),
            ),
          ),
          InkWell(
            onTap: () => vm!.confirmDelete(context),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: mainContainer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.primary,
        onPressed: () => vm!.showSearchWidget(true),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget mainContainer() {
    return ContextMenuOverlay(
      cardBuilder: (_, children) => Container(
        decoration: const BoxDecoration(
          color: ThemeColors.accent,
          boxShadow: [BoxShadow(blurRadius: 5)],
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(children: children),
      ),
      child: Container(
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
              : Stack(
                  children: [
                    listContainer(),
                    vm!.showSearch
                        ? ListSongSearch(
                            viewModel: vm!,
                            songs: vm!.songs,
                            height: size!.height,
                          )
                        : Container(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget listContainer() {
    return vm!.listeds!.isNotEmpty
        ? Container(
            height: size!.height * 0.8,
            padding: const EdgeInsets.only(right: 2),
            child: Scrollbar(
              thickness: 10,
              radius: const Radius.circular(20),
              child: ListView.builder(
                itemCount: vm!.listeds!.length,
                padding: EdgeInsets.all(
                  size!.height * 0.0082,
                ),
                itemBuilder: (context, index) =>
                    songItemWidget(vm!.listeds![index]),
              ),
            ),
          )
        : const NoDataToShow(
            title: AppConstants.itsEmptyHere,
            description: AppConstants.itsEmptyHereBody,
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

  Future<void> editListForm(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Update This List',
          style: TextStyle(
            fontSize: 22,
            color: ThemeColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FormInput(
                iLabel: 'Title',
                iController: vm!.titleController!,
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Description (Optional)',
                iController: vm!.contentController!,
                iOptions: const <String>[],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              vm!.saveChanges();
              vm!.titleController!.clear();
              vm!.contentController!.clear();
              Navigator.pop(context);
            },
            child: const Text("SAVE CHANGES"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("CANCEL"),
          ),
        ],
      ),
    );
  }

  @override
  void goToPresentor() => MainNavigatorWidget.of(context).goToPresentor();
}
