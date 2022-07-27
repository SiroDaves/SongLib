import 'package:json_annotation/json_annotation.dart';

part 'listed.g.dart';

@JsonSerializable(explicitToJson: true)
class Listed {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'parentid', required: true, includeIfNull: false)
  int? parentid;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  String? title;
  @JsonKey(name: 'description', required: true, includeIfNull: false)
  String? description;
  @JsonKey(name: 'position', required: true, includeIfNull: false)
  int? position;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updatedAt', required: true, includeIfNull: false)
  String? updatedAt;
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;

  Listed({
    this.objectId,
    this.parentid,
    this.title,
    this.description,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory Listed.fromJson(Map<String, dynamic> json) => _$ListedFromJson(json);

  Map<String, dynamic> toJson() => _$ListedToJson(this);
}
