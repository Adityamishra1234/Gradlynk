class VisaSummaryModel {
  int? applicationId;
  String? country;
  String? universityName;
  String? stageName;
  int? statusId;

  VisaSummaryModel(
      {this.applicationId,
      this.country,
      this.universityName,
      this.stageName,
      this.statusId});

  VisaSummaryModel.fromJson(Map<String, dynamic> json) {
    applicationId = json['application id'];
    country = json['country'];
    universityName = json['university_name'];
    stageName = json['stage_name'];
    statusId = json['status_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['application id'] = applicationId;
    data['country'] = country;
    data['university_name'] = universityName;
    data['stage_name'] = stageName;
    data['status_id'] = statusId;
    return data;
  }
}
