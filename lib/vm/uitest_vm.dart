import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class UiTestVm with ChangeNotifierEx {
  String state = 'LOADING';
  int progress = 22;
  String time = '00:25';
  Future<void> init(UiTestNavigator navigator) async {}
}

abstract class UiTestNavigator {
  void goToHome();
}