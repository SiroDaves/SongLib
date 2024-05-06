import 'package:floor/floor.dart';

import '../../common/utils/constants/app_constants.dart';

@DatabaseView(
  AppConstants.songExtSql,
  viewName: AppConstants.viewTableSongs,
)
class SongExt {
  int rid;
  int book;
  int songId;
  int songNo;
  String title;
  String alias;
  String content;
  int views;
  int likes;
  bool liked;
  String songbook;

  SongExt(
    this.rid,
    this.book,
    this.songId,
    this.songNo,
    this.title,
    this.alias,
    this.content,
    this.views,
    this.likes,
    this.liked,
    this.songbook,
  );
}
