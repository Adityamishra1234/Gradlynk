class MarkAttendanceModel {
  String? status;
  bool? uniqueCodeMatch;
  bool? attendanceMarked;
  int? campaignId;

  MarkAttendanceModel(
      {this.status,
      this.uniqueCodeMatch,
      this.attendanceMarked,
      this.campaignId});

  MarkAttendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    uniqueCodeMatch = json['unique_code_match'];
    attendanceMarked = json['attendance_marked'];
    campaignId = json['campaign_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['unique_code_match'] = uniqueCodeMatch;
    data['attendance_marked'] = attendanceMarked;
    data['campaign_id'] = campaignId;
    return data;
  }
}
