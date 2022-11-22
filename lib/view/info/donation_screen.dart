import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../viewmodel/info/donation_vm.dart';
import '../../widget/provider/provider_widget.dart';

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
          backgroundColor: ThemeColors.accent,
          appBar: AppBar(
            title: const Text(AppConstants.helpdeskTitle),
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
            leading: const Icon(Icons.settings),
            title: const Text('How it works'),
            subtitle: const Text('Revisit the onboarding screen once again'),
            onTap: () => vm!.goToHowItWorks(),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.link),
            title: const Text('This app on Google PlayStore'),
            subtitle: const Text('Go to Play Store or Long Press to copy link'),
            onTap: () => vm!.goToPlayStore(),
            onLongPress: () => vm!.copyText(0),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email Address'),
            subtitle: const Text('songlibke(at)gmail.com'),
            onTap: () => vm!.goToEmail(),
            onLongPress: () => vm!.copyText(1),
          ),
        ),
        Card(
          child: ExpansionTile(
            leading: const Icon(Icons.display_settings),
            title: const Text('Mobile Phone'),
            subtitle: const Text('Tap for more actions'),
            children: [
              ListTile(
                leading: const Icon(Icons.call),
                title: const Text('Call'),
                onTap: () => vm!.goToCalling(),
                onLongPress: () => vm!.copyText(2),
              ),
              ListTile(
                leading: const Icon(Icons.sms),
                title: const Text('SMS'),
                onTap: () => vm!.goToSms(),
              ),
              ListTile(
                leading: const Icon(Icons.whatsapp),
                title: const Text('WhatsApp'),
                onTap: () => vm!.goToWhatsapp(),
              ),
              ListTile(
                leading: const Icon(Icons.telegram),
                title: const Text('TeleGram'),
                onTap: () => vm!.goToTelegram(),
              ),
            ],
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
