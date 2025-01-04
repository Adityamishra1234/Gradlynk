/// validate_icon_for_personal_info : "0"
/// validate_icon_for_course_info : "1"
/// validate_icon_for_qualification_info : "1"
/// validate_icon_for_work_history : "1"
/// validate_icon_for_english_test : "1"
/// validate_icon_for_other_test : "0"
/// validate_icon_for_passport : "1"
/// validate_icon_for_travel_history : "0"
/// validate_icon_for_relative_info : "0"
/// totalPercentageComplete : 55

class ProfileValidationModel {
  ProfileValidationModel({
      String? validateIconForPersonalInfo, 
      String? validateIconForCourseInfo, 
      String? validateIconForQualificationInfo, 
      String? validateIconForWorkHistory, 
      String? validateIconForEnglishTest, 
      String? validateIconForOtherTest, 
      String? validateIconForPassport, 
      String? validateIconForTravelHistory, 
      String? validateIconForRelativeInfo, 
      num? totalPercentageComplete,}){
    _validateIconForPersonalInfo = validateIconForPersonalInfo;
    _validateIconForCourseInfo = validateIconForCourseInfo;
    _validateIconForQualificationInfo = validateIconForQualificationInfo;
    _validateIconForWorkHistory = validateIconForWorkHistory;
    _validateIconForEnglishTest = validateIconForEnglishTest;
    _validateIconForOtherTest = validateIconForOtherTest;
    _validateIconForPassport = validateIconForPassport;
    _validateIconForTravelHistory = validateIconForTravelHistory;
    _validateIconForRelativeInfo = validateIconForRelativeInfo;
    _totalPercentageComplete = totalPercentageComplete;
}

  ProfileValidationModel.fromJson(dynamic json) {
    _validateIconForPersonalInfo = json['validate_icon_for_personal_info'];
    _validateIconForCourseInfo = json['validate_icon_for_course_info'];
    _validateIconForQualificationInfo = json['validate_icon_for_qualification_info'];
    _validateIconForWorkHistory = json['validate_icon_for_work_history'];
    _validateIconForEnglishTest = json['validate_icon_for_english_test'];
    _validateIconForOtherTest = json['validate_icon_for_other_test'];
    _validateIconForPassport = json['validate_icon_for_passport'];
    _validateIconForTravelHistory = json['validate_icon_for_travel_history'];
    _validateIconForRelativeInfo = json['validate_icon_for_relative_info'];
    _totalPercentageComplete = json['totalPercentageComplete'];
  }
  String? _validateIconForPersonalInfo;
  String? _validateIconForCourseInfo;
  String? _validateIconForQualificationInfo;
  String? _validateIconForWorkHistory;
  String? _validateIconForEnglishTest;
  String? _validateIconForOtherTest;
  String? _validateIconForPassport;
  String? _validateIconForTravelHistory;
  String? _validateIconForRelativeInfo;
  num? _totalPercentageComplete;
ProfileValidationModel copyWith({  String? validateIconForPersonalInfo,
  String? validateIconForCourseInfo,
  String? validateIconForQualificationInfo,
  String? validateIconForWorkHistory,
  String? validateIconForEnglishTest,
  String? validateIconForOtherTest,
  String? validateIconForPassport,
  String? validateIconForTravelHistory,
  String? validateIconForRelativeInfo,
  num? totalPercentageComplete,
}) => ProfileValidationModel(  validateIconForPersonalInfo: validateIconForPersonalInfo ?? _validateIconForPersonalInfo,
  validateIconForCourseInfo: validateIconForCourseInfo ?? _validateIconForCourseInfo,
  validateIconForQualificationInfo: validateIconForQualificationInfo ?? _validateIconForQualificationInfo,
  validateIconForWorkHistory: validateIconForWorkHistory ?? _validateIconForWorkHistory,
  validateIconForEnglishTest: validateIconForEnglishTest ?? _validateIconForEnglishTest,
  validateIconForOtherTest: validateIconForOtherTest ?? _validateIconForOtherTest,
  validateIconForPassport: validateIconForPassport ?? _validateIconForPassport,
  validateIconForTravelHistory: validateIconForTravelHistory ?? _validateIconForTravelHistory,
  validateIconForRelativeInfo: validateIconForRelativeInfo ?? _validateIconForRelativeInfo,
  totalPercentageComplete: totalPercentageComplete ?? _totalPercentageComplete,
);
  String? get validateIconForPersonalInfo => _validateIconForPersonalInfo;
  String? get validateIconForCourseInfo => _validateIconForCourseInfo;
  String? get validateIconForQualificationInfo => _validateIconForQualificationInfo;
  String? get validateIconForWorkHistory => _validateIconForWorkHistory;
  String? get validateIconForEnglishTest => _validateIconForEnglishTest;
  String? get validateIconForOtherTest => _validateIconForOtherTest;
  String? get validateIconForPassport => _validateIconForPassport;
  String? get validateIconForTravelHistory => _validateIconForTravelHistory;
  String? get validateIconForRelativeInfo => _validateIconForRelativeInfo;
  num? get totalPercentageComplete => _totalPercentageComplete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['validate_icon_for_personal_info'] = _validateIconForPersonalInfo;
    map['validate_icon_for_course_info'] = _validateIconForCourseInfo;
    map['validate_icon_for_qualification_info'] = _validateIconForQualificationInfo;
    map['validate_icon_for_work_history'] = _validateIconForWorkHistory;
    map['validate_icon_for_english_test'] = _validateIconForEnglishTest;
    map['validate_icon_for_other_test'] = _validateIconForOtherTest;
    map['validate_icon_for_passport'] = _validateIconForPassport;
    map['validate_icon_for_travel_history'] = _validateIconForTravelHistory;
    map['validate_icon_for_relative_info'] = _validateIconForRelativeInfo;
    map['totalPercentageComplete'] = _totalPercentageComplete;
    return map;
  }

}