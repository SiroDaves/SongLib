import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../common/utils/app_util.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../common/theme/theme_colors.dart';
import '../../common/theme/theme_fonts.dart';
import '../../common/utils/env/flavor_config.dart';
import '../../common/widgets/action/base_buttons.dart';
import '../../common/widgets/general/list_items.dart';
import '../../common/widgets/progress/general_progress.dart';
import '../../common/widgets/progress/line_progress.dart';
import '../../data/models/book.dart';
import '../../data/models/songext.dart';
import '../../navigator/route_names.dart';
import '../bloc/home_bloc.dart';

part 'home_screen_body.dart';
part 'home_screen_details.dart';
part 'mobile/search_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc();
      },
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == Status.failure) {
            CustomSnackbar.show(
              context,
              feedbackMessage(state.feedback, AppLocalizations.of(context)!),
            );
          }
        },
        child: const HomeScreenBody(),
      ),
    );
  }
}

class UpdateWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? size;

  const UpdateWidget({
    Key? key,
    this.onPressed,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.system_update,
          size: size,
          color: ThemeColors.primary,
        ),
        const Center(
          child: Text(
            'Update Found',
            style: TextStyle(
              color: ThemeColors.britamRed,
              fontSize: 29,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          'We have a new update of the app',
          textAlign: TextAlign.center,
          style: TextStyles.bodyStyleOne.size(20).textHeight(1.2),
        ).center().padding(all: 20),
        AppButton(
          label: 'Update',
          onPressed: onPressed,
          bgColor: ThemeColors.primary,
          foreColor: Colors.white,
          hoverColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ).center()
      ],
    );
  }
}
