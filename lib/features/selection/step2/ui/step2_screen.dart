import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/utils/app_util.dart';
import '../../../../common/widgets/progress/custom_snackbar.dart';
import '../../../../common/widgets/progress/general_progress.dart';
import '../../../../core/di/injectable.dart';
import '../../../../core/navigator/route_names.dart';
import '../bloc/step2_bloc.dart';
import 'widgets/step2_widgets.dart';

part 'step2_body.dart';

class Step2Screen extends StatefulWidget {
  const Step2Screen({super.key});

  @override
  State<Step2Screen> createState() => Step2ScreenState();
}

class Step2ScreenState extends State<Step2Screen> {
  late Step2Bloc bloc;
  String selectedBooks = "";
  List<String> bookNos = [];

  @override
  void initState() {
    super.initState();
    bloc = getIt<Step2Bloc>();
    bloc.add(const FetchSongs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Step2Body(parent: this),
      ),
    );
  }
}
