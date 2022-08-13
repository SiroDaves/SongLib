// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i34;
import 'package:drift/drift.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../db/dao/book_dao_storage.dart' as _i13;
import '../db/dao/draft_dao_storage.dart' as _i14;
import '../db/dao/history_dao_storage.dart' as _i15;
import '../db/dao/listed_dao_storage.dart' as _i16;
import '../db/dao/search_dao_storage.dart' as _i17;
import '../db/dao/song_dao_storage.dart' as _i18;
import '../db/songlib_db.dart' as _i12;
import '../repository/book_repository.dart' as _i41;
import '../repository/debug_repository.dart' as _i20;
import '../repository/locale_repository.dart' as _i22;
import '../repository/refresh_repository.dart' as _i24;
import '../repository/secure_storage/auth_storage.dart' as _i19;
import '../repository/secure_storage/secure_storage.dart' as _i10;
import '../repository/selection_repository.dart' as _i39;
import '../repository/shared_prefs/local_storage.dart' as _i21;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i23;
import '../util/interceptor/network_error_interceptor.dart' as _i8;
import '../util/interceptor/network_log_interceptor.dart' as _i9;
import '../util/interceptor/network_refresh_interceptor.dart' as _i33;
import '../vm/global_vm.dart' as _i29;
import '../vm/home/history_vm.dart' as _i30;
import '../vm/home/home_vm.dart' as _i31;
import '../vm/home/lists_vm.dart' as _i32;
import '../vm/manage/selection_vm.dart' as _i40;
import '../vm/manage/settings_vm.dart' as _i25;
import '../vm/songs/editor_vm.dart' as _i28;
import '../vm/songs/viewer_vm.dart' as _i27;
import '../vm/splash_vm.dart' as _i26;
import '../webservice/book/book_service.dart' as _i37;
import '../webservice/book/book_webservice.dart' as _i38;
import '../webservice/song/song_service.dart' as _i35;
import '../webservice/song/song_webservice.dart' as _i36;
import 'injectable.dart' as _i42;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.CacheControlling>(_i4.CacheController());
  gh.singleton<_i5.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i6.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true);
  gh.lazySingleton<_i7.FlutterSecureStorage>(() => registerModule.storage());
  gh.singleton<_i8.NetworkErrorInterceptor>(
      _i8.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i9.NetworkLogInterceptor>(_i9.NetworkLogInterceptor());
  gh.lazySingleton<_i10.SecureStorage>(
      () => _i10.SecureStorage(get<_i7.FlutterSecureStorage>()));
  await gh.singletonAsync<_i11.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i12.SongLibDb>(
      () => registerModule.provideSongLibDb(get<_i6.DatabaseConnection>()));
  gh.lazySingleton<_i13.BookDaoStorage>(
      () => _i13.BookDaoStorage(get<_i12.SongLibDb>()));
  gh.lazySingleton<_i14.DraftDaoStorage>(
      () => _i14.DraftDaoStorage(get<_i12.SongLibDb>()));
  gh.lazySingleton<_i15.HistoryDaoStorage>(
      () => _i15.HistoryDaoStorage(get<_i12.SongLibDb>()));
  gh.lazySingleton<_i16.ListedDaoStorage>(
      () => _i16.ListedDaoStorage(get<_i12.SongLibDb>()));
  gh.lazySingleton<_i17.SearchDaoStorage>(
      () => _i17.SearchDaoStorage(get<_i12.SongLibDb>()));
  gh.lazySingleton<_i5.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i5.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i5.SharedPreferenceStorage>(), get<_i10.SecureStorage>()));
  gh.lazySingleton<_i18.SongDaoStorage>(
      () => _i18.SongDaoStorage(get<_i12.SongLibDb>()));
  gh.lazySingleton<_i19.AuthStorage>(
      () => _i19.AuthStorage(get<_i5.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i20.DebugRepository>(
      () => _i20.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i21.LocalStorage>(() => _i21.LocalStorage(
      get<_i19.AuthStorage>(), get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i22.LocaleRepository>(
      () => _i22.LocaleRepository(get<_i5.SharedPreferenceStorage>()));
  gh.singleton<_i23.NetworkAuthInterceptor>(
      _i23.NetworkAuthInterceptor(get<_i19.AuthStorage>()));
  gh.lazySingleton<_i24.RefreshRepository>(
      () => _i24.RefreshRepository(get<_i19.AuthStorage>()));
  gh.factory<_i25.SettingsVm>(() => _i25.SettingsVm(get<_i21.LocalStorage>()));
  gh.factory<_i26.SplashVm>(() => _i26.SplashVm(get<_i21.LocalStorage>()));
  gh.factory<_i27.ViewerVm>(() => _i27.ViewerVm(get<_i21.LocalStorage>()));
  gh.factory<_i28.EditorVm>(() => _i28.EditorVm(get<_i21.LocalStorage>()));
  gh.singleton<_i29.GlobalVm>(_i29.GlobalVm(get<_i22.LocaleRepository>(),
      get<_i20.DebugRepository>(), get<_i21.LocalStorage>()));
  gh.factory<_i30.HistoryVm>(() => _i30.HistoryVm(get<_i21.LocalStorage>()));
  gh.factory<_i31.HomeVm>(() => _i31.HomeVm(get<_i21.LocalStorage>()));
  gh.factory<_i32.ListsVm>(() => _i32.ListsVm(get<_i21.LocalStorage>()));
  gh.singleton<_i33.NetworkRefreshInterceptor>(
      _i33.NetworkRefreshInterceptor(get<_i24.RefreshRepository>()));
  gh.lazySingleton<_i5.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i9.NetworkLogInterceptor>(),
          get<_i23.NetworkAuthInterceptor>(),
          get<_i8.NetworkErrorInterceptor>(),
          get<_i33.NetworkRefreshInterceptor>()));
  gh.lazySingleton<_i34.Dio>(
      () => registerModule.provideDio(get<_i5.CombiningSmartInterceptor>()));
  gh.singleton<_i35.SongService>(_i36.SongWebService(get<_i34.Dio>()),
      registerFor: {_dev, _prod});
  gh.singleton<_i37.BookService>(_i38.BookWebService(get<_i34.Dio>()),
      registerFor: {_dev, _prod});
  gh.lazySingleton<_i39.SelectionRepository>(() => _i39.SelectionRepository(
      get<_i37.BookService>(),
      get<_i13.BookDaoStorage>(),
      get<_i35.SongService>(),
      get<_i18.SongDaoStorage>()));
  gh.factory<_i40.SelectionVm>(() => _i40.SelectionVm(
      get<_i39.SelectionRepository>(), get<_i21.LocalStorage>()));
  gh.lazySingleton<_i41.BookRepository>(() =>
      _i41.BookRepository(get<_i37.BookService>(), get<_i13.BookDaoStorage>()));
  return get;
}

class _$RegisterModule extends _i42.RegisterModule {}
