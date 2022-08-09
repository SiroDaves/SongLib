// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i55;
import 'package:drift/drift.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../database/career/calendar_results_dao_storage.dart' as _i26;
import '../database/career/career_calendar_dao_storage.dart' as _i25;
import '../database/dao/book_dao_storage.dart' as _i60;
import '../database/songlib_database.dart' as _i19;
import '../database/tour_results/tour_results_dao_storage.dart' as _i24;
import '../repository/book/book_repository.dart' as _i59;
import '../repository/calendar/calendar_repository.dart' as _i41;
import '../repository/career/career_repository.dart' as _i43;
import '../repository/debug/debug_repository.dart' as _i28;
import '../repository/locale/locale_repository.dart' as _i31;
import '../repository/name/name_repository.dart' as _i32;
import '../repository/refresh/refresh_repository.dart' as _i34;
import '../repository/secure_storage/auth_storage.dart' as _i27;
import '../repository/secure_storage/secure_storage.dart' as _i15;
import '../repository/shared_prefs/local_storage.dart' as _i30;
import '../repository/tour/tour_repository.dart' as _i37;
import '../repository/tutorial/tutorial_repository.dart' as _i39;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i33;
import '../util/interceptor/network_error_interceptor.dart' as _i13;
import '../util/interceptor/network_log_interceptor.dart' as _i14;
import '../util/interceptor/network_refresh_interceptor.dart' as _i51;
import '../vm/active_tour/active_tour_vm.dart' as _i40;
import '../vm/career_calendar/career_calendar_vm.dart' as _i42;
import '../vm/career_finish/career_finish_vm.dart' as _i53;
import '../vm/career_overview/career_overview_vm.dart' as _i54;
import '../vm/career_reset/career_reset_vm.dart' as _i44;
import '../vm/career_select_riders/career_select_riders_vm.dart' as _i45;
import '../vm/career_standings/career_standings_vm.dart' as _i46;
import '../vm/change_cyclist_names/change_cyclist_names_vm.dart' as _i47;
import '../vm/credits/credits_vm.dart' as _i6;
import '../vm/debug/debug_platform_selector_vm.dart' as _i8;
import '../vm/debug/debug_vm.dart' as _i29;
import '../vm/game/game_vm.dart' as _i48;
import '../vm/global/global_vm.dart' as _i49;
import '../vm/information/information_vm.dart' as _i10;
import '../vm/license/license_vm.dart' as _i11;
import '../vm/main_menu/main_menu_vm.dart' as _i50;
import '../vm/menu_background/menu_background_vm.dart' as _i12;
import '../vm/results/results_vm.dart' as _i52;
import '../vm/selection/selection_vm.dart' as _i16;
import '../vm/settings/settings_vm.dart' as _i35;
import '../vm/single_race_menu/single_race_menu_vm.dart' as _i18;
import '../vm/splash/splash_vm.dart' as _i36;
import '../vm/tour_in_progress/tour_in_progress_vm.dart' as _i23;
import '../vm/tour_select/tour_select_vm.dart' as _i38;
import '../webservice/book/book_service.dart' as _i57;
import '../webservice/book/book_webservice.dart' as _i58;
import '../webservice/song/song_dummy_service.dart' as _i21;
import '../webservice/song/song_service.dart' as _i20;
import '../webservice/song/song_webservice.dart' as _i56;
import '../widget_game/data/sprite_manager.dart' as _i22;
import 'injectable.dart' as _i61;

const String _dummy = 'dummy';
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
  gh.factory<_i16.SelectionVm>(() => _i16.SelectionVm());
  await gh.singletonAsync<_i17.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.factory<_i18.SingleRaceMenuVm>(() => _i18.SingleRaceMenuVm());
  gh.lazySingleton<_i19.SongLibDatabase>(() =>
      registerModule.provideSongLibDatabase(get<_i7.DatabaseConnection>()));
  gh.singleton<_i20.SongService>(_i21.SongDummyService(),
      registerFor: {_dummy});
  gh.singleton<_i22.SpriteManager>(_i22.SpriteManager());
  gh.factory<_i23.TourInProgressVm>(() => _i23.TourInProgressVm());
  gh.lazySingleton<_i24.TourResultsDaoStorage>(
      () => _i24.TourResultsDaoStorage(get<_i19.SongLibDatabase>()));
  gh.lazySingleton<_i25.CareerCalendarDaoStorage>(
      () => _i25.CareerCalendarDaoStorage(get<_i19.SongLibDatabase>()));
  gh.lazySingleton<_i26.CareerResultsDaoStorage>(
      () => _i26.CareerResultsDaoStorage(get<_i19.SongLibDatabase>()));
  gh.lazySingleton<_i5.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i17.SharedPreferences>()));
  gh.lazySingleton<_i5.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i5.SharedPreferenceStorage>(), get<_i15.SecureStorage>()));
  gh.lazySingleton<_i27.AuthStorage>(
      () => _i27.AuthStorage(get<_i5.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i28.DebugRepository>(
      () => _i28.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.factory<_i29.DebugVm>(() => _i29.DebugVm(get<_i28.DebugRepository>()));
  gh.lazySingleton<_i30.LocalStorage>(() => _i30.LocalStorage(
      get<_i27.AuthStorage>(), get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i31.LocaleRepository>(
      () => _i31.LocaleRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i32.NameRepository>(
      () => _i32.NameRepository(get<_i30.LocalStorage>()));
  gh.singleton<_i33.NetworkAuthInterceptor>(
      _i33.NetworkAuthInterceptor(get<_i27.AuthStorage>()));
  gh.lazySingleton<_i34.RefreshRepository>(
      () => _i34.RefreshRepository(get<_i27.AuthStorage>()));
  gh.factory<_i35.SettingsVm>(() => _i35.SettingsVm(get<_i30.LocalStorage>()));
  gh.factory<_i36.SplashVm>(() => _i36.SplashVm(get<_i30.LocalStorage>()));
  gh.lazySingleton<_i37.TourRepository>(() => _i37.TourRepository(
      get<_i24.TourResultsDaoStorage>(), get<_i30.LocalStorage>()));
  gh.factory<_i38.TourSelectVm>(
      () => _i38.TourSelectVm(get<_i37.TourRepository>()));
  gh.lazySingleton<_i39.TutorialRepository>(
      () => _i39.TutorialRepository(get<_i30.LocalStorage>()));
  gh.factory<_i40.ActiveTourVm>(() => _i40.ActiveTourVm(
      get<_i37.TourRepository>(), get<_i32.NameRepository>()));
  gh.lazySingleton<_i41.CalendarRepository>(() => _i41.CalendarRepository(
      get<_i30.LocalStorage>(), get<_i25.CareerCalendarDaoStorage>()));
  gh.factory<_i42.CareerCalendarVm>(() => _i42.CareerCalendarVm(
      get<_i41.CalendarRepository>(), get<_i32.NameRepository>()));
  gh.lazySingleton<_i43.CareerRepository>(() => _i43.CareerRepository(
      get<_i26.CareerResultsDaoStorage>(), get<_i41.CalendarRepository>()));
  gh.factory<_i44.CareerResetVm>(
      () => _i44.CareerResetVm(get<_i43.CareerRepository>()));
  gh.factory<_i45.CareerSelectRidersVm>(() => _i45.CareerSelectRidersVm(
      get<_i41.CalendarRepository>(), get<_i37.TourRepository>()));
  gh.factory<_i46.CareerStandingsVm>(() => _i46.CareerStandingsVm(
      get<_i43.CareerRepository>(),
      get<_i41.CalendarRepository>(),
      get<_i32.NameRepository>()));
  gh.factory<_i47.ChangeCyclistNamesVm>(
      () => _i47.ChangeCyclistNamesVm(get<_i32.NameRepository>()));
  gh.factory<_i48.GameVm>(() => _i48.GameVm(get<_i39.TutorialRepository>(),
      get<_i30.LocalStorage>(), get<_i22.SpriteManager>()));
  gh.singleton<_i49.GlobalVm>(_i49.GlobalVm(get<_i31.LocaleRepository>(),
      get<_i28.DebugRepository>(), get<_i30.LocalStorage>()));
  gh.factory<_i50.MainMenuVm>(
      () => _i50.MainMenuVm(get<_i37.TourRepository>()));
  gh.singleton<_i51.NetworkRefreshInterceptor>(
      _i51.NetworkRefreshInterceptor(get<_i34.RefreshRepository>()));
  gh.factory<_i52.ResultsVm>(() => _i52.ResultsVm(get<_i32.NameRepository>(),
      get<_i37.TourRepository>(), get<_i43.CareerRepository>()));
  gh.factory<_i53.CareerFinishVm>(
      () => _i53.CareerFinishVm(get<_i43.CareerRepository>()));
  gh.factory<_i54.CareerOverviewVm>(() => _i54.CareerOverviewVm(
      get<_i43.CareerRepository>(),
      get<_i41.CalendarRepository>(),
      get<_i32.NameRepository>()));
  gh.lazySingleton<_i5.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i14.NetworkLogInterceptor>(),
          get<_i33.NetworkAuthInterceptor>(),
          get<_i13.NetworkErrorInterceptor>(),
          get<_i51.NetworkRefreshInterceptor>()));
  gh.lazySingleton<_i55.Dio>(
      () => registerModule.provideDio(get<_i5.CombiningSmartInterceptor>()));
  gh.singleton<_i20.SongService>(_i56.SongWebService(get<_i55.Dio>()),
      registerFor: {_dev, _prod});
  gh.singleton<_i57.BookService>(_i58.BookWebService(get<_i55.Dio>()),
      registerFor: {_dev, _prod});
  gh.lazySingleton<_i59.BookRepository>(() =>
      _i59.BookRepository(get<_i57.BookService>(), get<_i60.BookDaoStorage>()));
  return get;
}

class _$RegisterModule extends _i61.RegisterModule {}
