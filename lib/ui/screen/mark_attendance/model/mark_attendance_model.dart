class MarkAttendanceModel {
  String? status;
  bool? uniqueCodeMatch;
  bool? attendanceMarked;
  int? campaignId;
  String? campaignName;
  String? studentCategory;

  MarkAttendanceModel(
      {this.status,
      this.uniqueCodeMatch,
      this.attendanceMarked,
      this.campaignId,
      this.campaignName,
      this.studentCategory});

  MarkAttendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    uniqueCodeMatch = json['unique_code_match'];
    attendanceMarked = json['attendance_marked'];
    campaignId = json['campaign_id'];
    campaignName = json['campaign_name'];
    studentCategory = json['student_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['unique_code_match'] = this.uniqueCodeMatch;
    data['attendance_marked'] = this.attendanceMarked;
    data['campaign_id'] = this.campaignId;
    data['campaign_name'] = this.campaignName;
    data['student_category'] = this.studentCategory;
    return data;
  }
}
