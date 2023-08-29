import 'package:drift/drift.dart';

class Draft {
  int? id;
  int? draftId;
  int? user;
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
  String? created;
  String? updated;

  Draft({
    this.id,
    this.draftId,
    this.user,
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
    this.created,
    this.updated,
  });

  Draft.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    draftId = json['draftId'];
    book = json['book'];
    songNo = json['songNo'];
    title = json['title'];
    alias = json['alias'];
    content = json['content'];
    key = json['key'];
    author = json['author'];
    views = json['views'];
    likes = json['likes'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['draftId'] = draftId;
    data['user'] = user;
    data['book'] = book;
    data['songNo'] = songNo;
    data['title'] = title;
    data['alias'] = alias;
    data['content'] = content;
    data['key'] = key;
    data['author'] = author;
    data['views'] = views;
    data['likes'] = likes;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }

  factory Draft.fromData(Map<String, dynamic> data) {
    return Draft(
      id: const IntType().mapFromDatabaseResponse(data['id'])!,
      draftId: const IntType().mapFromDatabaseResponse(data['draft_id'])!,
      user: const IntType().mapFromDatabaseResponse(data['user'])!,
      book: const IntType().mapFromDatabaseResponse(data['book'])!,
      songNo: const IntType().mapFromDatabaseResponse(data['song_no'])!,
      title: const StringType().mapFromDatabaseResponse(data['title'])!,
      alias: const StringType().mapFromDatabaseResponse(data['alias'])!,
      content: const StringType().mapFromDatabaseResponse(data['content'])!,
      key: const StringType().mapFromDatabaseResponse(data['key'])!,
      author: const StringType().mapFromDatabaseResponse(data['author'])!,
      views: const IntType().mapFromDatabaseResponse(data['views'])!,
      created:
          const StringType().mapFromDatabaseResponse(data['created'])!,
      updated:
          const StringType().mapFromDatabaseResponse(data['updated'])!,
      liked: const BoolType().mapFromDatabaseResponse(data['liked'])!,
    );
  }
}
