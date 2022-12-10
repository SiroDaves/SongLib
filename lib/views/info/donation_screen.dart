import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/app_colors.dart';
import '../../utils/constants/app_constants.dart';
import '../../view_models/info/donation_vm.dart';
import '../../widgets/provider/provider_widget.dart';

/// Help desk screen
class DonationScreen extends StatefulWidget {
  static const String routeName = RouteNames.donationScreen;

  const DonationScreen({
    Key? key,
  }) : super(key: key);

  @override
  DonationScreenState createState() => DonationScreenState();
}

@visibleForTesting
class DonationScreenState extends State<DonationScreen>
    with BackNavigatorMixin
    implements DonationNavigator {
  DonationVm? vm;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DonationVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        vm = viewModel;
        return Scaffold(
          backgroundColor: AppColors.accent,
          appBar: AppBar(
            title: const Text(AppConstants.donateTitle),
          ),
          body: mainContainer(),
        );
      },
    );
  }

  Widget mainContainer() {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.money),
            title: const Text('M-Pesa Pochi la Biashara (Kenya)'),
            subtitle: const Text('Tap to copy Number'),
            onTap: () => vm!.copyNumber(),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Via PayPal (International)'),
            subtitle: const Text('\$5, \$10, \$25 Once or Monthly'),
            onTap: () => vm!.donateViaPaypal(),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Via Patreon (International)'),
            subtitle: const Text('\$5, \$10, \$25 Monthly'),
            onTap: () => vm!.donateViaPaetron(),
          ),
        ),
      ],
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToOnboarding() => MainNavigatorWidget.of(context).goToOnboarding();
}
