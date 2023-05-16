import 'package:studentpanel/ui/models/comonDocumentUploadStatus.dart';
import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
import 'package:studentpanel/ui/models/otherTestDetails.dart';
import 'package:studentpanel/ui/models/passport.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';

abstract class api {
  dashboard(String baseUrl, String endpoint);
  getCountry(String baseUrl, String endpoint);
  getCourseLevel(String baseUrl, String endpoint);
  getState(String baseUrl, String endpoint, String countrydata);
  getState2(String baseUrl, String endpoint);
  getCity(String baseUrl, String endpoint, String statedata);
  getCity2(
    String baseUrl,
    String endpoint,
  );
  getCoursenarrowField(String baseUrl, String endpoint, String broadFieldId);
  getCourseBoardField(String baseUrl, String endpoint);
  getCourseSearch(String baseUrl, String endpoint);
  completeCourseDetail(String baseUrl, String endpoint);
  setShortListCourse(String? id, String? enqId);
  setFinalShortListCourse(String? id, String? enqId);
  courseShortlistDetail(String? enqId);
  getApplicationSummaryList(String enqId);
  getFinalShortlist(String? endpoints, String enqId);
  getApplicationDetails(String? endpoints, String? apliId);
  getVisaDetail(String? endpoint);
  personalInformationDataUpdate(
      PersonalInformationModel personalInformationModel, String? endpoint);
  getCourseNarrowProfile(String baseUrl, String endpoint);
  getCourseBroadFiledByNarrowField(String baseUrl, String endpoint);
  getCourseInformation(String baseUrl, String endpoint);
  getHighestQualification(String baseUrl, String endpoints);
  getStream(String baseUrl, String endpoints);
  getEducationStatus(String baseUrl, String endpoints);
  getAffiliation(String baseUrl, String endpoints);
  getInstitute(String baseUrl, String endpoints);
  getQualificationDetails(String baseUrl, String endpoints);
  dropDown1(String baseUrl, String endpoints);
  getWorkHistoryView(String baseUrl, String endpoints);
  addProfileModule(
      String baseUrl, String endpoints, String snakbarTitle, String action);
  viewEnglishTestDetails(
    String baseUrl,
    String endpoints,
  );
  viewOtherTestDetails(
    String baseUrl,
    String endpoints,
  );
  updateEnglishTestDetails(
      EnglishTestDetailsViewModel englishTestDetailsViewModel,
      String? endpoint);
  updatePassport(PassportModel passportModel, String? endpoint);
  viewPassportDetail(
    String baseUrl,
    String endpoints,
  );
  getTravelHistory(String baseUrl, String endpoints);
  updateTravelHistory(String? endpoint, String action);
  viewRelativeInformation(String baseUrl, String endpoints);
  updateRelativeInformation(String? endpoint, String action);
  getvisaSummary(String? endpoint);
  updateQualification(String? endpoint, [String action = ""]);
  updateOtherTestDetails(
      OtherTestDetailsModel otherTestDetailModel, String? endpoint);
  getUpComingEvent(String endpoint);
  getNotification(String endpoint);
  Future<String?> sendFile(
    file,
    uploadFilename,
    String enq_id,
    String id,
    String endpoint,
  );
  Future<CommonUploadStatus?> uploadDocumentCommon(
      file, uploadFilename, String enq_id, String id,
      {String orgname = ""});
  getLogin(String? endpoint);
  getDropdownUploadDocument(String endpoint);
  getDocumentName(String endpoint);
  getServicesAssigned(String endpoint);
  getOrganizationDropDown(String endpoint);
  getcommondocument(String endpoint);
  getSheduleExpertCall(String endpoint, String snackbar);
  logout(String baseUrl, String endpoint, String token);
  countryGuide(String endpoint);
  getTrackYourTickets(String endpoint);
  saveComments(String endpoint);
  qualificationUpdateDropdown(String endpoint);

  counselorList(String endpoint);

  profileDataValidation(int enqID);
}
