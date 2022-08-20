import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';

@injectable
class HistoryVm with ChangeNotifierEx {
  late final HistoryNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository db;

  HistoryVm(this.db, this.localStorage);

  Future<void> init(HistoryNavigator screenNavigator) async {
    navigator = screenNavigator;
  }

  void onBackPressed() => navigator.goBack<void>();
}

abstract class HistoryNavigator implements BackNavigator {
  void goToHome();

  void goToSelection();
}
