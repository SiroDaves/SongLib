class Song {
  String? objectId;
  int? book;
  int? songno;
  String? title;
  String? alias;
  String? content;
  String? key;
  String? author;
  int? views;
  String? createdAt;
  String? updatedAt;

  Song({
    this.objectId,
    this.book,
    this.songno,
    this.title,
    this.alias,
    this.content,
    this.key,
    this.author,
    this.views,
    this.createdAt,
    this.updatedAt,
  });

  Song.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    book = json['book'];
    songno = json['songno'];
    title = json['title'];
    alias = json['alias'];
    content = json['content'];
    key = json['key'];
    author = json['author'];
    views = json['views'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['book'] = book;
    data['songno'] = songno;
    data['title'] = title;
    data['alias'] = alias;
    data['content'] = content;
    data['key'] = key;
    data['author'] = author;
    data['views'] = views;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
