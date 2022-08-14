import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../navigator/main_navigator.dart';
import '../../../navigator/route_names.dart';
import '../../../theme/theme_colors.dart';
import '../../../util/constants/app_constants.dart';
import '../../../vm/home/home_vm.dart';
import '../../../widget/general/list_items.dart';
import '../../../widget/general/loaders/progress.dart';
import '../../../widget/provider/provider_widget.dart';
import '../searches/tab2_search.dart';

class SearchTab extends StatefulWidget {
  static const String routeName = RouteNames.homeScreen;

  const SearchTab({Key? key}) : super(key: key);

  @override
  SearchTabState createState() => SearchTabState();
}

@visibleForTesting
class SearchTabState extends State<SearchTab> implements HomeNavigator {
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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
      ),
    );
  }

  Widget mainContainer(BuildContext context, HomeVm viewModel) {
    return SizedBox(
      child: viewModel.isBusy
          ? const ListLoading()
          : Column(
              children: [
                Tab2Search(
                  books: viewModel.books,
                  songs: viewModel.searches,
                  height: size!.height,
                ),
                bookContainer(context, viewModel),
                listContainer(context, viewModel),
              ],
            ),
    );
  }

  Widget titleContainer() {
    return SizedBox(
      height: size!.height * 0.0815,
      child: Center(
        child: Text(
          AppConstants.appTitle,
          style: TextStyle(
            fontSize: size!.height * 0.05,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
      ),
    );
  }

  Widget bookContainer(BuildContext context, HomeVm viewModel) {
    return SizedBox(
      height: size!.height * 0.0897,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) => SongBook(
          book: viewModel.books![index],
          height: size!.height,
          onTap: () {
            viewModel.mainBook = viewModel.books![index].bookNo!;
            viewModel.fetchSongData();
          },
        ),
        itemCount: viewModel.books!.length,
      ),
    );
  }

  Widget listContainer(BuildContext context, HomeVm viewModel) {
    return Container(
      height: size!.height * 0.7961,
      padding: const EdgeInsets.only(right: 2),
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(20),
        controller: viewModel.songScroller,
        child: ListView.builder(
          controller: viewModel.songScroller,
          itemCount: viewModel.songs!.length,
          padding: EdgeInsets.only(
            left: size!.height * 0.0082,
            right: size!.height * 0.0082,
          ),
          itemBuilder: (context, index) => SongItem(
            song: viewModel.songs![index],
            height: size!.height,
            onTap: () {},
          ),
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
