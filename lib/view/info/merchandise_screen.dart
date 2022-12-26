import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../viewmodel/info/merchandise_vm.dart';
import '../../widget/general/inputs.dart';
import '../../widget/provider/provider_widget.dart';

/// Merchandise screen
class MerchandiseScreen extends StatefulWidget {
  static const String routeName = RouteNames.merchandiseScreen;

  const MerchandiseScreen({
    Key? key,
  }) : super(key: key);

  @override
  MerchandiseScreenState createState() => MerchandiseScreenState();
}

@visibleForTesting
class MerchandiseScreenState extends State<MerchandiseScreen>
    with BackNavigatorMixin
    implements MerchandiseNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MerchandiseVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        return Scaffold(
          backgroundColor: ThemeColors.accent,
          appBar: AppBar(
            title: const Text(AppConstants.merchandiseTitle),
          ),
          body: ListView(
            padding: const EdgeInsets.all(5),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset('assets/images/tshirts.png'),
                ),
              ),
              const SizedBox(height: 10),
              FormInput(
                iLabel: 'Quantity',
                iController: viewModel.qtyController!,
                prefix: const Icon(Icons.numbers),
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Your Name',
                iController: viewModel.nameController!,
                prefix: const Icon(Icons.person),
                isMultiline: true,
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Phone Number',
                iController: viewModel.phoneController!,
                prefix: const Icon(Icons.phone),
                iType: TextInputType.phone,
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Location',
                iController: viewModel.locationController!,
                prefix: const Icon(Icons.text_format),
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Extra: Size & Qty',
                iController: viewModel.nameController!,
                prefix: const Icon(Icons.list),
                isMultiline: true,
                iType: TextInputType.multiline,
                iOptions: const <String>[],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToOnboarding() => MainNavigatorWidget.of(context).goToOnboarding();
}
