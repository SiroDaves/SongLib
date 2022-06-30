import 'dart:async';

import 'package:http/http.dart' as http;

import '../exports.dart';

Future<EventObject> httpGet({
  required http.Client client,
  required String url,
}) async {
  final http.Response response;
  try {
    response = await client.get(
      Uri.parse(ApiConstants.parseUrl + url),
      headers: <String, String>{
        'X-Parse-Application-Id': ApiConstants.parseAppID,
        'X-Parse-REST-API-Key': ApiConstants.parseApiKey,
        'Content-Type': 'application/json',
      },
    );

    // ignore: avoid_print
    print(
        'Request: ${ApiConstants.parseUrl}$url \nStatusCode: ${response.statusCode}\nResponse: ${response.body}');

    switch (response.statusCode) {
      case 200:
      case 201:
        return EventObject(
          id: EventConstants.requestSuccessful,
          response: response.body,
        );
      case 400:
      case 401:
        return EventObject(
          id: EventConstants.requestUnsuccessful,
          response: response.body,
        );
      default:
        throw Exception('Oops! Invalid response');
    }
  } catch (exception) {
    throw Exception('Oops! Invalid response');
  }
}
