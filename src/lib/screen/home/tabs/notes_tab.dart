import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../navigator/main_navigator.dart';
import '../../../navigator/route_names.dart';
import '../../../theme/theme_colors.dart';
import '../../../util/constants/app_constants.dart';
import '../../../vm/home/home_vm.dart';
import '../../../widget/general/labels.dart';
import '../../../widget/general/list_items.dart';
import '../../../widget/general/loaders/progress.dart';
import '../../../widget/provider/provider_widget.dart';
import '../searches/tab3_search.dart';

class NotesTab extends StatefulWidget {
  static const String routeName = RouteNames.homeScreen;

  const NotesTab({Key? key}) : super(key: key);

  @override
  NotesTabState createState() => NotesTabState();
}

@visibleForTesting
class NotesTabState extends State<NotesTab> implements HomeNavigator {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<HomeVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) => Scaffold(
        body: Container(
          height: size!.height,
          padding: const EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, ThemeColors.accent, Colors.black],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                titleContainer(),
                mainContainer(context, viewModel),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ThemeColors.primary,
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context, HomeVm viewModel) {
    Widget dataWidget;
    if (viewModel.listeds!.isNotEmpty) {
      dataWidget = Column(
        children: [
          Tab3Search(
            drafts: viewModel.drafts,
            height: size!.height,
          ),
          listContainer(context, viewModel),
        ],
      );
    } else {
      dataWidget = const NoDataToShow(
        title: AppConstants.itsEmptyHere,
        description: AppConstants.itsEmptyHereBody2,
      );
    }

    return SizedBox(
      child: viewModel.isBusy ? const ListLoading() : dataWidget,
    );
  }

  Widget titleContainer() {
    return SizedBox(
      height: size!.height * 0.0815,
      child: Center(
        child: Text(
          AppConstants.draftTitle,
          style: TextStyle(
            fontSize: size!.height * 0.04375,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
      ),
    );
  }

  Widget listContainer(BuildContext context, HomeVm viewModel) {
    return SizedBox(
      height: size!.height * 0.78125,
      child: Scrollbar(
        thickness: 10,
        trackVisibility: true,
        thumbVisibility: true,
        radius: const Radius.circular(20),
        controller: viewModel.notesScroller,
        child: ListView.builder(
          controller: viewModel.notesScroller,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0163,
          ),
          itemBuilder: (context, index) => GestureDetector(
            child: DraftItem(
                draft: viewModel.drafts![index], height: size!.height),
            onTap: () {},
          ),
          itemCount: viewModel.drafts!.length,
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
