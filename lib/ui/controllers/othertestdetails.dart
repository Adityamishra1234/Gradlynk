import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/otherTestDetails.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class OtherTestDetailsController extends BaseController {
  ApiServices apiServices = ApiServices();
  OtherTestDetailsModel otherTestDetailsModel = OtherTestDetailsModel();

  // loading
  RxBool loadingExamStaus = false.obs;
  RxBool loadingExamName = false.obs;
  RxBool tentative = true.obs;
  RxBool loadingViewOtherTestDetails = false.obs;
  RxBool editSave = true.obs;
  RxBool loadingEdit = false.obs;

//Field for Storing Data with API
  List examStatusList = [];
  List examStatusCode = [];
  List examNameList = [];

  //Selected
  String? examStatusSelected;
  String? examStatusSelectedID;
  String? examNameSelected = "GRE";
  String? examNameSelectedID;
  String? bookTestSelected;
  String? bookTestSelectedID;
  String? specifyExamNameSelected;
  String? specifyExamNameSelectedID;
  String? tentaiveDefinite = "Tentative";
  String? dateOfExamSelected;
  String? dateOftestReportSelected;
  String? testScoreExpirationDateSelected;
  String? tentativeDateSelected;

  @override
  void onInit() {
    getExamName();
    getExamStatus();
    getOtherTestDetails("78623");
    super.onInit();
  }

  getExamStatus() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.examStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        examStatusList = map.values.toList();
        examStatusCode = map.keys.toList();
        loadingExamStaus.value = true;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getExamName() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.examNameOtherTest!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        examNameList = map.values.toList();
        loadingExamName.value = true;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getOtherTestDetails(String enqId) async {
    var res = await apiServices.viewOtherTestDetails(
        Endpoints.baseUrl!, Endpoints.viewOtherTestDetails! + enqId);
    if (res != null) {
      otherTestDetailsModel = res;
      loadingViewOtherTestDetails.value = true;
      update();
    }
  }

  updateOtherTestDetails(String? enqId) async {
    await apiServices.updateOtherTestDetails(
        otherTestDetailsModel, Endpoints.otherTestDetails! + enqId!);
  }
}
