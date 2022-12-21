import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/models/applicationmodel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ApplicationSummaryController extends BaseController {
  // Loading
  RxBool loadingApplicationSummary = false.obs;
  RxBool loadingApplicationCompleteDetails = false.obs;
  RxBool loadingStatus = false.obs;
  RxBool loadingStage = false.obs;

  // ID and Name Field
  List statusListId = [];
  List statusListName = [];
  List stageListID = [];
  List stageNameList = [];

  // Model
  ApiServices apiServices = ApiServices();
  List<ApplicationSummaryModel> applicationSummaryModel = [];
  ApplicationDetailModel applicationDetailModel = ApplicationDetailModel();

  @override
  void onInit() {
    super.onInit();
    getapplicationStatus();
    getapplicationStage();
    getApplicationDetail("78623");
  }

  getApplicationDetail(String enq_id) async {
    var response = await apiServices.getApplicationSummaryList(enq_id);
    if (response != null) {
      applicationSummaryModel = response;
      loadingApplicationSummary = true.obs;
      update();
    }
  }

  getApplicationDetailComplete(String? apli_id) async {
    var response = await apiServices.getApplicationDetails(
        Endpoints.applicationDetail, apli_id);
    if (response != null) {
      applicationDetailModel = response;
      loadingApplicationCompleteDetails.value = true;
      update();
    } else {
      Get.back();
    }
  }

  getapplicationStatus() async {
    var res = await apiServices.dropDown1(
        Endpoints.baseUrl!, Endpoints.applicationStatus!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      statusListId = map.keys.toList();
      statusListName = map.values.toList();
      loadingStatus.value = true;
      update();
    }
  }

  getapplicationStage() async {
    var res = await apiServices.dropDown1(
        Endpoints.baseUrl!, Endpoints.applicationStage!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      stageListID = map.keys.toList();
      stageNameList = map.values.toList();
      loadingStage.value = true;
      update();
    }
  }
}
