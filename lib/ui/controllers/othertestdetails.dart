import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/otherTestDetails.dart';
import 'package:studentpanel/utils/endpoint.dart';

class OtherTestDetailsController extends BaseController {
  ApiServices apiServices = ApiServices();
  OtherTestDetailsViewModel otherTestDetailsViewModel =
      OtherTestDetailsViewModel();

  // Using for Widget field
  String? examStatusSelected,
      examName,
      dateOfExam,
      bookTestSelcted,
      specifyExamNameSelected,
      tentativeExamDateSelcted,
      dateOfTestReportSelcted,
      testscoreExpirationDateSelcted,
      listening,
      writing,
      reading,
      speaking,
      overrallscore;
  int? examStatusCodeSelected = 1;
// specify and ExamName is Same

  // loading
  RxBool loadingExamStaus = false.obs;
  RxBool loadingExamName = false.obs;
  RxBool tentative = true.obs;
  RxBool duolingo = false.obs;
  RxBool loadingViewOtherTestDetails = false.obs;

//Field for Storing Data with API
  List examStatusList = [];
  List examStatusCode = [];
  List examNameList = [];

  @override
  void onInit() {
    getExamName();
    getExamStatus();
    super.onInit();
  }

  getExamStatus() async {
    var res =
        await apiServices.dropDown1(Endpoints.baseUrl!, Endpoints.examStatus!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      examStatusList = map.values.toList();
      examStatusCode = map.keys.toList();
      loadingExamStaus.value = true;
      update();
    }
  }

  getExamName() async {
    var res = await apiServices.dropDown1(
        Endpoints.baseUrl!, Endpoints.examNameOtherTest!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      examNameList = map.values.toList();
      loadingExamName.value = true;
      update();
    }
  }

  getOtherTestDetails(String enq_id) async {
    var res = await apiServices.viewOtherTestDetails(
        Endpoints.baseUrl!, Endpoints.viewOtherTestDetails! + enq_id);
    if (res != null) {
      otherTestDetailsViewModel = res;
      loadingViewOtherTestDetails.value = true;
      update();
    }
  }
}
