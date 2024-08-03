import 'dart:async';

import '../../../common/data/models/response_model.dart';
import '../data/home_client.dart';

class HomeRepository {
  final client = HomeClient();

  Future<RespModel> checkPlaystoreVersion() async {
    return await client.checkPlaystoreVersion();
  }

}
