import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/country.dart';
import 'package:studentpanel/ui/models/courseboardfield.dart';
import 'package:studentpanel/ui/models/courselevel.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/utils/endpoint.dart';

class CourseSearchController extends BaseController {
  // Reactive field Using in Callback Funcation
  RxList<dynamic> selectCountryCode = [].obs;
  RxList<dynamic> selectStateCode = [].obs;
  RxList<dynamic> selectCourseBoardFieldCode = [].obs;
  RxList<dynamic> selectCourseNarrowFieldCode = [].obs;
  RxList<dynamic> selectCourseCode = [].obs;
  RxList<dynamic> countryDropdown = [].obs;
  RxString courseLevelDropdown = "".obs;

// Model Create
  Country country = Country();
  CourseLevel courseLevel = CourseLevel();
  ApiServices apiservices = ApiServices();
  CourseBoardField courseBoardField = CourseBoardField();
  List<CourseSearchModel> courseSearchModel = [];

// Using in coursesearch Page field
  List stateList = [], stateCode = [];
  List cityList = [], cityCode = [];
  List courseNarrowFieldList = [], courseNarrowFieldCode = [];

  //Loading State
  RxBool loadingCourseSearchDetail = false.obs;
  RxBool loadingCountry = false.obs;
  RxBool loadingCourseLevel = false.obs;
  RxBool loadingState = false.obs;
  RxBool loadingCity = false.obs;
  RxBool loadingCourseBoardField = false.obs;
  RxBool loadingCourseNarrowField = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCountry();
    getCourseLevel();
    getCourseBoardField();
  }

  setCountryDropdown(List data) {
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

  getState(String country) async {
    List tempList;
    var res = await apiservices.getState(
        Endpoints.baseUrl!, Endpoints.state!, country);
    if (res != null) {
      String temp = res.toString();
      String temp2 = temp.split('{')[1].split('}')[0];
      tempList = temp2.split(',');

      tempList.forEach((element) {
        stateList.add(element.toString().split(":")[0]);
        stateCode.add(element.toString().split(":")[1]);
      });
      for (int i = 0; i < stateCode.length; i++) {
        stateList[i] = stateList[i].toString().replaceAll('"', '');
      }
      loadingState = true.obs;
      update();
    }
  }

  getCity(String state) async {
    List tempList;
    var res =
        await apiservices.getCity(Endpoints.baseUrl!, Endpoints.city!, state);
    if (res != null) {
      String temp = res.toString();
      String temp2 = temp.split('{')[1].split('}')[0];
      tempList = temp2.split(',');

      tempList.forEach((element) {
        cityList.add(element.toString().split(":")[0]);
        cityCode.add(element.toString().split(":")[1]);
      });
      for (int i = 0; i < cityCode.length; i++) {
        cityList[i] = cityList[i].toString().replaceAll('"', '');
      }
      loadingCity = true.obs;
      update();
    }
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

  getCourseBoardField() async {
    var res = await apiservices.getCourseBoardField(
        Endpoints.baseUrl!, Endpoints.courseBoardField!);
    if (res != null) {
      courseBoardField = res;
      loadingCourseBoardField = true.obs;
      update();
    }
  }

  getCoursenarrowField(String boardField) async {
    List tempList;
    var res = await apiservices.getCoursenarrowField(
        Endpoints.baseUrl!, Endpoints.state!, boardField);
    if (res != null) {
      String temp = res.toString();
      String temp2 = temp.split('{')[1].split('}')[0];
      tempList = temp2.split(',');

      tempList.forEach((element) {
        courseNarrowFieldList.add(element.toString().split(":")[0]);
        courseNarrowFieldCode.add(element.toString().split(":")[1]);
      });
      for (int i = 0; i < courseNarrowFieldCode.length; i++) {
        courseNarrowFieldList[i] =
            courseNarrowFieldList[i].toString().replaceAll('"', '');
      }
      print(courseNarrowFieldList);
      loadingCourseNarrowField = true.obs;
      update();
    }
  }

  courseSearch(String country, String courseLevel) async {
    var temp = country.split('[');
    var temp2 = temp[1].split(']')[0];
    var temp3 = courseLevel.split('[');
    var temp4 = temp[1].split(']')[0];
    String? endpoint = Endpoints.courseSearchPart1! +
        temp2 +
        Endpoints.courseSearchPart2! +
        temp4;

    var res = await apiservices.getCourseSearch(Endpoints.baseUrl!, endpoint);
    if (res != null) {
      courseSearchModel = res;
      loadingCourseSearchDetail = true.obs;
      update();
    }
  }
}
