import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/utilities.dart';
import '../../vm/home/info_vm.dart';
import '../../widget/provider/provider_widget.dart';

/// Help desk screen
class HelpDeskScreen extends StatefulWidget {
  static const String routeName = RouteNames.helpdeskScreen;

  const HelpDeskScreen({
    Key? key,
  }) : super(key: key);

  @override
  HelpDeskScreenState createState() => HelpDeskScreenState();
}

@visibleForTesting
class HelpDeskScreenState extends State<HelpDeskScreen>
    with BackNavigatorMixin
    implements InfoNavigator {
  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    return ProviderWidget<InfoVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        //vm.tr = AppLocalizations.of(context)!;
        Card merchandise = Card(
          child: ExpansionTile(
            // Display more ways to support the project
            leading: const Icon(Icons.display_settings),
            title: const Text('Support SongLib'),
            subtitle: const Text('Tap for more actions'),
            children: [
              // Display context menu to donate towards the project
              ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Donate for the Project'),
                subtitle: const Text('Give Once, Weekly, Monthly or Quartely'),
                onTap: () => goToDonation(),
              ),
              // Display context menu to buy merchandise
              ListTile(
                leading: const Icon(Icons.shopping_basket),
                title: const Text('Buy our Merchandise'),
                subtitle: const Text('Order our branded T-Shirts (Kenya Only)'),
                onTap: () => viewModel.goToMerchandise(),
              ),
            ],
          ),
        );
        // Display context menu to call, sms, whatsapp or telegram
        Card telegram = Card(
          child: ExpansionTile(
            leading: const Icon(Icons.display_settings),
            title: const Text('Mobile Phone'),
            subtitle: const Text('Tap for more actions'),
            children: [
              // Open phone dialer and paste the number
              ListTile(
                leading: const Icon(Icons.call),
                title: const Text('Call'),
                onTap: () => viewModel.goToCalling(),
                onLongPress: () => viewModel.copyText(2),
              ),
              // Open sms 
              ListTile(
                leading: const Icon(Icons.sms),
                title: const Text('SMS'),
                onTap: () => viewModel.goToSms(),
              ),
              // Open whatsapp
              ListTile(
                leading:
                    const Icon(IconData(0xf05a6, fontFamily: 'MaterialIcons')),
                title: const Text('WhatsApp'),
                onTap: () => viewModel.goToWhatsapp(),
              ),
              // Open telegram
              ListTile(
                leading: const Icon(Icons.telegram),
                title: const Text('TeleGram'),
                onTap: () => viewModel.goToTelegram(),
              ),
            ],
          ),
        );
        var mainView = ListView(
          padding: const EdgeInsets.all(5),
          children: [
            merchandise,
            // Reopen the onboarding screen
            Card(
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('How it works'),
                subtitle:
                    const Text('Revisit the onboarding screen once again'),
                onTap: () => viewModel.goToHowItWorks(),
              ),
            ),
            // Redirect to playstore
            Card(
              child: ListTile(
                leading: const Icon(Icons.link),
                title: const Text('This app on Google PlayStore'),
                subtitle:
                    const Text('Go to Play Store or Long Press to copy link'),
                onTap: () => viewModel.goToPlayStore(),
                onLongPress: () => viewModel.copyText(0),
              ),
            ),
            // Redirect to email
            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email Address'),
                subtitle: const Text('songlibke(at)gmail[.]com'),
                onTap: () => viewModel.goToEmail(),
                onLongPress: () => viewModel.copyText(1),
              ),
            ),
            telegram,
          ],
        );
        return isDesktop
            ? Scaffold(
                backgroundColor: ThemeColors.backgroundGrey,
                body: mainView,
              )
            : Scaffold(
                backgroundColor: ThemeColors.backgroundGrey,
                appBar: AppBar(
                  title: Text(tr.helpdeskTitle),
                ),
                body: mainView,
              );
      },
    );
  }

  // Navigates to Home screen
  @override
  void goToHome() => MainNavigator.of(context).goToHome();

  // Navigates to Donation screen
  @override
  void goToDonation() => MainNavigator.of(context).goToDonation();

  // Navigates to Onboarding screen
  @override
  void goToOnboarding() => MainNavigator.of(context).goToOnboarding();
}
