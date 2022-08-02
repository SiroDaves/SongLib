import 'package:dio/dio.dart';
import 'package:songlib/repository/secure_storage/auth/auth_storage.dart';
import 'package:songlib/util/myapp_constants.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkAuthInterceptor extends SimpleInterceptor {
  final AuthStorage _storage;
  final _excludedPaths = [
    'login',
  ];

  NetworkAuthInterceptor(this._storage);

  @override
  Future<Object?> onRequest(RequestOptions options) async {
    if (_excludedPaths.contains(options.path)) {
      return super.onRequest(options);
    }
    final authorizationHeader = '${MyappConstants.protectedAuthenticationHeaderPrefix} ${await _storage.getAccessToken()}';
    options.headers[MyappConstants.authorizationHeader] = authorizationHeader;
    return options;
  }
}
