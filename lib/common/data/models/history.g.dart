// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      rid: (json['rid'] as num?)?.toInt(),
      song: (json['song'] as num?)?.toInt(),
      created: json['created'] as String?,
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'rid': instance.rid,
      'song': instance.song,
      'created': instance.created,
    };
