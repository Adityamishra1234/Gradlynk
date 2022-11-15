class QualificationDetailsViewModel {
  double? grade;
  double? multiplier;
  String? applicantType;
  int? qualificationId;
  int? streamId;
  int? countryId;
  int? cityId;
  int? stateId;
  int? affiliationId;
  int? passingInstId;
  String? educationStatus;
  int? yearOfPassing;
  int? percentage;
  int? reapperCount;
  String? courseLevel;
  String? streamName;
  String? countryName;
  String? stateName;
  String? cityName;
  String? affiliationName;
  String? universityName;
  String? courseName;

  QualificationDetailsViewModel(
      {this.grade,
      this.multiplier,
      this.applicantType,
      this.qualificationId,
      this.streamId,
      this.countryId,
      this.cityId,
      this.stateId,
      this.affiliationId,
      this.passingInstId,
      this.educationStatus,
      this.yearOfPassing,
      this.percentage,
      this.reapperCount,
      this.courseLevel,
      this.streamName,
      this.countryName,
      this.stateName,
      this.cityName,
      this.affiliationName,
      this.universityName,
      this.courseName});

  QualificationDetailsViewModel.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    multiplier = json['multiplier'];
    applicantType = json['applicant_type'];
    qualificationId = json['qualification_id'];
    streamId = json['stream_id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    affiliationId = json['affiliation_id'];
    passingInstId = json['passing_inst_id'];
    educationStatus = json['education_status'];
    yearOfPassing = json['year_of_passing'];
    percentage = json['percentage'];
    reapperCount = json['reapper_count'];
    courseLevel = json['course_level'];
    streamName = json['stream_name'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    affiliationName = json['affiliation_name'];
    universityName = json['university_name'];
    courseName = json['course_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grade'] = grade;
    data['multiplier'] = multiplier;
    data['applicant_type'] = applicantType;
    data['qualification_id'] = qualificationId;
    data['stream_id'] = streamId;
    data['country_id'] = countryId;
    data['city_id'] = cityId;
    data['state_id'] = stateId;
    data['affiliation_id'] = affiliationId;
    data['passing_inst_id'] = passingInstId;
    data['education_status'] = educationStatus;
    data['year_of_passing'] = yearOfPassing;
    data['percentage'] = percentage;
    data['reapper_count'] = reapperCount;
    data['course_level'] = courseLevel;
    data['stream_name'] = streamName;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    data['affiliation_name'] = affiliationName;
    data['university_name'] = universityName;
    data['course_name'] = courseName;
    return data;
  }
}
