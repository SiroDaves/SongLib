class Book {
  String? objectId;
  int? bookid;
  int? enabled;
  String? title;
  String? subtitle;
  int? songs;
  int? position;
  String? createdAt;
  String? updatedAt;

  Book({
    this.objectId,
    this.bookid,
    this.enabled,
    this.title,
    this.subtitle,
    this.songs,
    this.position,
    this.createdAt,
    this.updatedAt,
  });

  Book.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    bookid = json['bookid'];
    enabled = json['enabled'];
    title = json['title'];
    subtitle = json['subtitle'];
    songs = json['songs'];
    position = json['position'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['bookid'] = bookid;
    data['enabled'] = enabled;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['songs'] = songs;
    data['position'] = position;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
