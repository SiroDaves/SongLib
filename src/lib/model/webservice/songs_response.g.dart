// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongsResponse _$SongsResponseFromJson(Map<String, dynamic> json) =>
    SongsResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SongsResponseToJson(SongsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}
