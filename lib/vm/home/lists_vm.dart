import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../navigator/mixin/back_navigator.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';

@injectable
class ListsVm with ChangeNotifierEx {
  late final ListsNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository db;

  ListsVm(this.db, this.localStorage);

  Future<void> init(ListsNavigator screenNavigator) async {
    navigator = screenNavigator;
  }

  void onBackPressed() => navigator.goBack<void>();
}

abstract class ListsNavigator implements BackNavigator {
  void goToHome();

  void goToSelection();
}
