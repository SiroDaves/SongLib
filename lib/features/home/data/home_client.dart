import 'dart:async';

import 'package:http/http.dart';

import '../../../common/utils/api_util.dart';
import '../../../common/utils/constants/app_constants.dart';

class HomeClient {
  Future<Response> checkPlaystoreVersion() async {
    return await makeApiGetRequest(
      AppConstants.playstoreLink,
      {
        'Content-Type': 'application/json',
      },
    );
  }
}
