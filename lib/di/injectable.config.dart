// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:drift/drift.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../db/app_database.dart' as _i8;
import '../db/dao/app_dao.dart' as _i21;
import '../db/dao/book_dao.dart' as _i9;
import '../db/dao/draft_dao.dart' as _i10;
import '../db/dao/edit_dao.dart' as _i11;
import '../db/dao/history_dao.dart' as _i12;
import '../db/dao/listed_dao.dart' as _i13;
import '../db/dao/search_dao.dart' as _i16;
import '../db/dao/song_dao.dart' as _i19;
import '../repository/db_repository.dart' as _i23;
import '../repository/local_storage.dart' as _i14;
import '../utils/cache/cache_controller.dart' as _i5;
import '../utils/cache/cache_controlling.dart' as _i4;
import '../viewmodels/drafts/draft_editor_vm.dart' as _i24;
import '../viewmodels/drafts/draft_presentor_vm.dart' as _i25;
import '../viewmodels/global_vm.dart' as _i22;
import '../viewmodels/home/home_vm.dart' as _i26;
import '../viewmodels/home/home_web_vm.dart' as _i27;
import '../viewmodels/home/info_vm.dart' as _i28;
import '../viewmodels/home/onboarding_vm.dart' as _i15;
import '../viewmodels/lists/list_popup_vm.dart' as _i29;
import '../viewmodels/lists/list_view_vm.dart' as _i30;
import '../viewmodels/manage/settings_vm.dart' as _i33;
import '../viewmodels/selection/progress_vm.dart' as _i31;
import '../viewmodels/selection/selection_vm.dart' as _i32;
import '../viewmodels/songs/song_editor_vm.dart' as _i34;
import '../viewmodels/songs/song_presentor_vm.dart' as _i35;
import '../viewmodels/splash_vm.dart' as _i36;
import '../viewmodels/user/signin_vm.dart' as _i17;
import '../viewmodels/user/signup_vm.dart' as _i18;
import '../viewmodels/user/user_vm.dart' as _i20;
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
  await gh.singletonAsync<_i6.DatabaseConnection>(
    () => registerModule.provideDatabaseConnection(),
    preResolve: true,
  );
  await gh.singletonAsync<_i7.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i8.AppDatabase>(
      () => registerModule.provideAppDatabase(get<_i6.DatabaseConnection>()));
  gh.lazySingleton<_i9.BookDao>(() => _i9.BookDao(get<_i8.AppDatabase>()));
  gh.lazySingleton<_i10.DraftDao>(() => _i10.DraftDao(get<_i8.AppDatabase>()));
  gh.lazySingleton<_i11.EditDao>(() => _i11.EditDao(get<_i8.AppDatabase>()));
  gh.lazySingleton<_i12.HistoryDao>(
      () => _i12.HistoryDao(get<_i8.AppDatabase>()));
  gh.lazySingleton<_i13.ListedDao>(
      () => _i13.ListedDao(get<_i8.AppDatabase>()));
  gh.lazySingleton<_i14.LocalStorage>(
      () => _i14.LocalStorage(get<_i7.SharedPreferences>()));
  gh.factory<_i15.OnboardingVm>(
      () => _i15.OnboardingVm(get<_i14.LocalStorage>()));
  gh.lazySingleton<_i16.SearchDao>(
      () => _i16.SearchDao(get<_i8.AppDatabase>()));
  gh.factory<_i17.SigninVm>(() => _i17.SigninVm(get<_i14.LocalStorage>()));
  gh.factory<_i18.SignupVm>(() => _i18.SignupVm(get<_i14.LocalStorage>()));
  gh.lazySingleton<_i19.SongDao>(() => _i19.SongDao(get<_i8.AppDatabase>()));
  gh.factory<_i20.UserVm>(() => _i20.UserVm(get<_i14.LocalStorage>()));
  gh.lazySingleton<_i21.AppDao>(() => _i21.AppDao(get<_i8.AppDatabase>()));
  gh.singleton<_i22.AppVm>(_i22.AppVm(get<_i14.LocalStorage>()));
  gh.lazySingleton<_i23.DbRepository>(() => _i23.DbRepository(
        get<_i21.AppDao>(),
        get<_i9.BookDao>(),
        get<_i10.DraftDao>(),
        get<_i11.EditDao>(),
        get<_i12.HistoryDao>(),
        get<_i13.ListedDao>(),
        get<_i16.SearchDao>(),
        get<_i19.SongDao>(),
      ));
  gh.factory<_i24.DraftEditorVm>(() => _i24.DraftEditorVm(
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i25.DraftPresentorVm>(() => _i25.DraftPresentorVm(
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.singleton<_i26.HomeVm>(_i26.HomeVm(
    get<_i23.DbRepository>(),
    get<_i14.LocalStorage>(),
  ));
  gh.factory<_i27.HomeWebVm>(() => _i27.HomeWebVm(
        get<_i3.AppWebService>(),
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i28.InfoVm>(() => _i28.InfoVm(get<_i14.LocalStorage>()));
  gh.factory<_i29.ListPopupVm>(() => _i29.ListPopupVm(
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i30.ListViewVm>(() => _i30.ListViewVm(
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i31.ProgressVm>(() => _i31.ProgressVm(
        get<_i3.AppWebService>(),
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i32.SelectionVm>(() => _i32.SelectionVm(
        get<_i3.AppWebService>(),
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i33.SettingsVm>(() => _i33.SettingsVm(
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i34.SongEditorVm>(() => _i34.SongEditorVm(
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i35.SongPresentorVm>(() => _i35.SongPresentorVm(
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  gh.factory<_i36.SplashVm>(() => _i36.SplashVm(
        get<_i23.DbRepository>(),
        get<_i14.LocalStorage>(),
      ));
  return get;
}

class _$RegisterModule extends _i37.RegisterModule {}
