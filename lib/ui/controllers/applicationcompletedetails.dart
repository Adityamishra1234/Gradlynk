import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ApplicationCompleteDetailsController extends GetxController {
  RxBool loadingApplicationCompleteDetails = false.obs;
  ApiServices apiServices = ApiServices();
  ApplicationDetailModel model = ApplicationDetailModel();

  @override
  void onInit() {
    getApplicationDetailComplete(Get.arguments);
  }

//Function
  getApplicationDetailComplete(String? apliId) async {
    loadingApplicationCompleteDetails.value = false;
    var response = await apiServices.getApplicationDetails(
        Endpoints.applicationDetail, apliId);
    if (response != null) {
      model = response;
      loadingApplicationCompleteDetails.value = true;
      update();
    } else {
      Get.back();
    }
  }
}
