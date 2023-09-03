import 'package:drift/drift.dart';

class Draft {
  int? id;
  int? draftId;
  int? user;
  String? title;
  String? alias;
  String? content;
  String? key;
  String? created;
  String? updated;

  Draft({
    this.id,
    this.draftId,
    this.user,
    this.title,
    this.alias,
    this.content,
    this.key,
    this.created,
    this.updated,
  });

  Draft.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    draftId = json['draftId'];
    title = json['title'];
    alias = json['alias'];
    content = json['content'];
    key = json['key'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['draftId'] = draftId;
    data['user'] = user;
    data['title'] = title;
    data['alias'] = alias;
    data['content'] = content;
    data['key'] = key;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }

  factory Draft.fromData(Map<String, dynamic> data) {
    return Draft(
      id: const IntType().mapFromDatabaseResponse(data['id'])!,
      draftId: const IntType().mapFromDatabaseResponse(data['draft_id'])!,
      user: const IntType().mapFromDatabaseResponse(data['user'])!,
      title: const StringType().mapFromDatabaseResponse(data['title'])!,
      alias: const StringType().mapFromDatabaseResponse(data['alias'])!,
      content: const StringType().mapFromDatabaseResponse(data['content'])!,
      key: const StringType().mapFromDatabaseResponse(data['key'])!,
      created:
          const StringType().mapFromDatabaseResponse(data['created'])!,
      updated:
          const StringType().mapFromDatabaseResponse(data['updated'])!,
    );
  }
}
