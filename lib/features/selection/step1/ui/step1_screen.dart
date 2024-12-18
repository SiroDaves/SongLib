import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

import '../../../../common/widgets/progress/general_progress.dart';
import '../../../../core/theme/theme_colors.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/widgets/general/list_items.dart';
import '../../../../common/widgets/progress/custom_snackbar.dart';
import '../../../../common/widgets/progress/skeleton.dart';
import '../../../../common/data/models/basic_model.dart';
import '../../../../common/data/models/book.dart';
import '../../../../core/navigator/route_names.dart';
import '../bloc/step1_bloc.dart';

part 'widgets/step1_fab.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => Step1ScreenState();
}

class Step1ScreenState extends State<Step1Screen> {
  List<Book> booksSelected = [];
  List<Selectable<Book>> booksListing = [];

  void onBookSelected(int index, List<Selectable<Book>> listing) {
    try {
      setState(() {
        final book = listing[index];
        book.isSelected = !book.isSelected;

        if (book.isSelected) {
          booksSelected.add(book.data);
        } else {
          booksSelected.remove(book.data);
        }
      });
    } catch (e) {
      logger('Unable to update selection: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final isTabletOrIpad = size.shortestSide > 550;

    return BlocProvider(
      create: (context) => Step1Bloc()..add(FetchBooks()),
      child: BlocConsumer<Step1Bloc, Step1State>(
        listener: (context, state) {
          if (state is Step1SavedState) {
            Navigator.pushNamed(context, RouteNames.step2Selection);
          }
          if (state is Step1FailureState) {
            CustomSnackbar.show(
              context,
              feedbackMessage(state.feedback, l10n),
            );
          }
          if (state is Step1FetchedState) {
            booksListing = state.booksListing;
            CustomSnackbar.show(
              context,
              'Here are the available books, please select as many as you like to proceed',
              isSuccess: true,
            );
          }
        },
        builder: (context, state) {
          var bloc = context.read<Step1Bloc>();
          Widget bodyWidget = EmptyState(
            title: 'Sorry nothing to show here at the moment.',
            showRetry: true,
            onRetry: () => bloc.add(const FetchBooks()),
          );

          if (state is Step1ProgressState) {
            bodyWidget = const SelectionLoading();
          } else if (state is Step1FetchedState) {
            var booksGridview = LayoutBuilder(
              builder: (context, dimens) {
                final axisCount = (dimens.maxWidth / 450).round();
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: axisCount,
                    childAspectRatio: 4,
                  ),
                  itemCount: booksListing.length,
                  itemBuilder: (context, index) => BookItem(
                    item: booksListing[index],
                    onPressed: () => onBookSelected(index, booksListing),
                  ),
                );
              },
            );
            var booksListview = ListView.builder(
              itemCount: booksListing.length,
              itemBuilder: (context, index) => BookItem(
                item: booksListing[index],
                onPressed: () => onBookSelected(index, booksListing),
              ),
            );
            bodyWidget = isTabletOrIpad ? booksGridview : booksListview;
          } else if (state is Step1FailureState) {
            bodyWidget = EmptyState(
              title: 'Sorry nothing to show here at the moment.',
              showRetry: true,
              onRetry: () => bloc.add(const FetchBooks()),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(l10n.booksTitle),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => bloc.add(const FetchBooks()),
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () =>
                      Navigator.pushNamed(context, RouteNames.settings),
                )
              ],
            ),
            body: bodyWidget,
            floatingActionButton: Step1Fab(parent: this),
          );
        },
      ),
    );
  }
}
