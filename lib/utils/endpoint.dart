class Endpoints {
  static String? baseUrl = "http://14.97.86.202:205/api/";
  //http://192.168.104.204:205/api/get-course-broad-field
  //http://192.168.104.204:205/api/get-country
  // static String? baseUrl = "http://192.168.104.204:205/api/";
  static String? login = "student-panel-login";
  static String? logout = "logout";
  static String? userHistory = "login-logout-history";
  static String? getUserHistory = 'get-login-logout-history';
  static String? upcomingEvents = 'get-upcoming-events';
  static String? newsAndUpdate = 'get-siec-news-and-update';
  static String? notificationForUser = 'get-notification-for-user';
  static String? upcomingHolidays = 'get-upcoming-holidays';
  static String? country = 'get-country';
  static String? state = 'get-state?country=';
  static String? city = 'get-city?state=';
  static String? courselevel = 'get-course-level';
  static String? courseBoardField = 'get-course-broad-field';
  static String? courseNarrowField = 'get-course-narrow-field?broad_field_id=';
  static String? courseSearchPart1 = 'get-course-search-data?country=';
  static String? courseSearchPart2 = '&course_level=';
  static String? completeCoursePart1 = 'get-course-details?university_id=';
  static String? completeCoursePart2 = '&course_id=';
  static String? completeCoursePart3 = '&institute_course_id=';
  static String? courseShortList = 'edit-course-shortlist?';
  static String? finalCourseShortList = 'edit-course-final-shortlist?';
  static String? courseShortListDetail = 'get-shortlist-course?';
  static String? applicationSummary = 'get-application?';
  static String? finalShortListDetail = 'get-shortlist-course?is_final=1&';
  static String? applicationDetail = 'get-application-detail?apli_id=';
  static String? personalDetailUpdate = 'update-personal-details';
  static String? courseNarrowFieldProfile = 'get-all-course-narrow-field';
  static String? courseBroadFieldByNarrowField =
      'get-course-broad-field-by-narrow-field?narrow_field_id=';
  static String? viewCourseInformation = 'view-course-information?enq_id=';
  static String? addCourseInformationPart1 = "add-course-information?enq_id=";
  static String? addCourseInformationPart2 = "&course_level=";
  static String? highestQualification = "get-course-level";
  static String? viewCourseStream = "view-course-stream";
  static String? instituteForCity = "get-institute-for-city?city_id=";
  static String? affiliationForCountry =
      "get-affiliation-for-country?country_id=";
  static String? viewQualificationDetails =
      "view-qualification-details?enq_id=";
  static String? addQualification = "add-qualification-details/?enq_id=";
  //
  static String? gender = "get-gender";
  static String? examNameOtherTest = "get-other-exam-name";
  static String? examName = "get-exam-name";
  static String? examStatus = "get-exam-status";
  static String? employmentType = "get-employement-type";
  static String? yearofpassing = "get-year-of-passing";
  static String? educationStatus = "get-education-status";
  static String? maritalStatus = "get-marital-status";
  static String? jobInstitute = "get-job-institute";
  static String? viewEnglishTestDetails = "view-english-test-details?enq_id=";
  static String? viewOtherTestDetails = "view-other-test-details?enq_id=";
  static String? viewWorkHistoryDetails = "view-work-history-details?enq_id=";
  static String? addworkHistoryDetailsPart1 =
      "add-work-history-details?enq_id=";
}

getaddCourseInformationPart3(int index, int courseBroadId, int courseNarrowId) {
  return "&added_courses[$index][course_broad_id]=$courseBroadId&added_courses[$index][course_narrow_id]=$courseNarrowId";
}

getAddQualificationPart2(
  int index,
  int? qualificationId,
  String? courseName,
  int cityId,
  int stateId,
  int countryId,
  int reapperCount,
  int grade,
  int multiplier,
  int percentage,
  int paasingInstId,
  int streamId,
  int affiliationId,
  String educationStatus,
  int yearOfPassing,
) {
  return "&added_qualification[$index][qualification_id]=$qualificationId&added_qualification[$index][course_name]=$courseName&added_qualification[$index][city_id]=$cityId&added_qualification[$index][state_id]$stateId&added_qualification[$index][country_id]=$countryId&added_qualification[$index][reapper_count]=$reapperCount&added_qualification[$index][grade]=$grade&added_qualification[$index][multiplier]=$multiplier&added_qualification[$index][percentage]=$percentage&added_qualification[$index][passing_inst_id]=$paasingInstId&added_qualification[$index][stream_id]=$streamId&added_qualification[$index][affiliation_id]=$affiliationId&added_qualification[$index][education_status]=$educationStatus&added_qualification[$index][year_of_passing]=$yearOfPassing";
}

addWorkHistoryPart2(
    String? workingFrom,
    String? workingTill,
    String? jobType,
    String? organisationName,
    String? jobRole,
    String? jobIndustriesId,
    String? income,
    int index) {
  return "&added_work_history[$index][working_from]=$workingFrom&added_work_history[$index][working_till]=$workingTill&added_work_history[$index][job_type]=$jobType&added_work_history[$index][organisation_name]=$organisationName&added_work_history[$index][job_role]=$jobRole&added_work_history[$index][job_industry_id]=$jobIndustriesId&added_work_history[$index][income]=$income";
}
