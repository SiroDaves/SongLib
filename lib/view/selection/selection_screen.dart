import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:universal_platform/universal_platform.dart';

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
      childBuilderWithViewModel: (context, vm, theme, localization) {
        var topContainer = AppBar(
          title: Text(
            vm.isLoading
                ? AppConstants.booksTitleLoading
                : AppConstants.booksTitle,
          ),
          actions: <Widget>[
            vm.isLoading
                ? Container()
                : InkWell(
                    onTap: vm.fetchBooks,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.refresh),
                    ),
                  ),
            vm.isLoading
                ? Container()
                : TextButton(
                    onPressed: () => areYouDoneDialog(context, vm),
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

        return Scaffold(
          appBar: topContainer,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  vm.isLoading
                      ? const CircularProgress()
                      : vm.books!.isNotEmpty
                          ? UniversalPlatform.isWindows
                              ? LayoutBuilder(
                                  builder: (context, dimens) {
                                    int axisCount =
                                        (dimens.maxWidth / 450).round();
                                    return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: axisCount,
                                        childAspectRatio: 4,
                                      ),
                                      itemCount: vm.books!.length,
                                      itemBuilder: (context, index) => BookItem(
                                        book: vm.books![index],
                                        selected:
                                            vm.listedBooks[index]!.isSelected,
                                        onTap: () => vm.onBookSelected(index),
                                      ),
                                    );
                                  },
                                )
                              : ListView.builder(
                                  padding: const EdgeInsets.all(5),
                                  itemCount: vm.books!.length,
                                  itemBuilder: (context, index) => BookItem(
                                    book: vm.books![index],
                                    selected: vm.listedBooks[index]!.isSelected,
                                    onTap: () => vm.onBookSelected(index),
                                  ),
                                )
                          : Container(),
                  vm.hasError
                      ? NoDataToShow(
                          title: vm.errorTitle,
                          description: vm.errorBody,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          floatingActionButton: vm.isLoading
              ? Container()
              : FloatingActionButton(
                  backgroundColor: ThemeColors.primary,
                  onPressed: () => areYouDoneDialog(context, vm),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
        );
      },
    );
  }

  Future<void> areYouDoneDialog(BuildContext context, SelectionVm vm) async {
    if (vm.selectables.isNotEmpty) {
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
                vm.saveBooks();
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
