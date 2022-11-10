// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:drift/drift.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../db/dao/book_dao_storage.dart' as _i16;
import '../db/dao/draft_dao_storage.dart' as _i17;
import '../db/dao/history_dao_storage.dart' as _i18;
import '../db/dao/listed_dao_storage.dart' as _i19;
import '../db/dao/search_dao_storage.dart' as _i20;
import '../db/dao/song_dao_storage.dart' as _i21;
import '../db/songlib_db.dart' as _i13;
import '../repository/db_repository.dart' as _i23;
import '../repository/debug_repository.dart' as _i24;
import '../repository/locale_repository.dart' as _i26;
import '../repository/refresh_repository.dart' as _i31;
import '../repository/secure_storage/auth_storage.dart' as _i22;
import '../repository/secure_storage/secure_storage.dart' as _i11;
import '../repository/shared_prefs/local_storage.dart' as _i25;
import '../util/cache/cache_controller.dart' as _i5;
import '../util/cache/cache_controlling.dart' as _i4;
import '../util/interceptor/network_auth_interceptor.dart' as _i27;
import '../util/interceptor/network_error_interceptor.dart' as _i9;
import '../util/interceptor/network_log_interceptor.dart' as _i10;
import '../util/interceptor/network_refresh_interceptor.dart' as _i43;
import '../viewmodel/global_vm.dart' as _i36;
import '../viewmodel/home/histories_vm.dart' as _i38;
import '../viewmodel/home/home_vm.dart' as _i39;
import '../viewmodel/home/likes_vm.dart' as _i40;
import '../viewmodel/info/helpdesk_vm.dart' as _i37;
import '../viewmodel/lists/list_popup_vm.dart' as _i41;
import '../viewmodel/lists/list_view_vm.dart' as _i42;
import '../viewmodel/manage/settings_vm.dart' as _i33;
import '../viewmodel/onboarding_vm.dart' as _i28;
import '../viewmodel/selection/progress_vm.dart' as _i30;
import '../viewmodel/selection/selection_vm.dart' as _i32;
import '../viewmodel/songs/editor_vm.dart' as _i35;
import '../viewmodel/songs/presentor_vm.dart' as _i29;
import '../viewmodel/splash_vm.dart' as _i34;
import '../viewmodel/uitest_vm.dart' as _i15;
import '../webservice/book/book_web_service.dart' as _i3;
import '../webservice/song/song_web_service.dart' as _i14;
import 'injectable.dart' as _i44; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.BookWebService>(() => _i3.BookWebService());
  gh.singleton<_i4.CacheControlling>(_i5.CacheController());
  gh.singleton<_i6.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i7.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true);
  gh.lazySingleton<_i8.FlutterSecureStorage>(() => registerModule.storage());
  gh.singleton<_i9.NetworkErrorInterceptor>(
      _i9.NetworkErrorInterceptor(get<_i6.ConnectivityHelper>()));
  gh.singleton<_i10.NetworkLogInterceptor>(_i10.NetworkLogInterceptor());
  gh.lazySingleton<_i11.SecureStorage>(
      () => _i11.SecureStorage(get<_i8.FlutterSecureStorage>()));
  await gh.singletonAsync<_i12.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i13.SongLibDb>(
      () => registerModule.provideSongLibDb(get<_i7.DatabaseConnection>()));
  gh.factory<_i14.SongWebService>(() => _i14.SongWebService());
  gh.factory<_i15.UiTestVm>(() => _i15.UiTestVm());
  gh.lazySingleton<_i16.BookDaoStorage>(
      () => _i16.BookDaoStorage(get<_i13.SongLibDb>()));
  gh.lazySingleton<_i17.DraftDaoStorage>(
      () => _i17.DraftDaoStorage(get<_i13.SongLibDb>()));
  gh.lazySingleton<_i18.HistoryDaoStorage>(
      () => _i18.HistoryDaoStorage(get<_i13.SongLibDb>()));
  gh.lazySingleton<_i19.ListedDaoStorage>(
      () => _i19.ListedDaoStorage(get<_i13.SongLibDb>()));
  gh.lazySingleton<_i20.SearchDaoStorage>(
      () => _i20.SearchDaoStorage(get<_i13.SongLibDb>()));
  gh.lazySingleton<_i6.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i12.SharedPreferences>()));
  gh.lazySingleton<_i6.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i6.SharedPreferenceStorage>(), get<_i11.SecureStorage>()));
  gh.lazySingleton<_i21.SongDaoStorage>(
      () => _i21.SongDaoStorage(get<_i13.SongLibDb>()));
  gh.lazySingleton<_i22.AuthStorage>(
      () => _i22.AuthStorage(get<_i6.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i23.DbRepository>(() => _i23.DbRepository(
      get<_i16.BookDaoStorage>(),
      get<_i17.DraftDaoStorage>(),
      get<_i18.HistoryDaoStorage>(),
      get<_i19.ListedDaoStorage>(),
      get<_i20.SearchDaoStorage>(),
      get<_i21.SongDaoStorage>()));
  gh.lazySingleton<_i24.DebugRepository>(
      () => _i24.DebugRepository(get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i25.LocalStorage>(() => _i25.LocalStorage(
      get<_i22.AuthStorage>(), get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i26.LocaleRepository>(
      () => _i26.LocaleRepository(get<_i6.SharedPreferenceStorage>()));
  gh.singleton<_i27.NetworkAuthInterceptor>(
      _i27.NetworkAuthInterceptor(get<_i22.AuthStorage>()));
  gh.factory<_i28.OnboardingVm>(
      () => _i28.OnboardingVm(get<_i25.LocalStorage>()));
  gh.factory<_i29.PresentorVm>(() =>
      _i29.PresentorVm(get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i30.ProgressVm>(() => _i30.ProgressVm(get<_i14.SongWebService>(),
      get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.lazySingleton<_i31.RefreshRepository>(
      () => _i31.RefreshRepository(get<_i22.AuthStorage>()));
  gh.factory<_i32.SelectionVm>(() => _i32.SelectionVm(get<_i3.BookWebService>(),
      get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i33.SettingsVm>(() =>
      _i33.SettingsVm(get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i34.SplashVm>(() => _i34.SplashVm(get<_i25.LocalStorage>()));
  gh.factory<_i35.EditorVm>(
      () => _i35.EditorVm(get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.singleton<_i36.GlobalVm>(_i36.GlobalVm(get<_i26.LocaleRepository>(),
      get<_i24.DebugRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i37.HelpDeskVm>(() => _i37.HelpDeskVm(get<_i25.LocalStorage>()));
  gh.factory<_i38.HistoriesVm>(() =>
      _i38.HistoriesVm(get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i39.HomeVm>(
      () => _i39.HomeVm(get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i40.LikesVm>(
      () => _i40.LikesVm(get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i41.ListPopupVm>(() =>
      _i41.ListPopupVm(get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i42.ListViewVm>(() =>
      _i42.ListViewVm(get<_i23.DbRepository>(), get<_i25.LocalStorage>()));
  gh.singleton<_i43.NetworkRefreshInterceptor>(
      _i43.NetworkRefreshInterceptor(get<_i31.RefreshRepository>()));
  gh.lazySingleton<_i6.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i10.NetworkLogInterceptor>(),
          get<_i27.NetworkAuthInterceptor>(),
          get<_i9.NetworkErrorInterceptor>(),
          get<_i43.NetworkRefreshInterceptor>()));
  return get;
}

class _$RegisterModule extends _i44.RegisterModule {}
