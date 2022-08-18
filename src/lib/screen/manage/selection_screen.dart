import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/book.dart';
import '../../navigator/main_navigator.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/manage/selection_vm.dart';
import '../../widget/action/buttons.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/advanced/advanced_progress.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';
import 'selection_progress.dart';

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
          title: Text(
            viewModel.isBusy
                ? AppConstants.booksTitleLoading
                : AppConstants.booksTitle,
          ),
        ),
        body: viewModel.isBusy
            ? Stack(
                children: [
                  SelectionBackgroundProgress(
                      viewModel: viewModel, size: size!),
                  SelectionAdvancedProgress(viewModel: viewModel, size: size!),
                ],
              )
            : Container(
                color: Colors.white,
                child: mainContainer(context, viewModel),
              ),
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

  Widget mainContainer(BuildContext context, SelectionVm viewModel) {
    return FutureBuilder<List<Book>?>(
      future: viewModel.fetchBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return listContainer(viewModel);
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
        controller: viewModel.listScrollController,
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

  Widget progressWidget(SelectionVm viewModel) {
    return AdvancedProgress(
      radius: 120,
      levelAmount: 76,
      levelLowHeight: 16,
      levelHighHeight: 20,
      division: 15,
      secondaryWidth: 8,
      progressGap: 12,
      primaryValue: 0.50,
      secondaryValue: 0.75,
      primaryColor: Colors.yellow,
      secondaryColor: Colors.red,
      tertiaryColor: Colors.black12,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(
                top: 16.0,
              ),
              child: Text(
                ' 240°',
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w400,
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 16.0,
              ),
              child: Text(
                'PREHEATING',
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 3.0,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w800,
                  fontSize: 8,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    '35:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white24,
                    ),
                  ),
                  Text(
                    'Time left',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();
  
  @override
  void goToSearch() => MainNavigatorWidget.of(context).goToSearch();
}
