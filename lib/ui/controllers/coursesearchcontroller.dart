import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/country.dart';
import 'package:studentpanel/ui/models/courselevel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class CourseSearchController extends BaseController {
  RxString countryDropdown = "".obs;
  RxString courseLevelDropdown = "".obs;
  RxBool loadingCountry = false.obs;
  RxBool loadingCourseLevel = false.obs;
  ApiServices apiservices = ApiServices();
  Country country = Country();
  CourseLevel courseLevel = CourseLevel();

  @override
  void onInit() {
    super.onInit();
    getCountry();
    getCourseLevel();
  }

  setCountryDropdown(String data) {
    countryDropdown.value = data;
    update();
  }

  setCourseDropdown(String data) {
    courseLevelDropdown.value = data;
    update();
  }

  getCountry() async {
    var res =
        await apiservices.getCountry(Endpoints.baseUrl!, Endpoints.country!);
    if (res != null) {
      country = res;
      loadingCountry.value = true;
      update();
    }
  }

  getlist() {
    List data = [];
  }

  getCourseLevel() async {
    var res = await apiservices.getCourseLevel(
        Endpoints.baseUrl!, Endpoints.courselevel!);
    if (res != null) {
      courseLevel = res;
      loadingCourseLevel.value = true;
      update();
    }
  }
}
