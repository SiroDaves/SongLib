// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditsResponse _$EditsResponseFromJson(Map<String, dynamic> json) =>
    EditsResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Edit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EditsResponseToJson(EditsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}
