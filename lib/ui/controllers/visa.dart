import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/visadetail.dart';

class VisaDetailController extends GetxController {
  //Model
  ApiServices apiServices = ApiServices();
  VisaDetailModel visaDetailModel = VisaDetailModel();

  //Loading
  RxBool loadingVisaDetails = false.obs;

  // @override
  // void onInit() {
  //   getVisDetail();
  //   super.onInit();
  // }

  getVisDetail(String enqId, String applicationId) async {
    // String? enqId, String? visaId
    var response = await apiServices
        .getVisaDetail("get-visa-details?enq_id=$enqId&apli_id=$applicationId");
    if (response != null) {
      visaDetailModel = response;
      loadingVisaDetails.value = true;
      update();
    }
  }
}
