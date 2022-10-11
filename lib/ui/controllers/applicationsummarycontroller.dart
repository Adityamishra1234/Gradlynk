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

  // Model
  ApiServices apiServices = ApiServices();
  List<ApplicationSummaryModel> applicationSummaryModel = [];
  ApplicationDetailModel applicationDetailModel = ApplicationDetailModel();

  @override
  void onInit() {
    super.onInit();
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
      return applicationDetailModel;
    }
  }
}
