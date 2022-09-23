import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../repository/shared_prefs/local_storage.dart';

@injectable
class OnboardingVm with ChangeNotifierEx {
  final LocalStorage localStorage;

  OnboardingVm(this.localStorage);

  Future<void> init(OnboardingNavigator screenNavigator) async {
    final isLoaded = await localStorage.checkIfDataIsLoaded();
    await Future.delayed(const Duration(seconds: 3), () {});
    if (isLoaded) return screenNavigator.goToSelection();
    screenNavigator.goToHome();
  }
}

abstract class OnboardingNavigator {
  void goToUiTest();  
  void goToHome();
  void goToSelection();
}
