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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['validate_icon_for_personal_info'] = validateIconForPersonalInfo;
    data['validate_icon_for_course_info'] = validateIconForCourseInfo;
    data['validate_icon_for_qualification_info'] =
        validateIconForQualificationInfo;
    data['validate_icon_for_work_history'] = validateIconForWorkHistory;
    data['validate_icon_for_english_test'] = validateIconForEnglishTest;
    data['validate_icon_for_other_test'] = validateIconForOtherTest;
    data['validate_icon_for_passport'] = validateIconForPassport;
    data['validate_icon_for_travel_history'] =
        validateIconForTravelHistory;
    data['validate_icon_for_relative_info'] = validateIconForRelativeInfo;
    data['totalPercentageComplete'] = totalPercentageComplete;
    return data;
  }
}
