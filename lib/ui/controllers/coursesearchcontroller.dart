import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
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

// Using for Local Variable for DropDown
  List<dynamic> countryList = [];
  List<dynamic> countryCode = [];
  List<dynamic> stateList = [];
  List<dynamic> stateCode = [];
  List<dynamic> cityList = [];
  List<dynamic> cityCode = [];
  List<dynamic> courseLevelList = [];
  List<dynamic> courseLevelCode = [];
  List<dynamic> courseBoardList = [];
  List<dynamic> courseBoardCode = [];
  List<dynamic> courseNarrowList = [];
  List<dynamic> courseNarrowCode = [];

// Model Create
  List<CompleteCourseDetail> completeCourseDetail = [];
  ApiServices apiservices = ApiServices();

  List<CourseSearchModel> courseSearchModel = [];

// Using in coursesearch Page field

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

  getCountry() async {
    var res =
        await apiservices.getCountry(Endpoints.baseUrl!, Endpoints.country!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      countryList = map.keys.toList();
      countryCode = map.values.toList();
      loadingCountry.value = true;
      update();
    }
  }

  getState(String country) async {
    var res = await apiservices.getState(
        Endpoints.baseUrl!, Endpoints.state!, country);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      stateList = map.keys.toList();
      stateCode = map.values.toList();
      loadingState = true.obs;
      update();
    }
  }

  getCity(String state) async {
    List tempList;
    var res =
        await apiservices.getCity(Endpoints.baseUrl!, Endpoints.city!, state);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      cityList = map.keys.toList();
      cityCode = map.values.toList();
      loadingCity = true.obs;
      update();
    }
  }

  getCourseLevel() async {
    var res = await apiservices.getCourseLevel(
        Endpoints.baseUrl!, Endpoints.courselevel!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      courseLevelList = map.keys.toList();
      courseLevelCode = map.values.toList();
      loadingCourseLevel.value = true;
      update();
    }
  }

  getCourseBoardField() async {
    var res = await apiservices.getCourseBoardField(
        Endpoints.baseUrl!, Endpoints.courseBoardField!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      courseBoardList = map.keys.toList();
      courseBoardCode = map.values.toList();
      loadingCourseBoardField = true.obs;
      update();
    }
  }

  getCoursenarrowField(String boardField) async {
    List tempList;
    var res = await apiservices.getCoursenarrowField(
        Endpoints.baseUrl!, Endpoints.state!, boardField);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      courseNarrowList = map.keys.toList();
      courseNarrowCode = map.values.toList();
      loadingCourseNarrowField = true.obs;
      update();
    }
  }

  setCountryDropdown(List data) {
    countryDropdown.value = data;
    update();
  }

  setCourseDropdown(String data) {
    courseLevelDropdown.value = data;
    update();
  }

  courseSearch(String country, String courseLevel) async {
    var now = DateTime.now();
    var formatterYear = DateFormat('yyyy');
    var formatterMonth = DateFormat('MM');
    var temp = country.split('[');
    var temp2 = temp[1].split(']')[0];
    var temp3 = courseLevel.split('[');
    var temp4 = temp3[1].split(']')[0];
    String? endpoint = Endpoints.courseSearchPart1! +
        temp2 +
        Endpoints.courseSearchPart2! +
        temp4;

    var res = await apiservices.getCourseSearch(Endpoints.baseUrl!, endpoint);
    if (res != null) {
      courseSearchModel = res;

      for (var i = 0; i < courseSearchModel.length; i++) {
        if (courseSearchModel[i].listIntake!.isNotEmpty) {
          print(courseSearchModel[i].listIntake!.length);
          print(courseSearchModel.length);
          for (var j = 0; j < courseSearchModel[i].listIntake!.length; j++) {
            print("soni ii");
            print(i);
            print(j);
            if (int.parse(courseSearchModel[i].listIntake![j].split("-")[1]) >=
                int.parse(formatterYear.format(now))) {
              if (int.parse(
                      courseSearchModel[i].listIntake![j].split("-")[0]) >=
                  int.parse(formatterMonth.format(now))) {
                courseSearchModel[i].nearByIntake =
                    courseSearchModel[i].listIntake![j];
              }
            }
          }
        }
      }
      courseSearchModel;
      loadingCourseSearchDetail = true.obs;
      update();
    }
  }

  completeCourseDetailMethod() async {
    var res = await apiservices.completeCourseDetail();
    if (res != null) {
      completeCourseDetail = res;
      return completeCourseDetail;
    }
  }
}
