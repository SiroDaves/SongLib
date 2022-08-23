import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/home/home_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../songs/presentor_screen.dart';
import 'searches/tab2_search.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = RouteNames.searchScreen;

  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

@visibleForTesting
class SearchScreenState extends State<SearchScreen> implements HomeNavigator {
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
                viewModel.searches!.isNotEmpty
                    ? Tab2Search(
                        books: viewModel.books,
                        songs: viewModel.searches,
                        height: size!.height,
                      )
                    : Container(),
                viewModel.books!.isNotEmpty
                    ? bookContainer(context, viewModel)
                    : Container(),
                viewModel.songs!.isNotEmpty
                    ? listContainer(context, viewModel)
                    : const NoDataToShow(
                        title: AppConstants.itsEmptyHere,
                        description: AppConstants.itsEmptyHereBody,
                      ),
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
            viewModel.fetchData();
          },
        ),
        itemCount: viewModel.books!.length,
      ),
    );
  }

  Widget listContainer(BuildContext context, HomeVm viewModel) {
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
          itemBuilder: (context, index) => SongItem(
            song: viewModel.songs![index],
            height: size!.height,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PresentorScreen(
                      books: viewModel.books,
                      song: viewModel.songs![index],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  
  @override
  void goToLikes() => MainNavigatorWidget.of(context).goToLikes();

  @override
  void goToHistories() => MainNavigatorWidget.of(context).goToHistories();

  @override
  void goToSettings() => MainNavigatorWidget.of(context).goToSettings();
}
