class UserHistory {
  UserHistory({
    required this.id,
    required this.userId,
    required this.loginTime,
    required this.logoutTime,
    required this.reason,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? id;
  late final int? userId;
  late final String? loginTime;
  late final String? logoutTime;
  late final String? reason;
  late final String? createdAt;
  late final String? updatedAt;

  UserHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    loginTime = json['login_time'];
    logoutTime = json['logout_time'];
    reason = json['reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['login_time'] = loginTime;
    data['logout_time'] = logoutTime;
    data['reason'] = reason;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
