import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable(explicitToJson: true)
class Search {
  @JsonKey(name: 'objectId', includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  String? title;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;

  Search({
    this.objectId,
    this.title,
    this.createdAt,
    this.id,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
