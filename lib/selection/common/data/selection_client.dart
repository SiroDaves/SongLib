import 'dart:async';

import 'package:http/http.dart';

import '../../../common/utils/api_util.dart';
import '../../../common/utils/constants/api_constants.dart';

class SelectionClient {
  Future<Response> getBooks() async {
    return await makeApiGetRequest(
      ApiConstants.books,
      {
        'Content-Type': 'application/json',
      },
    );
  }
}
