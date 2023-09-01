import 'package:drift/drift.dart';

class Search {
  int? id;
  int? searchId;
  String? title;
  String? created;

  Search({
    this.id,
    this.searchId,
    this.title,
    this.created,
  });

  Search.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    searchId = json['searchId'];
    title = json['title'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['searchId'] = searchId;
    data['title'] = title;
    data['created'] = created;
    return data;
  }

  factory Search.fromData(Map<String, dynamic> data) {
    return Search(
      id: const IntType().mapFromDatabaseResponse(data['id'])!,
      searchId: const IntType().mapFromDatabaseResponse(data['search_id'])!,
      title: const StringType().mapFromDatabaseResponse(data['title'])!,
      created:
          const StringType().mapFromDatabaseResponse(data['created'])!,
    );
  }
}
