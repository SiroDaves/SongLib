import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable(explicitToJson: true)
class History {
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  String? objectId;
  @JsonKey(name: 'song', required: true, includeIfNull: false)
  int? song;
  @JsonKey(name: 'createdAt', required: true, includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;

  History({
    this.objectId,
    this.song,
    this.createdAt,
    this.id,
  });

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
