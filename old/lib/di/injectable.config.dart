// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i52;
import 'package:drift/drift.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../database/career/calendar_results_dao_storage.dart' as _i23;
import '../database/career/career_calendar_dao_storage.dart' as _i22;
import '../database/dao/book_dao_storage.dart' as _i58;
import '../database/dao/song_dao_storage.dart' as _i59;
import '../database/songlib_database.dart' as _i18;
import '../database/tour_results/tour_results_dao_storage.dart' as _i21;
import '../repository/book_repository.dart' as _i61;
import '../repository/calendar_repository.dart' as _i38;
import '../repository/career_repository.dart' as _i40;
import '../repository/debug_repository.dart' as _i25;
import '../repository/locale_repository.dart' as _i28;
import '../repository/name_repository.dart' as _i29;
import '../repository/refresh_repository.dart' as _i31;
import '../repository/secure_storage/auth_storage.dart' as _i24;
import '../repository/secure_storage/secure_storage.dart' as _i15;
import '../repository/selection_repository.dart' as _i57;
import '../repository/shared_prefs/local_storage.dart' as _i27;
import '../repository/tour_repository.dart' as _i34;
import '../repository/tutorial_repository.dart' as _i36;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i30;
import '../util/interceptor/network_error_interceptor.dart' as _i13;
import '../util/interceptor/network_log_interceptor.dart' as _i14;
import '../util/interceptor/network_refresh_interceptor.dart' as _i48;
import '../vm/careers/career_calendar_vm.dart' as _i39;
import '../vm/careers/career_finish_vm.dart' as _i50;
import '../vm/careers/career_overview_vm.dart' as _i51;
import '../vm/careers/career_reset_vm.dart' as _i41;
import '../vm/careers/career_select_riders_vm.dart' as _i42;
import '../vm/careers/career_standings_vm.dart' as _i43;
import '../vm/debug/debug_platform_selector_vm.dart' as _i8;
import '../vm/debug/debug_vm.dart' as _i26;
import '../vm/game/change_cyclist_names_vm.dart' as _i44;
import '../vm/game/game_vm.dart' as _i45;
import '../vm/global/global_vm.dart' as _i46;
import '../vm/information/credits_vm.dart' as _i6;
import '../vm/information/information_vm.dart' as _i10;
import '../vm/information/license_vm.dart' as _i11;
import '../vm/main_menu/main_menu_vm.dart' as _i47;
import '../vm/main_menu/menu_background_vm.dart' as _i12;
import '../vm/main_menu/single_race_menu_vm.dart' as _i17;
import '../vm/results_vm.dart' as _i49;
import '../vm/selection_vm.dart' as _i60;
import '../vm/settings/settings_vm.dart' as _i32;
import '../vm/splash_vm.dart' as _i33;
import '../vm/tours/active_tour_vm.dart' as _i37;
import '../vm/tours/tour_in_progress_vm.dart' as _i20;
import '../vm/tours/tour_select_vm.dart' as _i35;
import '../webservice/book/book_service.dart' as _i55;
import '../webservice/book/book_webservice.dart' as _i56;
import '../webservice/song/song_service.dart' as _i53;
import '../webservice/song/song_webservice.dart' as _i54;
import '../widget_game/data/sprite_manager.dart' as _i19;
import 'injectable.dart' as _i62;

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
  gh.factory<_i6.CreditsVm>(() => _i6.CreditsVm());
  await gh.singletonAsync<_i7.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true);
  gh.factory<_i8.DebugPlatformSelectorVm>(() => _i8.DebugPlatformSelectorVm());
  gh.lazySingleton<_i9.FlutterSecureStorage>(() => registerModule.storage());
  gh.factory<_i10.InformationVm>(() => _i10.InformationVm());
  gh.factory<_i11.LicenseVm>(() => _i11.LicenseVm());
  gh.factory<_i12.MenuBackgroundVm>(() => _i12.MenuBackgroundVm());
  gh.singleton<_i13.NetworkErrorInterceptor>(
      _i13.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i14.NetworkLogInterceptor>(_i14.NetworkLogInterceptor());
  gh.lazySingleton<_i15.SecureStorage>(
      () => _i15.SecureStorage(get<_i9.FlutterSecureStorage>()));
  await gh.singletonAsync<_i16.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.factory<_i17.SingleRaceMenuVm>(() => _i17.SingleRaceMenuVm());
  gh.lazySingleton<_i18.SongLibDatabase>(() =>
      registerModule.provideSongLibDatabase(get<_i7.DatabaseConnection>()));
  gh.singleton<_i19.SpriteManager>(_i19.SpriteManager());
  gh.factory<_i20.TourInProgressVm>(() => _i20.TourInProgressVm());
  gh.lazySingleton<_i21.TourResultsDaoStorage>(
      () => _i21.TourResultsDaoStorage(get<_i18.SongLibDatabase>()));
  gh.lazySingleton<_i22.CareerCalendarDaoStorage>(
      () => _i22.CareerCalendarDaoStorage(get<_i18.SongLibDatabase>()));
  gh.lazySingleton<_i23.CareerResultsDaoStorage>(
      () => _i23.CareerResultsDaoStorage(get<_i18.SongLibDatabase>()));
  gh.lazySingleton<_i5.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i5.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i5.SharedPreferenceStorage>(), get<_i15.SecureStorage>()));
  gh.lazySingleton<_i24.AuthStorage>(
      () => _i24.AuthStorage(get<_i5.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i25.DebugRepository>(
      () => _i25.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.factory<_i26.DebugVm>(() => _i26.DebugVm(get<_i25.DebugRepository>()));
  gh.lazySingleton<_i27.LocalStorage>(() => _i27.LocalStorage(
      get<_i24.AuthStorage>(), get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i28.LocaleRepository>(
      () => _i28.LocaleRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i29.NameRepository>(
      () => _i29.NameRepository(get<_i27.LocalStorage>()));
  gh.singleton<_i30.NetworkAuthInterceptor>(
      _i30.NetworkAuthInterceptor(get<_i24.AuthStorage>()));
  gh.lazySingleton<_i31.RefreshRepository>(
      () => _i31.RefreshRepository(get<_i24.AuthStorage>()));
  gh.factory<_i32.SettingsVm>(() => _i32.SettingsVm(get<_i27.LocalStorage>()));
  gh.factory<_i33.SplashVm>(() => _i33.SplashVm(get<_i27.LocalStorage>()));
  gh.lazySingleton<_i34.TourRepository>(() => _i34.TourRepository(
      get<_i21.TourResultsDaoStorage>(), get<_i27.LocalStorage>()));
  gh.factory<_i35.TourSelectVm>(
      () => _i35.TourSelectVm(get<_i34.TourRepository>()));
  gh.lazySingleton<_i36.TutorialRepository>(
      () => _i36.TutorialRepository(get<_i27.LocalStorage>()));
  gh.factory<_i37.ActiveTourVm>(() => _i37.ActiveTourVm(
      get<_i34.TourRepository>(), get<_i29.NameRepository>()));
  gh.lazySingleton<_i38.CalendarRepository>(() => _i38.CalendarRepository(
      get<_i27.LocalStorage>(), get<_i22.CareerCalendarDaoStorage>()));
  gh.factory<_i39.CareerCalendarVm>(() => _i39.CareerCalendarVm(
      get<_i38.CalendarRepository>(), get<_i29.NameRepository>()));
  gh.lazySingleton<_i40.CareerRepository>(() => _i40.CareerRepository(
      get<_i23.CareerResultsDaoStorage>(), get<_i38.CalendarRepository>()));
  gh.factory<_i41.CareerResetVm>(
      () => _i41.CareerResetVm(get<_i40.CareerRepository>()));
  gh.factory<_i42.CareerSelectRidersVm>(() => _i42.CareerSelectRidersVm(
      get<_i38.CalendarRepository>(), get<_i34.TourRepository>()));
  gh.factory<_i43.CareerStandingsVm>(() => _i43.CareerStandingsVm(
      get<_i40.CareerRepository>(),
      get<_i38.CalendarRepository>(),
      get<_i29.NameRepository>()));
  gh.factory<_i44.ChangeCyclistNamesVm>(
      () => _i44.ChangeCyclistNamesVm(get<_i29.NameRepository>()));
  gh.factory<_i45.GameVm>(() => _i45.GameVm(get<_i36.TutorialRepository>(),
      get<_i27.LocalStorage>(), get<_i19.SpriteManager>()));
  gh.singleton<_i46.GlobalVm>(_i46.GlobalVm(get<_i28.LocaleRepository>(),
      get<_i25.DebugRepository>(), get<_i27.LocalStorage>()));
  gh.factory<_i47.MainMenuVm>(
      () => _i47.MainMenuVm(get<_i34.TourRepository>()));
  gh.singleton<_i48.NetworkRefreshInterceptor>(
      _i48.NetworkRefreshInterceptor(get<_i31.RefreshRepository>()));
  gh.factory<_i49.ResultsVm>(() => _i49.ResultsVm(get<_i29.NameRepository>(),
      get<_i34.TourRepository>(), get<_i40.CareerRepository>()));
  gh.factory<_i50.CareerFinishVm>(
      () => _i50.CareerFinishVm(get<_i40.CareerRepository>()));
  gh.factory<_i51.CareerOverviewVm>(() => _i51.CareerOverviewVm(
      get<_i40.CareerRepository>(),
      get<_i38.CalendarRepository>(),
      get<_i29.NameRepository>()));
  gh.lazySingleton<_i5.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i14.NetworkLogInterceptor>(),
          get<_i30.NetworkAuthInterceptor>(),
          get<_i13.NetworkErrorInterceptor>(),
          get<_i48.NetworkRefreshInterceptor>()));
  gh.lazySingleton<_i52.Dio>(
      () => registerModule.provideDio(get<_i5.CombiningSmartInterceptor>()));
  gh.singleton<_i53.SongService>(_i54.SongWebService(get<_i52.Dio>()),
      registerFor: {_dev, _prod});
  gh.singleton<_i55.BookService>(_i56.BookWebService(get<_i52.Dio>()),
      registerFor: {_dev, _prod});
  gh.lazySingleton<_i57.SelectionRepository>(() => _i57.SelectionRepository(
      get<_i55.BookService>(),
      get<_i58.BookDaoStorage>(),
      get<_i53.SongService>(),
      get<_i59.SongDaoStorage>()));
  gh.factory<_i60.SelectionVm>(() => _i60.SelectionVm(
      get<_i57.SelectionRepository>(), get<_i27.LocalStorage>()));
  gh.lazySingleton<_i61.BookRepository>(() =>
      _i61.BookRepository(get<_i55.BookService>(), get<_i58.BookDaoStorage>()));
  return get;
}

class _$RegisterModule extends _i62.RegisterModule {}
