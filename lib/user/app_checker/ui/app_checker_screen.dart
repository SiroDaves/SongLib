import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../common/theme/theme_colors.dart';
import '../../../common/theme/theme_fonts.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/env/flavor_config.dart';
import '../../../common/widgets/action/base_buttons.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../splash/splash_screen.dart';
import '../bloc/app_checker_bloc.dart';

part 'app_checker_screen_body.dart';

class AppCheckerScreen extends StatefulWidget {
  const AppCheckerScreen({super.key});

  @override
  State<AppCheckerScreen> createState() => AppCheckerScreenState();
}

class AppCheckerScreenState extends State<AppCheckerScreen> {
  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  @override
  Widget build(BuildContext context) {
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return AppCheckerBloc();
        },
        child: AppCheckerScreenBody(parent: this),
      ),
    );
  }
}
