import 'package:dio/dio.dart';
import 'package:songlib/core/app_extension.dart';

import 'dio_exception.dart';

abstract mixin class ApiHelper<T> {
  late final T data;

  Future<bool> _requestMethodTemplate(
    Future<Response<dynamic>> apiCallback,
  ) async {
    final response = await apiCallback;
    if (response.statusCode.success) {
      return true;
    } else {
      throw DioExceptions;
    }
  }

  //Generic Method template for create item on server
  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic Method template for update item on server
  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic Method template for delete item from server
  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }
}
