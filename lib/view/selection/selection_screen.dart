import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../navigator/main_navigator.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../viewmodel/selection/selection_vm.dart';
import '../../widget/action/buttons.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';

/// Song book selection screen
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
      childBuilderWithViewModel: (context, viewModel, theme, localization) {
        var topContainer = AppBar(
          title: Text(
            viewModel.isBusy
                ? AppConstants.booksTitleLoading
                : AppConstants.booksTitle,
          ),
          actions: <Widget>[
            viewModel.isBusy
                ? Container()
                : TextButton(
                    onPressed: () => areYouDoneDialog(context, viewModel),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              AppConstants.proceed,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(Icons.check),
                        ],
                      ),
                    ),
                  ),
          ],
        );

        var mainContainer = viewModel.books!.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: viewModel.books!.length,
                itemBuilder: (context, index) => BookItem(
                  book: viewModel.books![index],
                  selected: viewModel.listedBooks[index]!.isSelected,
                  onTap: () => viewModel.onBookSelected(index),
                ),
              )
            : const NoDataToShow(
                title: AppConstants.errorOccurred,
                description: AppConstants.errorOccurredBody,
              );

        return Scaffold(
          appBar: topContainer,
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const WaterDropHeader(),
            //footer: Container(),
            controller: viewModel.refreshController,
            onRefresh: viewModel.onRefresh,
            onLoading: viewModel.onLoading,
            child: viewModel.isBusy ? const CircularProgress() : mainContainer,
          ),
          floatingActionButton: viewModel.isBusy
              ? Container()
              : FloatingActionButton(
                  backgroundColor: ThemeColors.primary,
                  onPressed: () => areYouDoneDialog(context, viewModel),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
        );
      },
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
