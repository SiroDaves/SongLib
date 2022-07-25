import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable(explicitToJson: true)
class Search {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  final String objectId;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  final String createdAt;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;

  const Search({
    required this.objectId,
    required this.title,
    required this.createdAt,
    this.id,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);

}
