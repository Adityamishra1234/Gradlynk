class NewsAndUpdate {
  int? id;
  String? title;
  String? createdAt;

  NewsAndUpdate({this.id, this.title, this.createdAt});

  NewsAndUpdate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['created_at'] = createdAt;
    return data;
  }
}
