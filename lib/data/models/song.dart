import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/constants/app_constants.dart';

part 'song.g.dart';

@Entity(tableName: AppConstants.songsTable)
@JsonSerializable()

class Song {
  @PrimaryKey(autoGenerate: true)
  int? rid;
  int? id;
  String? objectId;
  int? book;
  int? songNo;
  String? title;
  String? alias;
  String? content;
  String? key;
  String? author;
  int? views;
  int? likes;
  bool? liked;
  String? createdAt;
  String? updatedAt;

  Song({
    this.id,
    this.objectId,
    this.book,
    this.songNo,
    this.title,
    this.alias,
    this.content,
    this.key,
    this.author,
    this.views,
    this.likes,
    this.liked,
    this.createdAt,
    this.updatedAt,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}

