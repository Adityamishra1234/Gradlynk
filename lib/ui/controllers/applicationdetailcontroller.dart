import 'package:get/get.dart';
import 'package:studentpanel/services/api.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ApplicationDetailController extends GetxController {
  ApplicationDetailModel applicationDetailModel = ApplicationDetailModel();
  api apiServices = ApiServices();

  // loading
  RxBool loadingApplicationDetails = false.obs;

  getApplicationDetailComplete(String? apliId) async {
    try {
      var response = await apiServices.getApplicationDetails(
          Endpoints.applicationDetail, apliId);
      if (response != null) {
        applicationDetailModel = response;
        loadingApplicationDetails.value = true;
        return applicationDetailModel;
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }
}
