import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../repository/shared_prefs/local_storage.dart';
import '../util/constants/pref_constants.dart';

@injectable
class SplashVm with ChangeNotifierEx {
  final LocalStorage localStorage;

  SplashVm(this.localStorage);

  Future<void> init(SplashNavigator navigator) async {
    final isLoaded = localStorage.getPrefBool(PrefConstants.dataLoadedCheckKey);
    final onBoarded = localStorage.getPrefBool(PrefConstants.onboardedCheckKey);
    await Future.delayed(const Duration(seconds: 3), () {});

    if (isLoaded) {
      if (onBoarded) {
        navigator.goToHome();
      } else {
        navigator.goToOnboarding();
      }
    } else {
      navigator.goToSelection();
    }
  }
}

abstract class SplashNavigator {
  void goToUiTest();
  void goToHome();
  void goToOnboarding();
  void goToSelection();
}
