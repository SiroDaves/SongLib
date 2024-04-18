import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../common/theme/theme_colors.dart';
import '../../../common/theme/theme_fonts.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/progress/circular_progress.dart';
import '../../../common/widgets/progress/response_feedback.dart';
import '../../../di/injectable.dart';
import '../../../navigator/route_names.dart';
import '../bloc/selecting_bloc.dart';

class SelectingScreen extends StatefulWidget {
  const SelectingScreen({super.key});

  @override
  State<SelectingScreen> createState() => SelectingScreenState();
}

class SelectingScreenState extends State<SelectingScreen> {
  late SelectingBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<SelectingBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var loginScreenBody = BlocConsumer(
      bloc: _bloc,
      listener: (context, state) {
        if (state is SelectingSuccessState) {
          CustomSnackbar.show(
            context,
            feedbackMessage(
              state.feedback.isNotEmpty
                  ? state.feedback
                  : 'Selecting was successful',
              AppLocalizations.of(context)!,
            ),
            isSuccess: true,
          );
          if (state.pinResetRequested) {
            //
          } else {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.home,
              (route) => false,
            );
          }
        }
        if (state is SelectingFailureState) {
          CustomSnackbar.show(
            context,
            feedbackMessage(
              state.feedback,
              AppLocalizations.of(context)!,
            ),
            isSuccess: true,
          );
        }
      },
      builder: (context, state) {
        if (state is SelectingProgressState) {
          return const CircularProgress();
        } else {
          return Container();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Image.asset(
                  AppAssets.appIcon,
                  height: size.width / 5,
                ),
                Text(
                  AppLocalizations.of(context)!.titleAgencyApp,
                  style: TextStyles.callOutFocus
                      .size(28)
                      .textColor(ThemeColors.britamRed)
                      .textHeight(1.5),
                ).center(),
                const SizedBox(height: 30),
                SizedBox(
                  height: constraints.maxHeight - 150,
                  child: loginScreenBody,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
