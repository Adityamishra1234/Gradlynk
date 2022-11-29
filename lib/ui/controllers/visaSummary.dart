import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/visasummarymodel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class VisaSummaryController extends BaseController {
  ApiServices apiServices = ApiServices();
  List<VisaSummaryModel> modelList = [];

  //loading
  RxBool loadingVisaDetails = false.obs;

  @override
  void onInit() {
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
}
