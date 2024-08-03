class RespModel {
  int status;
  String feedback;
  dynamic response;

  RespModel({this.status = 0, this.feedback = '', this.response});
}

class UpdateModel {
  bool found;
  String version;
  String description;

  UpdateModel({this.found = false, this.version = '', this.description = ''});
}
