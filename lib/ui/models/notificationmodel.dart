class NotificationModel {
  int? id;
  int? notificationType;
  String? notificationTitle;
  String? notificationBody;
  int? notificationTarget;
  int? notificationReadBy;
  int? isActive;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  NotificationModel(
      {this.id,
      this.notificationType,
      this.notificationTitle,
      this.notificationBody,
      this.notificationTarget,
      this.notificationReadBy,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationType = json['notification_type'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationTarget = json['notification_target'];
    notificationReadBy = json['notification_read_by'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['notification_type'] = notificationType;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['notification_target'] = notificationTarget;
    data['notification_read_by'] = notificationReadBy;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
