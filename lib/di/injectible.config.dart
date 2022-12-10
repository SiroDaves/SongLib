// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:drift/drift.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i4;
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
import '../repository/refresh_repository.dart' as _i28;
import '../repository/secure_storage/auth_storage.dart' as _i18;
import '../repository/secure_storage/secure_storage.dart' as _i9;
import '../repository/shared_prefs/local_storage.dart' as _i21;
import '../utils/interceptor/network_auth_interceptor.dart' as _i24;
import '../utils/interceptor/network_error_interceptor.dart' as _i7;
import '../utils/interceptor/network_log_interceptor.dart' as _i8;
import '../utils/interceptor/network_refresh_interceptor.dart' as _i41;
import '../view_models/global_vm.dart' as _i34;
import '../view_models/home/histories_vm.dart' as _i36;
import '../view_models/home/home_vm.dart' as _i37;
import '../view_models/home/likes_vm.dart' as _i38;
import '../view_models/info/donation_vm.dart' as _i32;
import '../view_models/info/helpdesk_vm.dart' as _i35;
import '../view_models/info/merchandise_vm.dart' as _i23;
import '../view_models/lists/list_popup_vm.dart' as _i39;
import '../view_models/lists/list_view_vm.dart' as _i40;
import '../view_models/manage/settings_vm.dart' as _i30;
import '../view_models/onboarding_vm.dart' as _i25;
import '../view_models/selection/progress_vm.dart' as _i27;
import '../view_models/selection/selection_vm.dart' as _i29;
import '../view_models/songs/editor_vm.dart' as _i33;
import '../view_models/songs/presentor_vm.dart' as _i26;
import '../view_models/splash_vm.dart' as _i31;
import '../webservice/api_client.dart' as _i3;
import 'injectible.dart' as _i42; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.ApiClient>(() => _i3.ApiClient());
  gh.singleton<_i4.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i5.DatabaseConnection>(
    () => registerModule.provideDatabaseConnection(),
    preResolve: true,
  );
  gh.lazySingleton<_i6.FlutterSecureStorage>(() => registerModule.storage());
  gh.singleton<_i7.NetworkErrorInterceptor>(
      _i7.NetworkErrorInterceptor(get<_i4.ConnectivityHelper>()));
  gh.singleton<_i8.NetworkLogInterceptor>(_i8.NetworkLogInterceptor());
  gh.lazySingleton<_i9.SecureStorage>(
      () => _i9.SecureStorage(get<_i6.FlutterSecureStorage>()));
  await gh.singletonAsync<_i10.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i11.SongLibDb>(
      () => registerModule.provideSongLibDb(get<_i5.DatabaseConnection>()));
  gh.lazySingleton<_i12.BookDaoStorage>(
      () => _i12.BookDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i13.DraftDaoStorage>(
      () => _i13.DraftDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i14.HistoryDaoStorage>(
      () => _i14.HistoryDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i15.ListedDaoStorage>(
      () => _i15.ListedDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i16.SearchDaoStorage>(
      () => _i16.SearchDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i4.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i4.SimpleKeyValueStorage>(
      () => registerModule.keyValueStorage(
            get<_i4.SharedPreferenceStorage>(),
            get<_i9.SecureStorage>(),
          ));
  gh.lazySingleton<_i17.SongDaoStorage>(
      () => _i17.SongDaoStorage(get<_i11.SongLibDb>()));
  gh.lazySingleton<_i18.AuthStorage>(
      () => _i18.AuthStorage(get<_i4.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i19.DbRepository>(() => _i19.DbRepository(
        get<_i12.BookDaoStorage>(),
        get<_i13.DraftDaoStorage>(),
        get<_i14.HistoryDaoStorage>(),
        get<_i15.ListedDaoStorage>(),
        get<_i16.SearchDaoStorage>(),
        get<_i17.SongDaoStorage>(),
      ));
  gh.lazySingleton<_i20.DebugRepository>(
      () => _i20.DebugRepository(get<_i4.SharedPreferenceStorage>()));
  gh.lazySingleton<_i21.LocalStorage>(() => _i21.LocalStorage(
        get<_i18.AuthStorage>(),
        get<_i4.SharedPreferenceStorage>(),
      ));
  gh.lazySingleton<_i22.LocaleRepository>(
      () => _i22.LocaleRepository(get<_i4.SharedPreferenceStorage>()));
  gh.factory<_i23.MerchandiseVm>(
      () => _i23.MerchandiseVm(get<_i21.LocalStorage>()));
  gh.singleton<_i24.NetworkAuthInterceptor>(
      _i24.NetworkAuthInterceptor(get<_i18.AuthStorage>()));
  gh.factory<_i25.OnboardingVm>(
      () => _i25.OnboardingVm(get<_i21.LocalStorage>()));
  gh.factory<_i26.PresentorVm>(() => _i26.PresentorVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i27.ProgressVm>(() => _i27.ProgressVm(
        get<_i3.ApiClient>(),
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.lazySingleton<_i28.RefreshRepository>(
      () => _i28.RefreshRepository(get<_i18.AuthStorage>()));
  gh.factory<_i29.SelectionVm>(() => _i29.SelectionVm(
        get<_i3.ApiClient>(),
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i30.SettingsVm>(() => _i30.SettingsVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i31.SplashVM>(() => _i31.SplashVM(get<_i21.LocalStorage>()));
  gh.factory<_i32.DonationVm>(() => _i32.DonationVm(get<_i21.LocalStorage>()));
  gh.factory<_i33.EditorVm>(() => _i33.EditorVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.singleton<_i34.GlobalVM>(_i34.GlobalVM(
    get<_i22.LocaleRepository>(),
    get<_i20.DebugRepository>(),
    get<_i21.LocalStorage>(),
  ));
  gh.factory<_i35.HelpDeskVm>(() => _i35.HelpDeskVm(get<_i21.LocalStorage>()));
  gh.factory<_i36.HistoriesVm>(() => _i36.HistoriesVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i37.HomeVm>(() => _i37.HomeVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i38.LikesVm>(() => _i38.LikesVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i39.ListPopupVm>(() => _i39.ListPopupVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.factory<_i40.ListViewVm>(() => _i40.ListViewVm(
        get<_i19.DbRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.singleton<_i41.NetworkRefreshInterceptor>(
      _i41.NetworkRefreshInterceptor(get<_i28.RefreshRepository>()));
  gh.lazySingleton<_i4.CombiningSmartInterceptor>(
      () => registerModule.provideCombiningSmartInterceptor(
            get<_i8.NetworkLogInterceptor>(),
            get<_i24.NetworkAuthInterceptor>(),
            get<_i7.NetworkErrorInterceptor>(),
            get<_i41.NetworkRefreshInterceptor>(),
          ));
  return get;
}

class _$RegisterModule extends _i42.RegisterModule {}
