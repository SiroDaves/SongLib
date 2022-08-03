import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../repository/shared_prefs/local/local_storage.dart';

@injectable
class SplashVm with ChangeNotifierEx {
  final LocalStorage localStorage;

  SplashVm(this.localStorage);

  Future<void> init(SplashNavigator navigator) async {
    final isLoaded = await localStorage.isDataLoaded();
    await Future.delayed(const Duration(seconds: 3), () {});
    if (isLoaded) return navigator.goToSelection();
    navigator.goToHome();
  }
}

abstract class SplashNavigator {
  void goToHome();

  void goToSelection();
}
