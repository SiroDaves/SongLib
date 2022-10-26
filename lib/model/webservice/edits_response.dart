import 'package:json_annotation/json_annotation.dart';

import '../base/edit.dart';

part 'edits_response.g.dart';

@JsonSerializable(explicitToJson: true)
class EditsResponse {
  @JsonKey(name: 'results', includeIfNull: false)
  List<Edit>? results;

  EditsResponse({this.results});

  factory EditsResponse.fromJson(Map<String, dynamic> json) => _$EditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditsResponseToJson(this);
}