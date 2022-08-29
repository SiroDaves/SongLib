import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/selection/selection_vm.dart';
import '../../widget/action/buttons.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';

class SelectionScreen extends StatefulWidget {
  static const String routeName = 'selection';

  const SelectionScreen({Key? key}) : super(key: key);

  @override
  SelectionScreenState createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen>
    implements SelectionNavigator {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<SelectionVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) =>
          Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(AppConstants.booksTitle),
        ),
        body: mainContainer(viewModel),
        floatingActionButton: viewModel.isBusy
            ? Container()
            : FloatingActionButton(
                backgroundColor: ThemeColors.primary,
                onPressed: () => areYouDoneDialog(context, viewModel),
                child: const Icon(Icons.check, color: Colors.white),
              ),
      ),
    );
  }

  Widget mainContainer(SelectionVm viewModel) {
    return SizedBox(
      child: viewModel.isBusy
          ? const ListLoading()
          : viewModel.books!.isNotEmpty
              ? listContainer(viewModel)
              : const NoDataToShow(
                  title: AppConstants.errorOccurred,
                  description: AppConstants.noConnectionBody,
                ),
    );
  }

  Widget listContainer(SelectionVm viewModel) {
    return Scrollbar(
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: viewModel.books!.length,
        itemBuilder: (context, index) => BookItem(
          book: viewModel.books![index],
          selected: viewModel.listedBooks[index]!.isSelected,
          onTap: () => viewModel.onBookSelected(index),
        ),
      ),
    );
  }

  Future<void> areYouDoneDialog(
      BuildContext context, SelectionVm viewModel) async {
    if (viewModel.selectables.isNotEmpty) {
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
                viewModel.saveBooks();
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
