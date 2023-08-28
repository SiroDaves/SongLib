import 'package:drift/drift.dart';

class ListedExt {
  int? parentid;
  int? position;
  String? created;
  String? updated;
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
    this.created,
    this.updated,
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

  factory ListedExt.fromData(Map<String, dynamic> data) {
    return ListedExt(
      parentid: const IntType().mapFromDatabaseResponse(data['parentid'])!,
      position: const IntType().mapFromDatabaseResponse(data['position'])!,
      created:
          const StringType().mapFromDatabaseResponse(data['created'])!,
      updated:
          const StringType().mapFromDatabaseResponse(data['updated'])!,
      id: const IntType().mapFromDatabaseResponse(data['id'])!,
      book: const IntType().mapFromDatabaseResponse(data['book'])!,
      song: const IntType().mapFromDatabaseResponse(data['song'])!,
      songNo: const IntType().mapFromDatabaseResponse(data['song_no'])!,
      title: const StringType().mapFromDatabaseResponse(data['title'])!,
      alias: const StringType().mapFromDatabaseResponse(data['alias'])!,
      content: const StringType().mapFromDatabaseResponse(data['content'])!,
      key: const StringType().mapFromDatabaseResponse(data['key'])!,
      author: const StringType().mapFromDatabaseResponse(data['author'])!,
      views: const IntType().mapFromDatabaseResponse(data['views'])!,
      likes: const IntType().mapFromDatabaseResponse(data['likes'])!,
      liked: const BoolType().mapFromDatabaseResponse(data['liked'])!,
      songId: const IntType().mapFromDatabaseResponse(data['songId'])!,
      songbook: const StringType().mapFromDatabaseResponse(data['songbook'])!,
    );
  }
}
