import 'package:json_annotation/json_annotation.dart';

part 'notify.g.dart';

@JsonSerializable(explicitToJson: true)
class Notify {
  @JsonKey(name: 'objectId', includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'title', includeIfNull: false)
  String? title;
  @JsonKey(name: 'message', includeIfNull: false)
  String? message;
  @JsonKey(name: 'image', includeIfNull: false)
  String? image;
  @JsonKey(name: 'views', includeIfNull: false)
  int? views;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  String? updatedAt;

  Notify({
    this.objectId,
    this.title,
    this.message,
    this.image,
    this.views,
    this.createdAt,
    this.updatedAt,
  });

  factory Notify.fromJson(Map<String, dynamic> json) => _$NotifyFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyToJson(this);
}
