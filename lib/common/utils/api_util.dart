import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:songlib/common/utils/constants/api_constants.dart';

import 'app_util.dart';

/// Http get request
Future<http.Response> makeApiGetRequest(
  String endpoint,
  Map<String, String> headers,
) async {
  endpoint = ApiConstants.songliveApi + endpoint;

  try {
    logger('Api Request [GET]: $endpoint \nHeaders: ${json.encode(headers)}');

    final response = await http
        .get(
      Uri.parse(endpoint),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        logger('Timeout occurred. Please try again later.');
        return http.Response('Timeout occurred', 504);
      },
    );

    logger('Api Response: [${response.statusCode}] ${response.body}');

    return response;
  } catch (e) {
    if (e is TimeoutException) {
      logger('Timeout occurred. Please try again later.');
      return http.Response('Timeout occurred', 504);
    } else {
      logger('An error occurred during the HTTP request: $e');
      return http.Response('Internal server error', 500);
    }
  }
}

/// Http patch request
Future<http.Response> makeApiPatchRequest(
  String endpoint,
  Map<String, String> headers,
  dynamic requestBody,
) async {
  endpoint = ApiConstants.songliveApi + endpoint;
  try {
    logger(
        'Api Request [PATCH]: $endpoint \n Headers: ${json.encode(headers)} \n JsonData: ${json.encode(requestBody)}');

    final response = await http
        .patch(
      Uri.parse(endpoint),
      headers: headers,
      body: json.encode(requestBody),
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        logger('Timeout occurred. Please try again later.');
        return http.Response('Timeout occurred', 504);
      },
    );

    logger('Api Response: [${response.statusCode}] ${response.body}');

    return response;
  } catch (e) {
    if (e is TimeoutException) {
      logger('Timeout occurred. Please try again later.');
      return http.Response('Timeout occurred', 504);
    } else {
      logger('An error occurred during the HTTP request: $e');
      return http.Response('Internal server error', 500);
    }
  }
}

/// Http post resquest
Future<http.Response> makeApiPostRequest(
  String endpoint,
  Map<String, String> headers,
  dynamic requestBody,
) async {
  endpoint = ApiConstants.songliveApi + endpoint;
  try {
    logger(
        'Api Request [POST]: $endpoint\n Headers: ${json.encode(headers)} \nJsonData: ${json.encode(requestBody)}');

    final response = await http
        .post(
      Uri.parse(endpoint),
      headers: headers,
      body: json.encode(requestBody),
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        logger('Timeout occurred. Please try again later.');
        return http.Response('Timeout occurred', 504);
      },
    );

    logger('Api Response: [${response.statusCode}] ${response.body}');

    return response;
  } catch (e) {
    if (e is TimeoutException) {
      logger('Timeout occurred. Please try again later.');
      return http.Response('Timeout occurred', 504);
    } else {
      logger('An error occurred during the HTTP request: $e');
      return http.Response('Internal server error', 500);
    }
  }
}

/// Http put request
Future<http.Response> makeApiPutRequest(
  String endpoint,
  Map<String, String> headers,
  dynamic requestBody,
) async {
  endpoint = ApiConstants.songliveApi + endpoint;
  try {
    logger(
        'Api Request [PUT]: $endpoint \n Headers: ${json.encode(headers)} \n JsonData: ${json.encode(requestBody)}');

    final response = await http
        .put(
      Uri.parse(endpoint),
      headers: headers,
      body: json.encode(requestBody),
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        logger('Timeout occurred. Please try again later.');
        return http.Response('Timeout occurred', 504);
      },
    );

    logger('Api Response: [${response.statusCode}] ${response.body}');

    return response;
  } catch (e) {
    if (e is TimeoutException) {
      logger('Timeout occurred. Please try again later.');
      return http.Response('Timeout occurred', 504);
    } else {
      logger('An error occurred during the HTTP request: $e');
      return http.Response('Internal server error', 500);
    }
  }
}

/// Http delete request
Future<http.Response> makeApiDeleteRequest(
  String endpoint,
  Map<String, String> headers,
) async {
  endpoint = ApiConstants.songliveApi + endpoint;
  try {
    logger(
        'Api Request [DELETE]: $endpoint \n Headers: ${json.encode(headers)}');

    final response = await http
        .delete(
      Uri.parse(endpoint),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        logger('Timeout occurred. Please try again later.');
        return http.Response('Timeout occurred', 504);
      },
    );

    logger('Api Response: [${response.statusCode}] ${response.body}');

    return response;
  } catch (e) {
    if (e is TimeoutException) {
      logger('Timeout occurred. Please try again later.');
      return http.Response('Timeout occurred', 504);
    } else {
      logger('An error occurred during the HTTP request: $e');
      return http.Response('Internal server error', 500);
    }
  }
}
