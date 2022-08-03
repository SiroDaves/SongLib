import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/util/license.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LicenseVm with ChangeNotifierEx {
  late LicenseNavigator _navigator;

  List<License> get licenses => LicenseUtil.getLicenses();

  Future<void> init(LicenseNavigator navigator) async {
    _navigator = navigator;
  }

  void onBackClicked() => _navigator.goBack<void>();
}

abstract class LicenseNavigator with BackNavigator {}
