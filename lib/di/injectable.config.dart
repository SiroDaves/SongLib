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

import '../db/dao/book_dao_storage.dart' as _i12;
import '../db/dao/draft_dao_storage.dart' as _i13;
import '../db/dao/history_dao_storage.dart' as _i14;
import '../db/dao/listed_dao_storage.dart' as _i15;
import '../db/dao/search_dao_storage.dart' as _i16;
import '../db/dao/song_dao_storage.dart' as _i17;
import '../db/songlib_db.dart' as _i11;
import '../repository/db_repository.dart' as _i19;
import '../repository/debug_repository.dart' as _i20;
import '../repository/locale_repository.dart' as _i22;
import '../repository/refresh_repository.dart' as _i26;
import '../repository/secure_storage/auth_storage.dart' as _i18;
import '../repository/secure_storage/secure_storage.dart' as _i9;
import '../repository/shared_prefs/local_storage.dart' as _i21;
import '../util/cache/cache_controller.dart' as _i5;
import '../util/cache/cache_controlling.dart' as _i4;
import '../vm/global_vm.dart' as _i31;
import '../vm/home/home_vm.dart' as _i32;
import '../vm/home/info_vm.dart' as _i33;
import '../vm/home/onboarding_vm.dart' as _i23;
import '../vm/lists/list_popup_vm.dart' as _i34;
import '../vm/lists/list_view_vm.dart' as _i35;
import '../vm/manage/settings_vm.dart' as _i28;
import '../vm/selection/progress_vm.dart' as _i25;
import '../vm/selection/selection_vm.dart' as _i27;
import '../vm/songs/editor_vm.dart' as _i30;
import '../vm/songs/presentor_vm.dart' as _i24;
import '../vm/splash_vm.dart' as _i29;
import '../webservice/app_web_service.dart' as _i3;
import 'injectable.dart' as _i36; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i11.SongLibDB>(
      () => registerModule.provideSongLibDB(get<_i7.DatabaseConnection>()));
  gh.lazySingleton<_i12.BookDaoStorage>(
      () => _i12.BookDaoStorage(get<_i11.SongLibDB>()));
  gh.lazySingleton<_i13.DraftDaoStorage>(
      () => _i13.DraftDaoStorage(get<_i11.SongLibDB>()));
  gh.lazySingleton<_i14.HistoryDaoStorage>(
      () => _i14.HistoryDaoStorage(get<_i11.SongLibDB>()));
  gh.lazySingleton<_i15.ListedDaoStorage>(
      () => _i15.ListedDaoStorage(get<_i11.SongLibDB>()));
  gh.lazySingleton<_i16.SearchDaoStorage>(
      () => _i16.SearchDaoStorage(get<_i11.SongLibDB>()));
  gh.lazySingleton<_i6.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i6.SimpleKeyValueStorage>(
      () => registerModule.keyValueStorage(
            get<_i6.SharedPreferenceStorage>(),
            get<_i9.SecureStorage>(),
          ));
  gh.lazySingleton<_i17.SongDaoStorage>(
      () => _i17.SongDaoStorage(get<_i11.SongLibDB>()));
  gh.lazySingleton<_i18.AuthStorage>(
      () => _i18.AuthStorage(get<_i6.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i19.DbRepository>(() => _i19.DbRepository(
        get<_i12.BookDaoStorage>(),
        get<_i13.DraftDaoStorage>(),
        get<_i14.HistoryDaoStorage>(),
        get<_i15.ListedDaoStorage>(),
        get<_i16.SearchDaoStorage>(),
        get<_i17.SongDaoStorage>(),
      ));
  gh.lazySingleton<_i20.DebugRepository>(
      () => _i20.DebugRepository(get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i21.LocalStorage>(() => _i21.LocalStorage(
        get<_i18.AuthStorage>(),
        get<_i6.SharedPreferenceStorage>(),
      ));
  gh.lazySingleton<_i22.LocaleRepository>(
      () => _i22.LocaleRepository(get<_i6.SharedPreferenceStorage>()));
  gh.factory<_i23.OnboardingVm>(
      () => _i23.OnboardingVm(get<_i21.LocalStorage>()));
  gh.factory<_i24.PresentorVm>(() => _i24.PresentorVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i25.ProgressVm>(() => _i25.ProgressVm(
        get<_i3.AppWebService>(),
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.lazySingleton<_i26.RefreshRepository>(
      () => _i26.RefreshRepository(get<_i18.AuthStorage>()));
  gh.factory<_i27.SelectionVm>(() => _i27.SelectionVm(
        get<_i3.AppWebService>(),
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i28.SettingsVm>(() => _i28.SettingsVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i29.SplashVm>(() => _i29.SplashVm(get<_i21.LocalStorage>()));
  gh.factory<_i30.EditorVm>(() => _i30.EditorVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.singleton<_i31.GlobalVm>(_i31.GlobalVm(
    get<_i22.LocaleRepository>(),
    get<_i20.DebugRepository>(),
    get<_i21.LocalStorage>(),
  ));
  gh.singleton<_i32.HomeVm>(_i32.HomeVm(
    get<_i19.DbRepository>(),
    get<_i21.LocalStorage>(),
  ));
  gh.factory<_i33.InfoVm>(() => _i33.InfoVm(get<_i21.LocalStorage>()));
  gh.factory<_i34.ListPopupVm>(() => _i34.ListPopupVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i35.ListViewVm>(() => _i35.ListViewVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  return get;
}

class _$RegisterModule extends _i36.RegisterModule {}
