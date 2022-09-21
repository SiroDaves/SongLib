import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/book.dart';
import '../../navigator/main_navigator.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/selection/selection_vm.dart';
import '../../widget/action/buttons.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';

class SelectionScreen extends StatefulWidget {
  static const String routeName = 'selection';

  const SelectionScreen({Key? key}) : super(key: key);

  @override
  SelectionScreenState createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen>
    implements SelectionNavigator {
  SelectionVm? viewModel;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<SelectionVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) {
        viewModel = viewModel;
        return screenWidget(context);
      },
    );
  }

  Widget screenWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.booksTitle),
      ),
      body: viewModel!.isBusy ? const CircularProgress() : mainContainer(),
      floatingActionButton: viewModel!.isBusy
          ? Container()
          : FloatingActionButton(
              backgroundColor: ThemeColors.primary,
              onPressed: () => areYouDoneDialog(context),
              child: const Icon(Icons.check, color: Colors.white),
            ),
    );
  }

  Widget mainContainer() {
    return FutureBuilder<List<Book>?>(
      future: viewModel!.fetchBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => BookItem(
                book: snapshot.data![index],
                selected: viewModel!.listedBooks[index]!.isSelected,
                onTap: () => viewModel!.onBookSelected(index),
              ),
            );
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

  Future<void> areYouDoneDialog(BuildContext context) async {
    if (viewModel!.selectables.isNotEmpty) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            AppConstants.doneSelecting,
            style: TextStyle(
              fontSize: 22,
              color: ThemeColors.primaryDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            AppConstants.doneSelectingBody,
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            SimpleButton(
              title: AppConstants.cancel,
              onPressed: () => Navigator.pop(context),
            ),
            SimpleButton(
              title: AppConstants.proceed,
              onPressed: () {
                Navigator.pop(context);
                viewModel!.saveBooks();
              },
            ),
          ],
        ),
      );
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            AppConstants.noSelection,
            style: TextStyle(
              fontSize: 22,
              color: ThemeColors.primaryDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            AppConstants.noSelectionBody,
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            SimpleButton(
              title: AppConstants.okay,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  @override
  void goToProgress() => MainNavigatorWidget.of(context).goToProgress();
}
