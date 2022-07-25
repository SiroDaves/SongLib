import 'package:json_annotation/json_annotation.dart';

part 'listed.g.dart';

@JsonSerializable(explicitToJson: true)
class Listed {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  final String objectId;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;
  @JsonKey(name: 'description', required: true, includeIfNull: false)
  final String description;
  @JsonKey(name: 'parentid', required: true, includeIfNull: false)
  final int? parentid;
  @JsonKey(name: 'position', required: true, includeIfNull: false)
  final int? position;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  final String createdAt;
  @JsonKey(name: 'updatedAt', required: true, includeIfNull: false)
  final String updatedAt;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;

  const Listed({
    required this.objectId,
    required this.title,
    required this.description,
    required this.parentid,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    this.id,
  });

  factory Listed.fromJson(Map<String, dynamic> json) => _$ListedFromJson(json);

  Map<String, dynamic> toJson() => _$ListedToJson(this);

}
