class FundCalulator {
  int? mstCourseId;
  String? country;
  String? university;
  String? courseName;
  String? courseDuration;
  String? currencySymbol;
  String? atf;
  String? ttf;
  String? haveofferletter;
  String? maritalStatus;

  FundCalulator(
      {this.mstCourseId,
      this.country,
      this.university,
      this.courseName,
      this.courseDuration,
      this.currencySymbol,
      this.atf,
      this.ttf,
      this.haveofferletter,
      this.maritalStatus});

  FundCalulator.fromJson(Map<String, dynamic> json) {
    mstCourseId = json['mstCourseId'];
    country = json['country'];
    university = json['university'];
    courseName = json['course_name'];
    courseDuration = json['course_duration'];
    currencySymbol = json['currency_symbol'];
    atf = json['atf'];
    ttf = json['ttf'];
    haveofferletter = json['haveofferletter'];
    maritalStatus = json['marital_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mstCourseId'] = mstCourseId;
    data['country'] = country;
    data['university'] = university;
    data['course_name'] = courseName;
    data['course_duration'] = courseDuration;
    data['currency_symbol'] = currencySymbol;
    data['atf'] = atf;
    data['ttf'] = ttf;
    data['haveofferletter'] = haveofferletter;
    data['marital_status'] = maritalStatus;
    return data;
  }
}
