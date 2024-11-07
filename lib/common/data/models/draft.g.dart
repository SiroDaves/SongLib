// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Draft _$DraftFromJson(Map<String, dynamic> json) => Draft(
      rid: (json['rid'] as num?)?.toInt(),
      songId: (json['songId'] as num?)?.toInt(),
      songNo: (json['songNo'] as num?)?.toInt(),
      title: json['title'] as String?,
      alias: json['alias'] as String?,
      content: json['content'] as String?,
      views: (json['views'] as num?)?.toInt(),
      likes: (json['likes'] as num?)?.toInt(),
      liked: json['liked'] as bool?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$DraftToJson(Draft instance) => <String, dynamic>{
      'rid': instance.rid,
      'songId': instance.songId,
      'songNo': instance.songNo,
      'title': instance.title,
      'alias': instance.alias,
      'content': instance.content,
      'views': instance.views,
      'likes': instance.likes,
      'liked': instance.liked,
      'created': instance.created,
      'updated': instance.updated,
    };
