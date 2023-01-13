import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class EnglishTestController extends BaseController {
  ApiServices apiServices = ApiServices();
  EnglishTestDetailsViewModel englishTestDetailsViewModel =
      EnglishTestDetailsViewModel();

  // Using for Widget field
  String? examStatusSelected,
      examNameSelected,
      dateOfExamSelected,
      bookTestSelcted,
      specifyExamNameSelected,
      tentativeExamDateSelcted,
      dateOfTestReportSelcted,
      testscoreExpirationDateSelcted;
  int? examStatusCodeSelected = 1;
// specify and ExamName is Same

  // loading
  RxBool loadingExamStaus = false.obs;
  RxBool loadingExamName2 = false.obs;
  RxBool tentative = true.obs;
  RxBool duolingo = false.obs;
  RxBool loadingViewEnglishTestDetails = false.obs;
  RxBool editSave = true.obs;
  RxBool loadingFirstTime = false.obs;

//Field for Storing Data with API
  List examStatusList = [];
  List examStatusCode = [];
  List examNameList = [];

  @override
  void onInit() {
    getExamName();
    getExamStatus();
    getEnglishTestDetails("78623");
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
        loadingExamStaus = true.obs;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getExamName() async {
    try {
      var res =
          await apiServices.dropDown1(Endpoints.baseUrl!, Endpoints.examName!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        examNameList = map.values.toList();
        loadingExamName2 = true.obs;
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getEnglishTestDetails(String enq_id) async {
    var res = await apiServices.viewEnglishTestDetails(
        Endpoints.baseUrl!, Endpoints.viewEnglishTestDetails! + enq_id);
    if (res != null) {
      englishTestDetailsViewModel = res;
      loadingViewEnglishTestDetails = true.obs;
      update();
    }
  }

  updateEnglishTestDetaisl(String enq_id,
      EnglishTestDetailsViewModel englishTestDetailsViewModel) async {
    await apiServices.updateEnglishTestDetails(this.englishTestDetailsViewModel,
        Endpoints.updateEnglishTesttDetails! + enq_id);
    update();
  }
}
