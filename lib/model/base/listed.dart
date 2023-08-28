import 'package:drift/drift.dart';

class Listed {
  int? id;
  int? listedId;
  int? parentid;
  int? song;
  String? title;
  String? description;
  int? position;
  String? created;
  String? updated;

  Listed({
    this.id,
    this.listedId,
    this.parentid,
    this.song,
    this.title,
    this.description,
    this.position,
    this.created,
    this.updated,
  });

  Listed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    listedId = json['listedId'];
    parentid = json['parentid'];
    song = json['song'];
    title = json['title'];
    description = json['description'];
    position = json['position'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['listedId'] = listedId;
    data['parentid'] = parentid;
    data['song'] = song;
    data['title'] = title;
    data['description'] = description;
    data['position'] = position;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }

  factory Listed.fromData(Map<String, dynamic> data) {
    return Listed(
      id: const IntType().mapFromDatabaseResponse(data['id'])!,
      listedId: const IntType().mapFromDatabaseResponse(data['listed_id'])!,
      parentid: const IntType().mapFromDatabaseResponse(data['parentid'])!,
      song: const IntType().mapFromDatabaseResponse(data['songCount'])!,
      title: const StringType().mapFromDatabaseResponse(data['title'])!,
      description:
          const StringType().mapFromDatabaseResponse(data['description'])!,
      position: const IntType().mapFromDatabaseResponse(data['position'])!,
      created:
          const StringType().mapFromDatabaseResponse(data['created'])!,
      updated:
          const StringType().mapFromDatabaseResponse(data['updated'])!,
    );
  }
}
