import 'dart:async';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../utils/constants/api_constants.dart';
import '../utils/utilities.dart';

@lazySingleton
abstract class AppWebService {
  @factoryMethod
  factory AppWebService() = AppService;

  Future<Response> fetchBooks();
  Future<Response> fetchEdits(List<int> books);
  Future<Response> fetchSongs(List<int> books);
}

class AppService implements AppWebService {
  @override
  Future<Response> fetchBooks() async {
    return makeApiGetRequest(
      '${ApiConstants.baseUrl}Book',
      {
        'Content-Type': 'application/json',
      },
    );
    /*try {
      final QueryBuilder<ParseObject> parseQuery =
          QueryBuilder<ParseObject>(ParseObject(ApiConstants.book));
      parseQuery
        ..whereEqualTo('enabled', true)
        ..orderByAscending('position');
      final ParseResponse apiResponse = await parseQuery.query();

      if (apiResponse.success && apiResponse.results != null) {
        // ignore: avoid_print
        print('Api Request: ${ApiConstants.parseApiBaseUrl}${ApiConstants.book}');
        // ignore: avoid_print
        print('Api Response: [${apiResponse.statusCode}] ${apiResponse.results}');
        return ParseResp(
          apiResponse.results as List<ParseObject>,
          id: EventConstants.requestSuccessful,
        );
      } else {
        return ParseResp([], id: EventConstants.requestUnsuccessful);
      }
    } on TimeoutException catch (_) {
      return ParseResp([], id: EventConstants.requestTimeout);
    } on Exception {
      return ParseResp([], id: EventConstants.requestUnsuccessful);
    }*/
  }

  @override
  Future<Response> fetchEdits(List<int> books) async {
    /*try {
      final QueryBuilder<ParseObject> parseQuery =
          QueryBuilder<ParseObject>(ParseObject(ApiConstants.song));
      parseQuery
        ..whereContainedIn('book', books)
        ..orderByAscending('songNo')
        ..setLimit(10000);
      final ParseResponse apiResponse = await parseQuery.query();

      if (apiResponse.success && apiResponse.results != null) {
        // ignore: avoid_print
        print('Api Request: ${ApiConstants.parseApiBaseUrl}${ApiConstants.song}');
        // ignore: avoid_print
        print('Api Response: [${apiResponse.statusCode}] ${apiResponse.results}');
        return ParseResp(
          apiResponse.results as List<ParseObject>,
          id: EventConstants.requestSuccessful,
        );
      } else {
        return ParseResp([], id: EventConstants.requestUnsuccessful);
      }
    } on TimeoutException catch (_) {
      return ParseResp([], id: EventConstants.requestTimeout);
    } on Exception {
      return ParseResp([], id: EventConstants.requestUnsuccessful);
    }*/
    return makeApiGetRequest(
      '${ApiConstants.baseUrl}Song',
      {
        'Content-Type': 'application/json',
      },
    );
  }

  @override
  Future<Response> fetchSongs(List<int> books) async {
    return makeApiGetRequest(
      '${ApiConstants.baseUrl}Song',
      {
        'Content-Type': 'application/json',
      },
    );
    /*try {
      final QueryBuilder<ParseObject> parseQuery =
          QueryBuilder<ParseObject>(ParseObject(ApiConstants.song));
      parseQuery
        ..whereContainedIn('book', books)
        ..orderByAscending('songNo')
        ..setLimit(10000);
      final ParseResponse apiResponse = await parseQuery.query();
    }*/
  }

}
