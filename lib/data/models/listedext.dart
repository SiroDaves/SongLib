import 'package:floor/floor.dart';

import '../../common/utils/constants/app_constants.dart';

@DatabaseView(
  '${AppConstants.listedExtSql};',
  viewName: AppConstants.listsTableViews,
)
class ListedExt {
  int? parentid;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? id;
  int? song;
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
  int? songId;
  String? songbook;

  ListedExt({
    this.parentid,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.song,
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
    this.songId,
    this.songbook,
  });
}
