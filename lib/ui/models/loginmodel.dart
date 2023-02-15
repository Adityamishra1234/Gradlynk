class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  int? enqId;
  int? mobile;

  String? createdAt;
  String? updatedAt;

  int? isBlocked;

  User(
      {this.id,
      this.name,
      this.email,
      this.enqId,
      this.mobile,
      this.createdAt,
      this.updatedAt,
      this.isBlocked});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    enqId = json['enq_id'];
    mobile = json['mobile'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    isBlocked = json['is_blocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['enq_id'] = enqId;
    data['mobile'] = mobile;

    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    data['is_blocked'] = isBlocked;
    return data;
  }
}
