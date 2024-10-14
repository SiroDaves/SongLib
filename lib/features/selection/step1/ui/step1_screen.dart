import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/progress/general_progress.dart';
import '../../../../core/di/injectable.dart';
import '../../../../core/theme/theme_colors.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/widgets/general/list_items.dart';
import '../../../../common/widgets/progress/custom_snackbar.dart';
import '../../../../common/widgets/progress/skeleton.dart';
import '../../../../common/data/models/basic_model.dart';
import '../../../../common/data/models/book.dart';
import '../../../../core/navigator/route_names.dart';
import '../common/step1_utils.dart';
import '../bloc/step1_bloc.dart';

part 'step1_body.dart';
part 'step1_details.dart';
part 'widgets/step1_fab.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => Step1ScreenState();
}

class Step1ScreenState extends State<Step1Screen> {
  late Step1Bloc bloc;
  late AppLocalizations l10n;
  List<Book> booksSelected = [];
  List<Selectable<Book>> booksListing = [];

  @override
  void initState() {
    super.initState();
    bloc = getIt<Step1Bloc>();
    bloc.add(const FetchBooks());
  }

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;

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
            onPressed: () => Navigator.pushNamed(context, RouteNames.settings),
          )
        ],
      ),
      body: Step1Body(parent: this),
      floatingActionButton: Step1Fab(parent: this),
    );
  }
}
