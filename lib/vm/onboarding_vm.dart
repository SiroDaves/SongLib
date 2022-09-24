import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../repository/shared_prefs/local_storage.dart';
import '../util/constants/pref_constants.dart';

@injectable
class OnboardingVm with ChangeNotifierEx {
  late final OnboardingNavigator navigator;
  final LocalStorage localStorage;

  OnboardingVm(this.localStorage);
  bool onBoarded = false;

  Future<void> init(OnboardingNavigator screenNavigator) async {
    navigator = screenNavigator;
    onBoarded = localStorage.getPrefBool(PrefConstants.onboardedCheckKey);
  }

  Future<void> finishOnboarding() async {
    localStorage.setPrefBool(PrefConstants.onboardedCheckKey, true);
    navigator.goToHome();
  }
}

abstract class OnboardingNavigator {
  void goToHome();
}
