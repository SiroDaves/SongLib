import 'dart:io';

import 'package:dio/dio.dart';

import '../../exports.dart';

enum Method { post, get, put, delete, patch }

class DioService {
  Dio? dio;

  static header() => {
        'X-Parse-Application-Id': ApiConstants.parseAppID,
        'X-Parse-REST-API-Key': ApiConstants.parseApiKey,
        'Content-Type': 'application/json',
      };

  Future<DioService> init() async {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.parseUrl, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          // ignore: avoid_print
          print(
              "REQUEST[${requestOptions.method}] \nPATH: ${requestOptions.path} \nREQUEST VALUES: ${requestOptions.queryParameters} \nHEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          // ignore: avoid_print
          print("RESPONSE[${response.statusCode}] \nDATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          // ignore: avoid_print
          print("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
  }) async {
    Response response;

    try {
      if (method == Method.post) {
        response = await dio!.post(url, data: params);
      } else if (method == Method.delete) {
        response = await dio!.delete(url);
      } else if (method == Method.patch) {
        response = await dio!.patch(url);
      } else {
        response = await dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception(e);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception("Something wen't wrong");
    }
  }
}
