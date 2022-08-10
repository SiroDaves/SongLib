import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreditsVm with ChangeNotifierEx {
  late final CreditsNavigator _navigator;

  CreditsVm();

  Future<void> init(CreditsNavigator navigator) async {
    _navigator = navigator;
  }

  void onBackPressed() => _navigator.goBack<void>();
}

mixin CreditsNavigator implements BackNavigator {}
