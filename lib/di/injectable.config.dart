// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:drift/drift.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../db/dao/book_dao_storage.dart' as _i13;
import '../db/dao/draft_dao_storage.dart' as _i14;
import '../db/dao/history_dao_storage.dart' as _i15;
import '../db/dao/listed_dao_storage.dart' as _i16;
import '../db/dao/search_dao_storage.dart' as _i17;
import '../db/dao/song_dao_storage.dart' as _i18;
import '../db/songlib_db.dart' as _i11;
import '../repository/db_repository.dart' as _i20;
import '../repository/debug_repository.dart' as _i21;
import '../repository/locale_repository.dart' as _i23;
import '../repository/refresh_repository.dart' as _i27;
import '../repository/secure_storage/auth_storage.dart' as _i19;
import '../repository/secure_storage/secure_storage.dart' as _i9;
import '../repository/shared_prefs/local_storage.dart' as _i22;
import '../util/cache/cache_controller.dart' as _i5;
import '../util/cache/cache_controlling.dart' as _i4;
import '../viewmodel/global_vm.dart' as _i32;
import '../viewmodel/home_vm.dart' as _i33;
import '../viewmodel/info_vm.dart' as _i34;
import '../viewmodel/lists/list_popup_vm.dart' as _i35;
import '../viewmodel/lists/list_view_vm.dart' as _i36;
import '../viewmodel/manage/settings_vm.dart' as _i29;
import '../viewmodel/onboarding_vm.dart' as _i24;
import '../viewmodel/selection/progress_vm.dart' as _i26;
import '../viewmodel/selection/selection_vm.dart' as _i28;
import '../viewmodel/songs/editor_vm.dart' as _i31;
import '../viewmodel/songs/presentor_vm.dart' as _i25;
import '../viewmodel/splash_vm.dart' as _i30;
import '../viewmodel/uitest_vm.dart' as _i12;
import '../webservice/app_web_service.dart' as _i3;
import 'injectable.dart' as _i37; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppWebService>(() => _i3.AppWebService());
  gh.singleton<_i4.CacheControlling>(_i5.CacheController());
  gh.singleton<_i6.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i7.DatabaseConnection>(
    () => registerModule.provideDatabaseConnection(),
    preResolve: true,
  );
  gh.lazySingleton<_i8.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i9.SecureStorage>(
      () => _i9.SecureStorage(get<_i8.FlutterSecureStorage>()));
  await gh.singletonAsync<_i10.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i11.SongLibDb>(
      () => registerModule.provideSongLibDb(get<_i7.DatabaseConnection>()));
  gh.factory<_i12.UiTestVm>(() => _i12.UiTestVm());
  gh.lazySingleton<_i13.BookDaoStorage>(
      () => _i13.BookDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i14.DraftDaoStorage>(
      () => _i14.DraftDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i15.HistoryDaoStorage>(
      () => _i15.HistoryDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i16.ListedDaoStorage>(
      () => _i16.ListedDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i17.SearchDaoStorage>(
      () => _i17.SearchDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i6.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i6.SimpleKeyValueStorage>(
      () => registerModule.keyValueStorage(
            get<_i6.SharedPreferenceStorage>(),
            get<_i9.SecureStorage>(),
          ));
  gh.lazySingleton<_i18.SongDaoStorage>(
      () => _i18.SongDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i19.AuthStorage>(
      () => _i19.AuthStorage(get<_i6.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i20.DbRepository>(() => _i20.DbRepository(
        get<_i13.BookDaoStorage>(),
        get<_i14.DraftDaoStorage>(),
        get<_i15.HistoryDaoStorage>(),
        get<_i16.ListedDaoStorage>(),
        get<_i17.SearchDaoStorage>(),
        get<_i18.SongDaoStorage>(),
      ));
  gh.lazySingleton<_i21.DebugRepository>(
      () => _i21.DebugRepository(get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i22.LocalStorage>(() => _i22.LocalStorage(
        get<_i19.AuthStorage>(),
        get<_i6.SharedPreferenceStorage>(),
      ));
  gh.lazySingleton<_i23.LocaleRepository>(
      () => _i23.LocaleRepository(get<_i6.SharedPreferenceStorage>()));
  gh.factory<_i24.OnboardingVm>(
      () => _i24.OnboardingVm(get<_i22.LocalStorage>()));
  gh.factory<_i25.PresentorVm>(() => _i25.PresentorVm(
        get<_i20.DbRepository>(),
        get<_i22.LocalStorage>(),
      ));
  gh.factory<_i26.ProgressVm>(() => _i26.ProgressVm(
        get<_i3.AppWebService>(),
        get<_i20.DbRepository>(),
        get<_i22.LocalStorage>(),
      ));
  gh.lazySingleton<_i27.RefreshRepository>(
      () => _i27.RefreshRepository(get<_i19.AuthStorage>()));
  gh.factory<_i28.SelectionVm>(() => _i28.SelectionVm(
        get<_i3.AppWebService>(),
        get<_i20.DbRepository>(),
        get<_i22.LocalStorage>(),
      ));
  gh.factory<_i29.SettingsVm>(() => _i29.SettingsVm(
        get<_i20.DbRepository>(),
        get<_i22.LocalStorage>(),
      ));
  gh.factory<_i30.SplashVm>(() => _i30.SplashVm(get<_i22.LocalStorage>()));
  gh.factory<_i31.EditorVm>(() => _i31.EditorVm(
        get<_i20.DbRepository>(),
        get<_i22.LocalStorage>(),
      ));
  gh.singleton<_i32.GlobalVm>(_i32.GlobalVm(
    get<_i23.LocaleRepository>(),
    get<_i21.DebugRepository>(),
    get<_i22.LocalStorage>(),
  ));
  gh.singleton<_i33.HomeVm>(_i33.HomeVm(
    get<_i20.DbRepository>(),
    get<_i22.LocalStorage>(),
  ));
  gh.factory<_i34.InfoVm>(() => _i34.InfoVm(get<_i22.LocalStorage>()));
  gh.factory<_i35.ListPopupVm>(() => _i35.ListPopupVm(
        get<_i20.DbRepository>(),
        get<_i22.LocalStorage>(),
      ));
  gh.factory<_i36.ListViewVm>(() => _i36.ListViewVm(
        get<_i20.DbRepository>(),
        get<_i22.LocalStorage>(),
      ));
  return get;
}

class _$RegisterModule extends _i37.RegisterModule {}
