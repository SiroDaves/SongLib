import '../exports.dart';

class SongsResponse {
  List<Song>? results;

  SongsResponse({this.results});

  SongsResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Song>[];
      json['results'].forEach((v) {
        results!.add(Song.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
