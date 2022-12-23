import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../widget/general/toast.dart';

@injectable
class DonationVm with ChangeNotifierEx {
  final LocalStorage localStorage;
  late final DonationNavigator navigator;

  DonationVm(this.localStorage);

  Future<void> init(DonationNavigator screenNavigator) async {
    navigator = screenNavigator;
    localStorage.setPrefBool(PrefConstants.donationCheckKey, true);
  }

  Future<void> copyNumber() async {
    try {
      await Clipboard.setData(
        const ClipboardData(text: '+254' '115' '586' '529'),
      );
      showToast(
        text: 'Phone number ${AppConstants.textCopied}',
        state: ToastStates.success,
      );
    } catch (_) {}
  }
  
  Future<void> donateViaPaypal() async {
    final Uri url = Uri.parse(AppConstants.donationPaypalLink);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> donateViaPaetron() async {
    final Uri url = Uri.parse(AppConstants.donationPatreaonLink);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

}

abstract class DonationNavigator {
  void goToHome();
  void goToOnboarding();
}
