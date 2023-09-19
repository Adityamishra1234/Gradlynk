import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/countryGuide.dart';
import 'package:studentpanel/utils/endpoint.dart';

class CountryGuideController extends GetxController {
  ApiServices apiServices = ApiServices();
  List<CountryGuideModel> model = [];
  List countrylist = [];
  String? countrySelected;
  String? url;
  String? viewDetailsSelected;
  RxBool loadingCountryGuide = false.obs;

  @override
  Future<void> onInit() async {
    await getCountryGuideModel();
  }

  getCountryGuideModel() async {
    try {
      var res = await apiServices.countryGuide(Endpoints.countryGuide! +
          Get.find<BaseController>().model1.id.toString());
      if (res != null) {
        model = res;
        for (var element in model) {
          countrylist.add(element.country);
        }
        url = model[0].document;
        viewDetailsSelected = model[0].details;
        loadingCountryGuide = true.obs;
        update();
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
