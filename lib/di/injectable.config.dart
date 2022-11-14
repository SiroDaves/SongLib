// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:drift/drift.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../db/dao/book_dao_storage.dart' as _i17;
import '../db/dao/draft_dao_storage.dart' as _i18;
import '../db/dao/history_dao_storage.dart' as _i19;
import '../db/dao/listed_dao_storage.dart' as _i20;
import '../db/dao/search_dao_storage.dart' as _i21;
import '../db/dao/song_dao_storage.dart' as _i22;
import '../db/songlib_db.dart' as _i14;
import '../repository/db_repository.dart' as _i24;
import '../repository/debug_repository.dart' as _i25;
import '../repository/locale_repository.dart' as _i27;
import '../repository/refresh_repository.dart' as _i32;
import '../repository/secure_storage/auth_storage.dart' as _i23;
import '../repository/secure_storage/secure_storage.dart' as _i12;
import '../repository/shared_prefs/local_storage.dart' as _i26;
import '../util/cache/cache_controller.dart' as _i5;
import '../util/cache/cache_controlling.dart' as _i4;
import '../util/interceptor/network_auth_interceptor.dart' as _i28;
import '../util/interceptor/network_error_interceptor.dart' as _i10;
import '../util/interceptor/network_log_interceptor.dart' as _i11;
import '../util/interceptor/network_refresh_interceptor.dart' as _i44;
import '../viewmodel/global_vm.dart' as _i37;
import '../viewmodel/home/histories_vm.dart' as _i39;
import '../viewmodel/home/home_vm.dart' as _i40;
import '../viewmodel/home/likes_vm.dart' as _i41;
import '../viewmodel/info/helpdesk_vm.dart' as _i38;
import '../viewmodel/lists/list_popup_vm.dart' as _i42;
import '../viewmodel/lists/list_view_vm.dart' as _i43;
import '../viewmodel/manage/settings_vm.dart' as _i34;
import '../viewmodel/onboarding_vm.dart' as _i29;
import '../viewmodel/selection/progress_vm.dart' as _i31;
import '../viewmodel/selection/selection_vm.dart' as _i33;
import '../viewmodel/songs/editor_vm.dart' as _i36;
import '../viewmodel/songs/presentor_vm.dart' as _i30;
import '../viewmodel/splash_vm.dart' as _i35;
import '../viewmodel/uitest_vm.dart' as _i16;
import '../webservice/book/book_web_service.dart' as _i3;
import '../webservice/edit/edit_web_service.dart' as _i8;
import '../webservice/song/song_web_service.dart' as _i15;
import 'injectable.dart' as _i45; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.EditWebService>(() => _i8.EditWebService());
  gh.lazySingleton<_i9.FlutterSecureStorage>(() => registerModule.storage());
  gh.singleton<_i10.NetworkErrorInterceptor>(
      _i10.NetworkErrorInterceptor(get<_i6.ConnectivityHelper>()));
  gh.singleton<_i11.NetworkLogInterceptor>(_i11.NetworkLogInterceptor());
  gh.lazySingleton<_i12.SecureStorage>(
      () => _i12.SecureStorage(get<_i9.FlutterSecureStorage>()));
  await gh.singletonAsync<_i13.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i14.SongLibDb>(
      () => registerModule.provideSongLibDb(get<_i7.DatabaseConnection>()));
  gh.factory<_i15.SongWebService>(() => _i15.SongWebService());
  gh.factory<_i16.UiTestVm>(() => _i16.UiTestVm());
  gh.lazySingleton<_i17.BookDaoStorage>(
      () => _i17.BookDaoStorage(get<_i14.SongLibDb>()));
  gh.lazySingleton<_i18.DraftDaoStorage>(
      () => _i18.DraftDaoStorage(get<_i14.SongLibDb>()));
  gh.lazySingleton<_i19.HistoryDaoStorage>(
      () => _i19.HistoryDaoStorage(get<_i14.SongLibDb>()));
  gh.lazySingleton<_i20.ListedDaoStorage>(
      () => _i20.ListedDaoStorage(get<_i14.SongLibDb>()));
  gh.lazySingleton<_i21.SearchDaoStorage>(
      () => _i21.SearchDaoStorage(get<_i14.SongLibDb>()));
  gh.lazySingleton<_i6.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i6.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i6.SharedPreferenceStorage>(), get<_i12.SecureStorage>()));
  gh.lazySingleton<_i22.SongDaoStorage>(
      () => _i22.SongDaoStorage(get<_i14.SongLibDb>()));
  gh.lazySingleton<_i23.AuthStorage>(
      () => _i23.AuthStorage(get<_i6.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i24.DbRepository>(() => _i24.DbRepository(
      get<_i17.BookDaoStorage>(),
      get<_i18.DraftDaoStorage>(),
      get<_i19.HistoryDaoStorage>(),
      get<_i20.ListedDaoStorage>(),
      get<_i21.SearchDaoStorage>(),
      get<_i22.SongDaoStorage>()));
  gh.lazySingleton<_i25.DebugRepository>(
      () => _i25.DebugRepository(get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i26.LocalStorage>(() => _i26.LocalStorage(
      get<_i23.AuthStorage>(), get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i27.LocaleRepository>(
      () => _i27.LocaleRepository(get<_i6.SharedPreferenceStorage>()));
  gh.singleton<_i28.NetworkAuthInterceptor>(
      _i28.NetworkAuthInterceptor(get<_i23.AuthStorage>()));
  gh.factory<_i29.OnboardingVm>(
      () => _i29.OnboardingVm(get<_i26.LocalStorage>()));
  gh.factory<_i30.PresentorVm>(() =>
      _i30.PresentorVm(get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.factory<_i31.ProgressVm>(() => _i31.ProgressVm(get<_i15.SongWebService>(),
      get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.lazySingleton<_i32.RefreshRepository>(
      () => _i32.RefreshRepository(get<_i23.AuthStorage>()));
  gh.factory<_i33.SelectionVm>(() => _i33.SelectionVm(get<_i3.BookWebService>(),
      get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.factory<_i34.SettingsVm>(() =>
      _i34.SettingsVm(get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.factory<_i35.SplashVm>(() => _i35.SplashVm(get<_i26.LocalStorage>()));
  gh.factory<_i36.EditorVm>(
      () => _i36.EditorVm(get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.singleton<_i37.GlobalVm>(_i37.GlobalVm(get<_i27.LocaleRepository>(),
      get<_i25.DebugRepository>(), get<_i26.LocalStorage>()));
  gh.factory<_i38.HelpDeskVm>(() => _i38.HelpDeskVm(get<_i26.LocalStorage>()));
  gh.factory<_i39.HistoriesVm>(() =>
      _i39.HistoriesVm(get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.factory<_i40.HomeVm>(
      () => _i40.HomeVm(get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.factory<_i41.LikesVm>(
      () => _i41.LikesVm(get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.factory<_i42.ListPopupVm>(() =>
      _i42.ListPopupVm(get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.factory<_i43.ListViewVm>(() =>
      _i43.ListViewVm(get<_i24.DbRepository>(), get<_i26.LocalStorage>()));
  gh.singleton<_i44.NetworkRefreshInterceptor>(
      _i44.NetworkRefreshInterceptor(get<_i32.RefreshRepository>()));
  gh.lazySingleton<_i6.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i11.NetworkLogInterceptor>(),
          get<_i28.NetworkAuthInterceptor>(),
          get<_i10.NetworkErrorInterceptor>(),
          get<_i44.NetworkRefreshInterceptor>()));
  return get;
}

class _$RegisterModule extends _i45.RegisterModule {}
