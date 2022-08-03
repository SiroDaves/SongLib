import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/selection/selection_vm.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/book.dart';
import '../../styles/theme_colors.dart';
import '../../styles/theme_fonts.dart';
import '../../util/app_constants.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/general/loaders/circular_progress.dart';

class SelectionScreen extends StatefulWidget {
  static const String routeName = 'selection';

  const SelectionScreen({Key? key}) : super(key: key);

  @override
  SelectionScreenState createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen>
    implements SelectionNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SelectionVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) =>
          Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            viewModel.isBusy
                ? AppConstants.booksTitleLoading
                : AppConstants.booksTitle,
            style: normalTextStyle,
          ),
        ),
        body: SizedBox(
          child: viewModel.isBusy
              ? const CircularProgress()
              : mainContainer(context, viewModel),
        ),
        floatingActionButton: viewModel.isBusy
            ? Container()
            : FloatingActionButton(
                backgroundColor: ThemeColors.primary,
                onPressed: () => areYouDoneDialog(context),
                child: const Icon(Icons.check, color: Colors.white),
              ),
      ),
    );
  }

  Widget mainContainer(BuildContext context, SelectionVm viewModel) {
    return FutureBuilder<List<Book>?>(
      future: viewModel.fetchBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return listContainer(snapshot.data!, viewModel);
          } else {
            return const NoDataToShow(
              title: AppConstants.errorOccurred,
              description: AppConstants.errorOccurredBody,
            );
          }
        } else if (snapshot.hasError) {
          return const NoDataToShow(
            title: AppConstants.errorOccurred,
            description: AppConstants.noConnectionBody,
          );
        } else {
          return const CircularProgress();
        }
      },
    );
  }

  Widget listContainer(List<Book>? books, SelectionVm viewModel) {
    return Scrollbar(
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) => BookItem(
          book: books![index],
          selected: viewModel.listedBooks[index]!.isSelected,
          onTap: () => viewModel.onBookSelected(index),
        ),
        itemCount: books!.length,
        controller: viewModel.listScrollController,
      ),
    );
  }

  Future<void> areYouDoneDialog(BuildContext context) async {}
  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();
}
