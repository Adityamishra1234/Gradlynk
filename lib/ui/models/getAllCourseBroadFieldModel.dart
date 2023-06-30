class GetAllCourseBroadFieldModel {
  int? id;
  String? broadFieldName;
  String? imageLink;

  GetAllCourseBroadFieldModel({this.id, this.broadFieldName, this.imageLink});

  GetAllCourseBroadFieldModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    broadFieldName = json['broad_field_name'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['broad_field_name'] = this.broadFieldName;
    data['image_link'] = this.imageLink;
    return data;
  }
}
