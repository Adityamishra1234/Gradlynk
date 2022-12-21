import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/visasummarymodel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class VisaSummaryController extends BaseController {
  ApiServices apiServices = ApiServices();
  List<VisaSummaryModel> modelList = [];

  // Visa Status ID and Name
  List visaStatusID = [];
  List visaStatusName = [];

  //loading
  RxBool loadingVisaDetails = false.obs;
  RxBool loadingVisaStatus = false.obs;

  @override
  void onInit() {
    getVisaStatus();
    getVisaDetails("78623");
    super.onInit();
  }

  getVisaDetails(String enqId) async {
    var res = await apiServices.getvisaSummary(Endpoints.visaSummary! + enqId);
    if (res != null) {
      modelList = res;
      loadingVisaDetails.value = true;
      update();
    }
  }

  getVisaStatus() async {
    var res = await apiServices.dropDown1(
        Endpoints.baseUrl!, Endpoints.visaStatusID!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      visaStatusID = map.keys.toList();
      visaStatusName = map.values.toList();
      loadingVisaStatus.value = true;
      update();
    }
  }
}
