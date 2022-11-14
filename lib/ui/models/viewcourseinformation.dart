class ViewCourseInformation {
  int? courseBroadId;
  int? courseNarrowId;
  String? broadFieldName;
  String? narrowFieldName;

  ViewCourseInformation(
      {this.courseBroadId,
      this.courseNarrowId,
      this.broadFieldName,
      this.narrowFieldName});

  ViewCourseInformation.fromJson(Map<String, dynamic> json) {
    courseBroadId = json['course_broad_id'];
    courseNarrowId = json['course_narrow_id'];
    broadFieldName = json['broad_field_name'];
    narrowFieldName = json['narrow_field_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_broad_id'] = courseBroadId;
    data['course_narrow_id'] = courseNarrowId;
    data['broad_field_name'] = broadFieldName;
    data['narrow_field_name'] = narrowFieldName;
    return data;
  }
}
