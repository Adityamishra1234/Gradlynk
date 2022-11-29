import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
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

  // Validation Field
  // 0=>Null, 1=>false, 2=>true 4=>Multiple error
  RxInt PTE = 0.obs;
  RxInt IELTS = 0.obs;
  RxInt cambridge = 0.obs;
  RxInt Duolingo = 0.obs;
  RxInt Toefl = 0.obs;

  // field selected
  RxInt chooseField = 0.obs;

  @override
  void onInit() {
    getExamName();
    getExamStatus();
    getEnglishTestDetails("78623");
    super.onInit();
  }

  getExamStatus() async {
    var res =
        await apiServices.dropDown1(Endpoints.baseUrl!, Endpoints.examStatus!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      examStatusList = map.values.toList();
      examStatusCode = map.keys.toList();
      loadingExamStaus = true.obs;
      update();
    }
  }

  getExamName() async {
    var res =
        await apiServices.dropDown1(Endpoints.baseUrl!, Endpoints.examName!);
    if (res != null) {
      print(res.toString() + "saidfskm");
      Map map = Map<String, dynamic>.from(res);
      print("23");
      examNameList = map.values.toList();
      loadingExamName2 = true.obs;
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
