import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:songlib/theme/theme_colors.dart';

import '../../model/base/listed.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../util/constants/app_constants.dart';
import '../../viewmodel/lists/list_popup_vm.dart';
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
        vm = viewModel;
        return screenWidget(context);
      },
    );
  }

  Widget screenWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.accent,
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
      body: mainContainer(),
    );
  }

  Widget mainContainer() {
    return Scrollbar(
      thickness: 10,
      radius: const Radius.circular(20),
      child: FutureBuilder<List<Listed>?>(
        future: vm!.fetchListedData(),
        builder: (BuildContext context, AsyncSnapshot<List<Listed>?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return listContainer(snapshot.data!);
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
  }

  Widget listContainer(List<Listed> listeds) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: listeds.length,
      itemBuilder: (context, index) {
        final Listed listed = listeds[index];
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
  }

  @override
  void goToPresentor() => MainNavigatorWidget.of(context).goToPresentor();
}
