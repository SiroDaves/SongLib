import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:songlib/navigator/main_navigation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:songlib/repository/shared_prefs/local_storage.dart';

import 'test_injectable.dart';

@GenerateMocks([
  SharedPreferenceStorage,
  LocalStorage,
  Connectivity,
  FlutterSecureStorage,
  SharedPreferences,
  Dio,
  TodoService,
  SettingsViewModel,
  GlobalViewModel,
  LicenseViewModel,
  LoginViewModel,
  SplashViewModel,
  TodoAddViewModel,
  TodoListViewModel,
], customMocks: [
  MockSpec<MainNavigation>(returnNullOnMissingStub: true),
])
void main() {
  setUp(() async => initTestInjectable());

  test('Injectable', () async {
    final loginRepo = GetIt.I<LoginRepository>();
    expect(loginRepo, isA<LoginRepository>());
  });
}
