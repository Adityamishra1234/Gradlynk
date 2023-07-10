import 'package:flutter/cupertino.dart';

class Endpoints {
  // static String? baseUrl = "https://api.sieceducation.in/api/";
  //http://192.168.104.204:205/api/get-course-broad-field
  //http://192.168.104.204:205/api/get-country
  // static String? baseUrl = "http://192.168.104.204:205/api/";

  static String? baseUrl = "http://14.97.86.202:205/api/";

  static String? dashboard = "student-panel-login?mobile_number=";
  static String? logout = "logout?id=";
  static String? userHistory = "login-logout-history";
  static String? getUserHistory = 'get-login-logout-history';
  static String? upcomingEvents = 'get-upcoming-events';
  static String? newsAndUpdate = 'get-siec-news-and-update';
  static String? notificationForUser = 'get-notification-for-user?user_id=';
  static String? upcomingHolidays = 'get-upcoming-holidays';
  static String? country = 'get-country';
  static String? state = 'get-state?country=';
  static String? city = 'get-city?state=';
  static String? courselevel = 'get-course-level';
  static String? courseBoardField = 'get-course-broad-field';
  static String? courseNarrowField = 'get-course-narrow-field?broad_field_id=';
  static String? courseSearchPart1 = 'get-course-search-data?country=';
  static String? courseSearchPart2 = '&course_level=';
  static String? courseSearchPart3 = '&state=';
  static String? courseSearchPart4 = '&city=';
  static String? courseSearchPart5 = '&broard_field=';
  static String? courseSearchPart6 = '&narrow_filed=';
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
  static String? addQualification = "add-qualification-details?enq_id=";
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
  static String? updateEnglishTesttDetails = "add-english-test-details?enq_id=";
  static String? viewOtherTestDetails = "view-other-test-details?enq_id=";
  static String? viewWorkHistoryDetails = "view-work-history-details?enq_id=";
  static String? addworkHistoryDetailsPart1 =
      "add-work-history-details?enq_id=";
  static String? viewPassport = "view-passport-details?enq_id=";
  static String? viewRelative = "view-relative-details?enq_id=";
  static String? passportPlaceOfIssuse = "get-passport-poi";
  static String? travelStatus = "get-travel-status";
  static String? typeOfVisa = "get-type-of-visa";
  static String? visaStatusID = "get-visa-status";
  static String? citizenshipStatus = "get-citizenship-status";
  static String? realtionWithRelative = "get-relation-with-relative";
  static String? updatepassPostDetails = "add-passport-details?enq_id=";
  static String? viewTravelDetails = "view-travel-history-details?enq_id=";
  static String? addTravelHistoryPart1 = "add-travel-history-details?enq_id=";
  static String? addTravelHistoryPart2 = "&travel_history=";
  static String? visaStatus = "get-travel-visa-status?travel_status=";
  static String? addRelativeInformationPart1 = "add-relative-details?enq_id=";
  static String? addRelativeInformationPart2 =
      "&any_relative_country_interested=";
  static String? visaSummary = "get-visa-summary?enq_id=";
  static String? otherTestDetails = "add-other-test-details?enq_id=";
  static String? allCountry = "get-all-country";
  static String? applicationStatus = "get-application-status";
  static String? applicationStage = "get-application-stage";
  static String? applicationDocumentUpload =
      "upload-application-document?enq_id=";
  static String? login = "login?mobile=";
  static String? login2 = "&otp=";
  static String? documentList = "my-document-list";
  static String? orranizationWorkList = "organization-work-list?enq_id=";
  static String? documentNameForDocumentTypePart1 =
      "get-document-name-for-document-type?enq_id=";
  static String? documentNameForDocumentTypePart2 = "&document_id=";
  static String? documentNameForDocumentTypePart3 = "&organization_name=";
  static String? commonUploadDocument = "get-common-uploaded-document?enq_id=";
  static String? serviceAssigness = "service-assignees?enq_id=";

  static String? scheduleAnExpertCallPart1 = "schedule-an-expert-call?enq_id=";
  static String? scheduleAnExpertCallPart2 = "&expert_call_date=";
  static String? scheduleAnExpertCallPart3 = "&expert_call_time=";
  static String? scheduleAnExpertCallPart4 = "&expert_call_counsellor=";

  static String? bookAnAppointmentpart1 = "book-an-appointment?enq_id=";
  static String? bookAnAppointmentpart2 = "&appointment_date=";
  static String? bookAnAppointmentpartpart3 = "&appointment_time=";
  static String? bookAnAppointmentpartpart4 = "&appointment_counsellor=";

  static String? uploadCommonDocumentPart1 = "upload-common-document?enq_id=";
  static String? countryGuide = "get-country-guide-details?enq_id=";
  static String? countryIDWithUrl = "get-country-document?country_id=";
  static String? errorHandlePart1 = "handle-error?enq_id=";
  static String? errorHandlepart2 = "&error_message=";
  static String? errorHandlepart3 = "&status_code=";
  static String? errorHandlepart4 = "&extra=";

  static String? trackyourticket = "get-ticket-data?enq_id=";
  static String? saveCommentTrackYourTicketpart1 = "save-comment-data?id=";
  static String? saveCommentTrackYourTicketPart2 = "&content=";
  static String? saveCommentTrackYourTicketPar3 = "&enq_id=";
  static String? qualificationUpdateDropdownPart1 =
      "get-qualification-at-edit?country_id=";
  static String? qualificationUpdateDropdownPart2 = "&state_id=";
  static String? qualificationUpdateDropdownPart3 = "&city_id=";
  static String? phoneNuberverfiy = "verify-number?mobile=";
  static String? agree = "agree-student-consent?enq_id=";

  static String? counselorList = "service-assignees?enq_id=";

  static String? profileDataValidation = "profile-data-validation?enq_id=";

  static String? carouselList = "carousel-banner";

  static String? idsFromZipCode = "ids-from-zip-code";

  static String? getAllCourseBroadField = "get-all-course-broad-field";

  static String? getNarrowFieldFromCourseBroadField =
      "get-course-narrow-fiels-by-broad-field";

// Fund Planner
  static String? bifurcated_relation = "get-bifurcated-relation";
  /////testimonials
  static String? testimonialsAll = "testimonials-review";

  //dropdown
  static String? source_of_income = "get-source-of-income";
  static String? get_occupation = "get-occupation";
  static String? fund_type = "get-fund-types";
  static String? bankByCountry = "get_bank_by_country?country_id=";
  static String? getYoutubeVideoLink = "testimonial-videos";

  static String? getCountryWithFlag = "country-flags";

  static String? countriesOfContinent = "countries-of-continent/";

  static String? fundPlannerResult = "funds-planner-get-results?enq_id=";
  static String? fundPlannerDelete = "funds-planner-delete-results?id=";
  static String? getCarrerOutcomeByProfession =
      "get-carrer-outcome-by-profession?job_industry_id=";
  static String? courseSearchGetUniversities = "universities/";

  static String? getAllBranches = "get-all-branches";
  static String? getAllLeadSources = "get-all-lead-source";

  //params number_otp=195185&mobile_number=9650117662
  static String? otpValidationForRegister = "otp-validate-student?number_otp=";

  static String? resendOtpRegister = "otp-number-resend?mobile_number=";
  static String? fundplannerDelete = "funds-planner-delete-results?id=";
}

getFundPlannersave(
    {required String id,
    required String enq_id,
    required String name_of_sponsor,
    required String relationship,
    required String bank_country,
    required String id_of_financial_institution,
    required String type_of_funds,
    required String sponsor_amount,
    required String occupation,
    required String oldfunds,
    required String source_of_income}) {
  return "funds-planner-save-results?id=$id&enq_id=$enq_id&name_of_sponsor=$name_of_sponsor&relationship=$relationship&bank_country=$bank_country&id_of_financial_institution=$id_of_financial_institution&type_of_funds=$type_of_funds&sponsor_amount=$sponsor_amount&occupation=$occupation&oldfunds=$oldfunds&source_of_income=$source_of_income";
}

// Fund Planner
getFundPlannerDataBasedRelation(String relation_applicant, int enq_id) {
  return "funds-planner-get-data-based-on-relation?relation_applicant=$relation_applicant&enq_id=$enq_id";
}

fundCalulator(String inst_course, int enq_id) {
  return "data-needed-for-funds-calculators?inst_course=$inst_course&enq_id=$enq_id";
}

dataNeedFundCalulator(
  int enq_id,
  int inst_course,
  int is_partner,
  int is_child,
  int num_of_child, [
  int child_age1 = 0,
  int child_age2 = 0,
  int child_age3 = 0,
  int child_age4 = 0,
]) {
  return "data-needed-for-funds-calculators?inst_course=$inst_course&enq_id=$enq_id&is_partner=$is_partner&is_child=$is_child&num_of_child=$num_of_child&child_age1=$child_age1&child_age2=$child_age2&child_age3=$child_age3&child_age4=$child_age4";
}

getaddCourseInformationPart3(int index, int courseBroadId, int courseNarrowId) {
  return "&added_courses[$index][course_broad_id]=$courseBroadId&added_courses[$index][course_narrow_id]=$courseNarrowId";
}

getAddQualificationPart2(
  @required String index,
  @required String qualificationId,
  @required String courseName,
  @required String cityId,
  @required String stateId,
  @required String countryId,
  @required String reapperCount,
  @required String grade,
  @required String multiplier,
  @required String percentage,
  @required String paasingInstId,
  @required String streamId,
  @required String affiliationId,
  @required String educationStatus,
  @required String yearOfPassing,
) {
  return "&added_qualification[$index][qualification_id]=$qualificationId&added_qualification[$index][course_name]=$courseName&added_qualification[$index][city_id]=$cityId&added_qualification[$index][state_id]=$stateId&added_qualification[$index][country_id]=$countryId&added_qualification[$index][reapper_count]=$reapperCount&added_qualification[$index][grade]=$grade&added_qualification[$index][multiplier]=$multiplier&added_qualification[$index][percentage]=$percentage&added_qualification[$index][passing_inst_id]=$paasingInstId&added_qualification[$index][stream_id]=$streamId&added_qualification[$index][affiliation_id]=$affiliationId&added_qualification[$index][education_status]=$educationStatus&added_qualification[$index][year_of_passing]=$yearOfPassing";
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

addTravelHistoryPart3(
    String index,
    String travelStatus,
    String? proofAvailable,
    String? countryName,
    String? chooseCountryID,
    String? typeOfVisaID,
    String? visaStatus,
    String? dateOfRejection,
    String? reasonOfRejection,
    String? applicationNumber,
    String? visaNumber,
    String? dateOfApplication) {
  return "&added_travel_history_details[$index][travel_status]=$travelStatus&added_travel_history_details[$index][choose_country]=$chooseCountryID&added_travel_history_details[$index][type_of_visa]=$typeOfVisaID&added_travel_history_details[$index][visa_status]=$visaStatus&added_travel_history_details[$index][date_of_application]=$dateOfApplication&added_travel_history_details[$index][date_of_rejection]=$dateOfRejection&added_travel_history_details[$index][reason_of_rejection]=$reasonOfRejection&added_travel_history_details[$index][proof_available]=$proofAvailable&added_travel_history_details[$index][country_name]=$countryName&added_travel_history_details[$index][application_number]=$applicationNumber&added_travel_history_details[$index][visa_number]=$visaNumber";
}

addRelativeInformationPart3(
    String? index,
    String? id,
    String? anyRelativeCountryInterested,
    String? citizenshipStatus,
    String? relativeCountry,
    String? relativeEmailID,
    String? addressOfRelative,
    String? contactOfRelative,
    String? relationWithrelative) {
  return "&any_relative_country_interested=1&added_relative[$index][id]=$id&added_relative[$index][any_relative_country_interested]=$anyRelativeCountryInterested&added_relative[$index][citizenship_status]=$citizenshipStatus&added_relative[$index][relative_country]=$relativeCountry&added_relative[$index][relation_with_relative]=$relationWithrelative&added_relative[$index][relative_email_id]=$relativeEmailID&added_relative[$index][contact_of_relative]=$contactOfRelative&added_relative[$index][address_of_relative]=$addressOfRelative";
}

String registerNewUserEndpoint({
  required name,
  required phoneNumber,
  required emailID,
  required targetDestination,
  required nearestSiecBranch,
  required howDidYouHearAboutUS,
}) {
  return "signup-student?student_name=$name&mobile_number=$phoneNumber&student_email=$emailID&student_destination=$targetDestination&student_branch=$nearestSiecBranch&student_source=$howDidYouHearAboutUS";
}
