import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../repository/shared_prefs/local_storage.dart';

@injectable
class HomeVm with ChangeNotifierEx {
  final LocalStorage localStorage;

  HomeVm(this.localStorage);

  Future<void> init(HomeNavigator navigator) async {
    final isLoaded = await localStorage.checkIfDataIsLoaded();
    await Future.delayed(const Duration(seconds: 3), () {});
    if (isLoaded) return navigator.goToSelection();
    navigator.goToHome();
  }
}

abstract class HomeNavigator {
  void goToHome();

  void goToSelection();
}
