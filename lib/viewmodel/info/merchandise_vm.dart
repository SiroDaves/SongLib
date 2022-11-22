import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../widget/general/toast.dart';

@injectable
class MerchandiseVm with ChangeNotifierEx {
  final LocalStorage localStorage;
  late final MerchandiseNavigator navigator;

  MerchandiseVm(this.localStorage);
  
  TextEditingController? qtyController, nameController;
  TextEditingController? phoneController, locationController, extraController;

  Future<void> init(MerchandiseNavigator screenNavigator) async {
    navigator = screenNavigator;
    localStorage.setPrefBool(PrefConstants.donationCheckKey, true);
  }

  Future<void> goToHowItWorks() async {
    navigator.goToOnboarding();
  }

  Future<void> goToPlayStore() async {
    final Uri url = Uri.parse(AppConstants.playstoreLink);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToEmail() async {
    final Uri url = Uri.parse('mailto:songlibke' '@' 'gmail.com');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToCalling() async {
    final Uri url = Uri.parse('tel:+' '254115' '586529');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToSms() async {
    final Uri url = Uri.parse('sms:+'
        '254115'
        '586529'
        '&body=Hi there, I use SongLib app. I am contacting you with regards to');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToWhatsapp() async {
    final Uri url = Uri.parse('https://wa.me/+' '254115' '586529');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToTelegram() async {
    final Uri url = Uri.parse('https://t.me/JacksiroKe');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> copyText(int type) async {
    String text1 = '', text2 = '';
    switch (type) {
      case 0:
        text1 =
            'SongLib is an easy to use app that gives you offline access to your church hymns. '
            'Install it today ${AppConstants.playstoreLink}';
        text2 = 'App link';
        break;

      case 1:
        text1 = 'songlibke' '@' 'gmail.com';
        text2 = 'Email address';
        break;

      case 2:
        text1 = '+254' '115' '586' '529';
        text2 = 'Phone number';
        break;
    }

    try {
      await Clipboard.setData(
        ClipboardData(text: text1),
      );
      showToast(
        text: '$text2 ${AppConstants.textCopied}',
        state: ToastStates.success,
      );
    } catch (_) {}
  }
}

abstract class MerchandiseNavigator {
  void goToHome();
  void goToOnboarding();
}
