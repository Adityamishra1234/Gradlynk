import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/country.dart';
import 'package:studentpanel/utils/endpoint.dart';

class CourseSearchController extends BaseController {
  RxBool loadingCountry = false.obs;
  ApiServices apiservices = ApiServices();
  Country country = Country();

  @override
  void onInit() {
    super.onInit();
    getCountry();
  }

  getCountry() async {
    var res =
        await apiservices.getCountry(Endpoints.baseUrl!, Endpoints.country!);
    if (res != null) {
      country = res;
    }
    print(res);
    loadingCountry.value = true;
    update();
  }
}
