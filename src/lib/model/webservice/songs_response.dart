import 'package:json_annotation/json_annotation.dart';

import '../base/song.dart';

part 'songs_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SongsResponse {
  @JsonKey(name: 'results', includeIfNull: false)
  List<Song>? results;

  SongsResponse({this.results});

  factory SongsResponse.fromJson(Map<String, dynamic> json) => _$SongsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SongsResponseToJson(this);
}