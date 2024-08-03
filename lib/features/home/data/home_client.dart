import 'dart:async';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../common/data/models/response_model.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_constants.dart';

class HomeClient {
  Future<RespModel> checkPlaystoreVersion() async {
    String feedback = '', version = '', description = '';
    Response response = await http.get(Uri.parse(AppConstants.playStoreUrl));
    logger('Api Request [GET]: ${AppConstants.playStoreUrl}');
    if (response.statusCode == 200) {
      // Parse the HTML document
      int startIndex = response.body.indexOf("Version");
      int endIndex = response.body.indexOf("FEEDBACK/SUPPORT");
      var updateText = response.body.substring(startIndex, endIndex).trim();
      List<String> parts = updateText.split('<br>');

      // Extract the version and description
      version = parts[0].trim().replaceAll('Version', '');
      description = parts.sublist(1).join('<br>').trim();

      // Return as a map
      feedback = 'version: $version, description: $description';
    } else {
      feedback = 'Failed to fetch Play Store page: ${response.statusCode}';
    }
    return RespModel(
      status: response.statusCode,
      feedback: feedback,
      response: {'version': version, 'description': description},
    );
  }
}
