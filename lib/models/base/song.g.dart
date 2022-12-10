// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      objectId: json['objectId'] as String?,
      book: json['book'] as int?,
      songNo: json['songNo'] as int?,
      title: json['title'] as String?,
      alias: json['alias'] as String?,
      content: json['content'] as String?,
      key: json['key'] as String?,
      author: json['author'] as String?,
      views: json['views'] as int?,
      likes: json['likes'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      liked: json['liked'] as bool?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SongToJson(Song instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectId', instance.objectId);
  writeNotNull('book', instance.book);
  writeNotNull('songNo', instance.songNo);
  writeNotNull('title', instance.title);
  writeNotNull('alias', instance.alias);
  writeNotNull('content', instance.content);
  writeNotNull('key', instance.key);
  writeNotNull('author', instance.author);
  writeNotNull('views', instance.views);
  writeNotNull('likes', instance.likes);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('liked', instance.liked);
  writeNotNull('id', instance.id);
  return val;
}
