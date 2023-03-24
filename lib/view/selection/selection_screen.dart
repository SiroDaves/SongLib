import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/utilities.dart';
import '../../vm/selection/selection_vm.dart';
import '../../widget/action/app_dialog.dart';
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
    var tr = AppLocalizations.of(context)!;
    size = MediaQuery.of(context).size;
    bool isTabletOrIpad = size!.shortestSide > 550;
    return ProviderWidget<SelectionVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, vm, theme, localization) {
        vm.tr = AppLocalizations.of(context)!;
        var topContainer = AppBar(
          title: Text(
            vm.isLoading ? tr.booksTitleLoading : tr.booksTitle,
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
                : vm.hasError
                    ? Container()
                    : IconTextBtn(
                        onPressed: () => areYouDoneDialog(context, vm),
                        title: tr.proceed,
                      ),
          ],
        );

        var bigScreenLayout = LayoutBuilder(
          builder: (context, dimens) {
            int axisCount = (dimens.maxWidth / 450).round();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: axisCount,
                childAspectRatio: 4,
              ),
              itemCount: vm.books!.length,
              itemBuilder: (context, index) => BookItem(
                book: vm.books![index],
                selected: vm.listedBooks[index]!.isSelected,
                onTap: () => vm.onBookSelected(index),
              ),
            );
          },
        );
        var smallScreenLayout = ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: vm.books!.length,
          itemBuilder: (context, index) => BookItem(
            book: vm.books![index],
            selected: vm.listedBooks[index]!.isSelected,
            onTap: () => vm.onBookSelected(index),
          ),
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
                          ? isDesktop || isMobile && isTabletOrIpad
                              ? bigScreenLayout
                              : smallScreenLayout
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
              : vm.hasError
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
    var tr = AppLocalizations.of(context)!;
    if (vm.selectables.isNotEmpty) {
      return appDialog(
        context,
        tr.doneSelecting,
        tr.doneSelectingBody,
        [
          TextButton(
            child: Text(tr.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(tr.proceed),
            onPressed: () {
              Navigator.pop(context);
              vm.saveBooks();
            },
          ),
        ],
      );
    } else {
      return appDialog(
        context,
        tr.noSelection,
        tr.noSelectionBody,
        [
          TextButton(
            child: Text(tr.okay),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    }
  }

  @override
  void goToProgress() => MainNavigator.of(context).goToProgress();
}
