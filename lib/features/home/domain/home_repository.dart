import 'dart:async';

import 'package:http/http.dart';

import '../data/home_client.dart';

class HomeRepository {
  final client = HomeClient();

  Future<Response> checkPlaystoreVersion() async {
    return await client.checkPlaystoreVersion();
  }

}
