import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:songlib/navigator/main_navigation.dart';
import 'package:songlib/repository/debug/debug_repository.dart';
import 'package:songlib/repository/locale/locale_repository.dart';
import 'package:songlib/repository/login/login_repository.dart';
import 'package:songlib/repository/refresh/refresh_repository.dart';
import 'package:songlib/repository/secure_storage/auth/auth_storage.dart';
import 'package:songlib/repository/secure_storage/secure_storage.dart';
import 'package:songlib/repository/shared_prefs/local/local_storage.dart';
import 'package:songlib/repository/todo/todo_repository.dart';
import 'package:songlib/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:songlib/viewmodel/debug/debug_viewmodel.dart';
import 'package:songlib/viewmodel/global/global_viewmodel.dart';
import 'package:songlib/viewmodel/license/license_viewmodel.dart';
import 'package:songlib/viewmodel/login/login_viewmodel.dart';
import 'package:songlib/viewmodel/splash/splash_viewmodel.dart';
import 'package:songlib/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:songlib/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:songlib/webservice/todo/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_injectable.dart';

@GenerateMocks([
  DebugRepository,
  LocaleRepository,
  LoginRepository,
  RefreshRepository,
  SecureStorage,
  AuthStorage,
  SharedPreferenceStorage,
  LocalStorage,
  TodoRepository,
  Connectivity,
  FlutterSecureStorage,
  SharedPreferences,
  Dio,
  TodoService,
  DebugPlatformSelectorViewModel,
  DebugViewModel,
  GlobalViewModel,
  LicenseViewModel,
  LoginViewModel,
  SplashViewModel,
  TodoAddViewModel,
  TodoListViewModel,
  FirebaseAnalytics,
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
