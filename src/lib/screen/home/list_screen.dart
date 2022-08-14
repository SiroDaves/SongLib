import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_assets.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/home/lists_vm.dart';
import '../../widget/provider/provider_widget.dart';

class ListsScreen extends StatefulWidget {
  static const String routeName = RouteNames.listsScreen;

  const ListsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ListsScreenState createState() => ListsScreenState();
}

@visibleForTesting
class ListsScreenState extends State<ListsScreen> with BackNavigatorMixin implements ListsNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ListsVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                ThemeAssets.appIcon,
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                AppConstants.appTitle,
                style: TextStyle(
                  fontSize: 40,
                  color: ThemeColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
