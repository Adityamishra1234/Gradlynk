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
}
