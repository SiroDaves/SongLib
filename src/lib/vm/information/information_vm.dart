import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/util/locale/localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class InformationVm with ChangeNotifierEx {
  late final InformationNavigator _navigator;

  InformationVm();

  Future<void> init(InformationNavigator navigator) async {
    _navigator = navigator;
  }

  void launchDiscord(Localization localization) => launchUrl(Uri.parse(localization.discordServerUrl));

  void onBackPressed() => _navigator.goBack<void>();
}

mixin InformationNavigator implements BackNavigator {}
