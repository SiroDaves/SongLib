// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:songlib/common/data/db/app_database.dart' as _i10;
import 'package:songlib/common/repository/auth_repository.dart' as _i11;
import 'package:songlib/common/repository/database_repository.dart' as _i13;
import 'package:songlib/common/repository/local_storage.dart' as _i12;
import 'package:songlib/core/di/injectable.dart' as _i14;
import 'package:songlib/features/home/likes/bloc/likes_bloc.dart' as _i8;
import 'package:songlib/features/home/songs/bloc/songs_bloc.dart' as _i7;
import 'package:songlib/features/presentor/bloc/presentor_bloc.dart' as _i3;
import 'package:songlib/features/selection/step1/bloc/step1_bloc.dart' as _i5;
import 'package:songlib/features/selection/step2/bloc/step2_bloc.dart' as _i4;
import 'package:songlib/features/settings/bloc/settings_bloc.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.PresentorBloc>(() => _i3.PresentorBloc());
    gh.factory<_i4.Step2Bloc>(() => _i4.Step2Bloc());
    gh.factory<_i5.Step1Bloc>(() => _i5.Step1Bloc());
    gh.factory<_i6.SettingsBloc>(() => _i6.SettingsBloc());
    gh.factory<_i7.SongsBloc>(() => _i7.SongsBloc());
    gh.factory<_i8.LikesBloc>(() => _i8.LikesBloc());
    await gh.singletonAsync<_i9.SharedPreferences>(
      () => registerModule.localStorage(),
      preResolve: true,
    );
    await gh.singletonAsync<_i10.AppDatabase>(
      () => registerModule.provideAppDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i11.AuthRepository>(() => _i11.AuthRepository());
    gh.singleton<_i12.LocalStorage>(
        () => _i12.LocalStorage(gh<_i9.SharedPreferences>()));
    gh.lazySingleton<_i13.DatabaseRepository>(
        () => registerModule.provideDatabaseRepository(gh<_i10.AppDatabase>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
