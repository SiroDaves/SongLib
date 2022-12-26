import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/listed.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../viewmodel/lists/list_popup_vm.dart';
import '../../widget/general/inputs.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';

/// Popup for selecting a song list on which to add a song to
class ListViewPopup extends StatefulWidget {
  static const String routeName = RouteNames.listScreen;
  final SongExt song;
  const ListViewPopup({Key? key, required this.song}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ListViewPopupState(song);
  }
}

@visibleForTesting
class ListViewPopupState extends State<ListViewPopup>
    with BackNavigatorMixin
    implements ListPopupNavigator {
  ListViewPopupState(this.song);
  SongExt? song;
  ListPopupVm? vm;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<ListPopupVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        var mainContainer = Scrollbar(
          thickness: 10,
          radius: const Radius.circular(20),
          child: FutureBuilder<List<Listed>?>(
            future: vm!.fetchListedData(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Listed>?> snapshot) {
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
                        onTap: () {
                          vm!.addSongToList(listed, song!);
                          Navigator.pop(context);
                        },
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
          ),
        );

        return Scaffold(
          backgroundColor: ThemeColors.accent,
          appBar: AppBar(
            title: const Text(AppConstants.addSongtoList),
            actions: <Widget>[
              InkWell(
                onTap: () => newListForm(context),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.add),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.clear),
                ),
              ),
            ],
          ),
          body: mainContainer,
        );
      },
    );
  }

  Future<void> newListForm(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Draft a New List',
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
              vm!.saveNewList();
              vm!.titleController!.clear();
              vm!.contentController!.clear();
              Navigator.pop(context);
            },
            child: const Text("SAVE LIST"),
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
