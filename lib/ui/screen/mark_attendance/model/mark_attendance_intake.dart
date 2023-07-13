class MarkAttendanceIntake {
  String? status;
  String? message;
  bool? documentExists;
  String? studentCategory;

  MarkAttendanceIntake(
      {this.status, this.message, this.documentExists, this.studentCategory});

  MarkAttendanceIntake.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    documentExists = json['document_exists'];
    studentCategory = json['student_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['document_exists'] = documentExists;
    data['student_category'] = studentCategory;
    return data;
  }
}
