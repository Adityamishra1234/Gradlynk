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
    final data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['token'] = token;
    return data;
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['emp_id'] = empId;
    data['name'] = name;
    data['email'] = email;
    data['email_password'] = emailPassword;
    data['email_verified_at'] = emailVerifiedAt;
    data['profile_photo'] = profilePhoto;
    data['mac_address'] = macAddress;
    data['ip_address'] = ipAddress;
    data['token_id'] = tokenId;
    data['last_online'] = lastOnline;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_user_active'] = isUserActive;
    return data;
  }
}
