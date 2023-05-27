class ProfileDataValidatorModel {
  String? validateIconForPersonalInfo;
  String? validateIconForCourseInfo;
  String? validateIconForQualificationInfo;
  String? validateIconForWorkHistory;
  String? validateIconForEnglishTest;
  String? validateIconForOtherTest;
  String? validateIconForPassport;
  String? validateIconForTravelHistory;
  String? validateIconForRelativeInfo;
  int? totalPercentageComplete;

  ProfileDataValidatorModel(
      {this.validateIconForPersonalInfo,
      this.validateIconForCourseInfo,
      this.validateIconForQualificationInfo,
      this.validateIconForWorkHistory,
      this.validateIconForEnglishTest,
      this.validateIconForOtherTest,
      this.validateIconForPassport,
      this.validateIconForTravelHistory,
      this.validateIconForRelativeInfo,
      this.totalPercentageComplete});

  ProfileDataValidatorModel.fromJson(Map<String, dynamic> json) {
    validateIconForPersonalInfo = json['validate_icon_for_personal_info'];
    validateIconForCourseInfo = json['validate_icon_for_course_info'];
    validateIconForQualificationInfo =
        json['validate_icon_for_qualification_info'];
    validateIconForWorkHistory = json['validate_icon_for_work_history'];
    validateIconForEnglishTest = json['validate_icon_for_english_test'];
    validateIconForOtherTest = json['validate_icon_for_other_test'];
    validateIconForPassport = json['validate_icon_for_passport'];
    validateIconForTravelHistory = json['validate_icon_for_travel_history'];
    validateIconForRelativeInfo = json['validate_icon_for_relative_info'];
    totalPercentageComplete = json['totalPercentageComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['validate_icon_for_personal_info'] = this.validateIconForPersonalInfo;
    data['validate_icon_for_course_info'] = this.validateIconForCourseInfo;
    data['validate_icon_for_qualification_info'] =
        this.validateIconForQualificationInfo;
    data['validate_icon_for_work_history'] = this.validateIconForWorkHistory;
    data['validate_icon_for_english_test'] = this.validateIconForEnglishTest;
    data['validate_icon_for_other_test'] = this.validateIconForOtherTest;
    data['validate_icon_for_passport'] = this.validateIconForPassport;
    data['validate_icon_for_travel_history'] =
        this.validateIconForTravelHistory;
    data['validate_icon_for_relative_info'] = this.validateIconForRelativeInfo;
    data['totalPercentageComplete'] = this.totalPercentageComplete;
    return data;
  }
}
