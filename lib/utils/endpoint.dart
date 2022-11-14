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
}

getaddCourseInformationPart3(int index, int courseBroadId, int courseNarrowId) {
  return "&added_courses[$index][course_broad_id]=$courseBroadId&added_courses[$index][course_narrow_id]=$courseNarrowId";
}
