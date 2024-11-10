// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:songlib/common/data/db/app_database.dart' as _i4;
import 'package:songlib/common/repository/auth_repository.dart' as _i5;
import 'package:songlib/common/repository/database_repository.dart' as _i7;
import 'package:songlib/common/repository/local_storage.dart' as _i6;
import 'package:songlib/core/di/injectable.dart' as _i8;

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
    await gh.singletonAsync<_i3.SharedPreferences>(
      () => registerModule.localStorage(),
      preResolve: true,
    );
    await gh.singletonAsync<_i4.AppDatabase>(
      () => registerModule.provideAppDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i5.AuthRepository>(() => _i5.AuthRepository());
    gh.singleton<_i6.LocalStorage>(
        () => _i6.LocalStorage(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i7.DatabaseRepository>(
        () => registerModule.provideDatabaseRepository(gh<_i4.AppDatabase>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
