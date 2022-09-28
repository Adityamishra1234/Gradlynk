class ApplicationSummaryModel {
  int? id;
  int? courseId;
  String? universityName;
  String? countryName;
  String? courseLevel;
  String? courseName;
  String? campusName;
  int? stageId;
  int? statusId;

  ApplicationSummaryModel(
      {this.id,
      this.courseId,
      this.universityName,
      this.countryName,
      this.courseLevel,
      this.courseName,
      this.campusName,
      this.stageId,
      this.statusId});

  ApplicationSummaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    universityName = json['university_name'];
    countryName = json['country_name'];
    courseLevel = json['course_level'];
    courseName = json['course_name'];
    campusName = json['campus_name'];
    stageId = json['stageId'];
    statusId = json['statusId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    data['university_name'] = this.universityName;
    data['country_name'] = this.countryName;
    data['course_level'] = this.courseLevel;
    data['course_name'] = this.courseName;
    data['campus_name'] = this.campusName;
    data['stageId'] = this.stageId;
    data['statusId'] = this.statusId;
    return data;
  }
}
