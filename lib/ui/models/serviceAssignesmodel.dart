class ServiceAssigneersModel {
  int? id;
  String? name;

  ServiceAssigneersModel({this.id, this.name});

  ServiceAssigneersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
