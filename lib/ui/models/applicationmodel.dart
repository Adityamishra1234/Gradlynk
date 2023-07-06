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
  String? stageName;
  String? statusName;

  ApplicationSummaryModel(
      {this.id,
      this.courseId,
      this.universityName,
      this.countryName,
      this.courseLevel,
      this.courseName,
      this.campusName,
      this.stageId,
      this.stageName,
      this.statusName,
      this.statusId});

  ApplicationSummaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stageName = json['stage_name'];
    statusName = json['status_name'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stage_name'] = stageName;
    data['status_name'] = statusName;
    data['courseId'] = courseId;
    data['university_name'] = universityName;
    data['country_name'] = countryName;
    data['course_level'] = courseLevel;
    data['course_name'] = courseName;
    data['campus_name'] = campusName;
    data['stageId'] = stageId;
    data['statusId'] = statusId;
    return data;
  }
}
