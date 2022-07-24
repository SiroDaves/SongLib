// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'objectId',
      'book',
      'songno',
      'title',
      'alias',
      'content',
      'key',
      'author',
      'views',
      'createdAt',
      'updatedAt'
    ],
  );
  return Song(
    objectId: json['objectId'] as String,
    book: json['book'] as int?,
    songno: json['songno'] as int?,
    title: json['title'] as String,
    alias: json['alias'] as String,
    content: json['content'] as String,
    key: json['key'] as String,
    author: json['author'] as String,
    views: json['views'] as int?,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$SongToJson(Song instance) {
  final val = <String, dynamic>{
    'objectId': instance.objectId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('book', instance.book);
  writeNotNull('songno', instance.songno);
  val['title'] = instance.title;
  val['alias'] = instance.alias;
  val['content'] = instance.content;
  val['key'] = instance.key;
  val['author'] = instance.author;
  writeNotNull('views', instance.views);
  val['createdAt'] = instance.createdAt;
  val['updatedAt'] = instance.updatedAt;
  writeNotNull('id', instance.id);
  return val;
}
