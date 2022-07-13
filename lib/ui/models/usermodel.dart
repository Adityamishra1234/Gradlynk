class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;

  UserModel.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.empId,
    required this.name,
    required this.email,
    required this.emailPassword,
    this.emailVerifiedAt,
    required this.profilePhoto,
    this.macAddress,
    this.ipAddress,
    this.tokenId,
    this.lastOnline,
    this.createdAt,
    required this.updatedAt,
    required this.isUserActive,
  });
  late final int? id;
  late final int? empId;
  late final String? name;
  late final String? email;
  late final String? emailPassword;
  late final String? emailVerifiedAt;
  late final String? profilePhoto;
  late final String? macAddress;
  late final String? ipAddress;
  late final String? tokenId;
  late final String? lastOnline;
  late final String? createdAt;
  late final String? updatedAt;
  late final int? isUserActive;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empId = json['emp_id'];
    name = json['name'];
    email = json['email'];
    emailPassword = json['email_password'];
    emailVerifiedAt = json['emailVerifiedAt'];
    profilePhoto = json['profile_photo'];
    macAddress = json['macAddress'];
    ipAddress = json['ipAddress'];
    tokenId = json['tokenId'];
    lastOnline = json['lastOnline'];
    createdAt = json['createdA'];
    updatedAt = json['updated_at'];
    isUserActive = json['is_user_active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['emp_id'] = empId;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_password'] = emailPassword;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['profile_photo'] = profilePhoto;
    _data['mac_address'] = macAddress;
    _data['ip_address'] = ipAddress;
    _data['token_id'] = tokenId;
    _data['last_online'] = lastOnline;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['is_user_active'] = isUserActive;
    return _data;
  }
}
