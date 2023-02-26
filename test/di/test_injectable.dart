import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:songlib/db/songlib_db.dart';
import 'package:songlib/db/todo/todo_dao_storage.dart';
import 'package:songlib/di/environments.dart';
import 'package:songlib/navigator/main_navigation.dart';
import 'package:songlib/repository/settings/settings_repository.dart';
import 'package:songlib/repository/locale/locale_repository.dart';
import 'package:songlib/repository/login/login_repository.dart';
import 'package:songlib/repository/refresh/refresh_repository.dart';
import 'package:songlib/repository/secure_storage/auth/auth_storage.dart';
import 'package:songlib/repository/secure_storage/secure_storage.dart';
import 'package:songlib/repository/shared_prefs/local/local_storage.dart';
import 'package:songlib/repository/todo/todo_repository.dart';
import 'package:songlib/styles/theme_data.dart';
import 'package:songlib/util/env/flavor_config.dart';
import 'package:songlib/util/i10n/app_localizations.dart';
import 'package:songlib/viewmodel/settings/settings_viewmodel.dart';
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
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mocks/db/todo/mock_todo_dao_storage.dart';
import '../util/test_util.dart';
import 'injectable_test.mocks.dart';

L getLocale<L>(BuildContext context) => AppLocalizations.of(context) as L; // ignore: avoid_as

T getTheme<T>(BuildContext context) => AbzTheme.of(context) as T; // ignore: avoid_as

final getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: r'initTestGetIt',
  generateForDir: ['test'],
)
Future<void> initTestInjectable() async {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  localizationLookup = getLocale;
  themeLookup = getTheme;
  await getIt.reset();
  if (!FlavorConfig.hasInstance) {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.test,
      color: Colors.purple,
      name: 'Test',
      values: values,
    );
  }
  TestWidgetsFlutterBinding.ensureInitialized();
  getIt.allowReassignment = true;
  //await initGetIt(getIt, environment: Environments.test);
  //initTestGetIt(getIt, environment: Environments.test);
  await TestUtil.loadFonts();
}

@module
abstract class RegisterModule {
  @Environment(Environments.test)
  @singleton
  SongLibDB get flutterTemplateDatabase => SongLibDB(NativeDatabase.memory());

  @Environment(Environments.test)

  @singleton
  TodoDaoStorage get getTodoDaoStoring => MockTodoDaoStorage();

  @singleton
  SettingsRepository get getSettingsRepo => MockSettingsRepository();

  @singleton
  LocaleRepository get getLocaleRepo => MockLocaleRepository();

  @singleton
  LoginRepository get getLoginRepo => MockLoginRepository();

  @singleton
  RefreshRepository get getRefreshRepo => MockRefreshRepository();

  @singleton
  SecureStorage get getSecureStoring => MockSecureStorage();

  @singleton
  AuthStorage get getAuthStoring => MockAuthStorage();

  @singleton
  SharedPreferenceStorage get getSharedPrefsStoring => MockSharedPreferenceStorage();

  @singleton
  LocalStorage get getLocalStoring => MockLocalStorage();

  @singleton
  TodoRepository get getTodoRepo => MockTodoRepository();

  @singleton
  ConnectivityHelper get getConnectivityControlling => ConnectivityHelper(connectivityProvider: () => MockConnectivity());

  @singleton
  FlutterSecureStorage get getFlutterSecureStorage => MockFlutterSecureStorage();

  @singleton
  SharedPreferences get getSharedPreferences => MockSharedPreferences();

  @singleton
  TodoService get getTodoService => MockTodoService();

  @singleton
  SettingsViewModel get getSettingsViewModel => _initVM(MockSettingsViewModel());

  @singleton
  GlobalViewModel get getGlobalViewModel => _initVM(MockGlobalViewModel());

  @singleton
  LicenseViewModel get getLicenseViewModel => _initVM(MockLicenseViewModel());

  @singleton
  LoginViewModel get getLoginViewModel => _initVM(MockLoginViewModel());

  @singleton
  SplashViewModel get getSplashViewModel => _initVM(MockSplashViewModel());

  @singleton
  TodoAddViewModel get getTodoAddViewModel => _initVM(MockTodoAddViewModel());

  @singleton
  TodoListViewModel get getTodoListViewModel => _initVM(MockTodoListViewModel());

  @singleton
  MainNavigation get getMainNavigation {
    final navigation = MockMainNavigation();
    when(navigation.showCustomDialog<void>(builder: anyNamed('builder'))).thenAnswer((realInvocation) => 1);
    return navigation;
  }

  static T _initVM<T extends ChangeNotifier>(T viewModel) {
    // ignore: void_checks
    when(viewModel.dispose()).thenReturn(1);
    // ignore: void_checks
    when(viewModel.notifyListeners()).thenReturn(1);
    return viewModel;
  }
}

extension GetItExtension on GetIt {
  MockT resolveAs<T extends Object, MockT extends T>() {
    // ignore: avoid_as
    return get<T>() as MockT;
  }
}
