import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class CourseSearchController extends GetxController {
  //Select Code
  int? selectCountryCode;
  int? selectStateCode;
  int? selectCityCode;
  int? selectCourseBoardFieldCode;
  int? selectCourseNarrowFieldCode;
  int? selectCourseLevelCode;
//Select Name
  String? selectCountryName;
  String? selectStateName;
  String? selectCityName;
  String? selectCourseBoardFieldName;
  String? selectCourseNarrowFieldName;
  String? selectCourseLevelName;

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
  CourseModelFilter courseModelFilter = CourseModelFilter();
  List<CourseSearchModel> courseSearchModel = [];
  CourseSearchModel courseSearchModelCompare1 = CourseSearchModel();
  CourseSearchModel courseSearchModelCompare2 = CourseSearchModel();

  //Loading State
  RxBool loadingCourseSearchDetail = false.obs;
  RxBool loadingCountry = false.obs;
  RxBool loadingCourseLevel = false.obs;
  RxBool loadingState = false.obs;
  RxBool loadingCity = false.obs;
  RxBool loadingCourseBoardField = false.obs;
  RxBool loadingCourseNarrowField = false.obs;
  RxBool loadingNextAndPrevious = false.obs;
  RxBool compareApply = false.obs;
  RxBool loadingCourseShortList = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCountry();
    getCourseLevel();
    getCourseBoardField();
  }

  getCountry() async {
    try {
      var res =
          await apiservices.dropDown1(Endpoints.baseUrl!, Endpoints.country!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        countryList.add("Select Country");
        countryCode.add(0);
        countryList.addAll(map.keys.toList());
        countryCode.addAll(map.values.toList());
        loadingCountry.value = true;
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

  getCourseLevel() async {
    try {
      var res = await apiservices.dropDown1(
          Endpoints.baseUrl!, Endpoints.courselevel!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        courseLevelList.add("Select Course Level");
        courseLevelCode.add(0);
        courseLevelList.addAll(map.keys.toList());
        courseLevelCode.addAll(map.values.toList());
        loadingCourseLevel.value = true;
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

  getCourseBoardField() async {
    try {
      var res = await apiservices.dropDown1(
          Endpoints.baseUrl!, Endpoints.courseBoardField!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        courseBoardList.add("Select Course Level");
        courseBoardCode.add(0);
        courseBoardList.addAll(map.keys.toList());
        courseBoardCode.addAll(map.values.toList());
        loadingCourseBoardField = true.obs;
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

  getState(int country) async {
    cityCode = [];
    cityList = [];
    stateCode = [];
    stateList = [];
    selectCityCode = null;
    selectCityName = null;
    loadingCity.value = false;
    loadingState.value = false;
    selectStateName = null;
    selectStateCode = null;
    try {
      var res = await apiservices.dropDown1(
          Endpoints.baseUrl!, Endpoints.state! + country.toString());
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        stateList.add("Select State");
        stateCode.add(0);
        stateList.addAll(map.keys.toList());
        stateCode.addAll(map.values.toList());
        loadingState = true.obs;
      }
      update();
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getCity(int state) async {
    cityList = [];
    cityCode = [];
    loadingCity.value = false;
    selectCityName = null;
    selectCityCode = null;
    try {
      List tempList;
      var res = await apiservices.dropDown1(
          Endpoints.baseUrl!, Endpoints.city! + state.toString());
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        cityList.add("Select City");
        cityCode.add(0);
        cityList.addAll(map.keys.toList());
        cityCode.addAll(map.values.toList());
        loadingCity = true.obs;
      }
      update();
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getCoursenarrowField(int boardField) async {
    courseNarrowList = [];
    courseNarrowCode = [];
    loadingCourseNarrowField.value = false;
    selectCourseNarrowFieldName = null;
    selectCourseNarrowFieldCode = null;
    try {
      List tempList;
      var res = await apiservices.dropDown1(Endpoints.baseUrl!,
          Endpoints.courseNarrowField! + boardField.toString());
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        courseNarrowList.add("Select course Narrow");
        courseNarrowCode.add(0);
        courseNarrowList.addAll(map.keys.toList());
        courseNarrowCode.addAll(map.values.toList());
        loadingCourseNarrowField = true.obs;
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

  // setCountryDropdown(List data) {
  //   countryDropdown.value = data;
  //   update();
  // }

  // setCourseDropdown(String data) {
  //   courseLevelDropdown.value = data;
  //   update();
  // }

  courseSearch(String country, String courseLevel, String enqId) async {
    courseModelFilter = CourseModelFilter();
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
      try {
        courseModelFilter = res;
        courseSearchModel = courseModelFilter.courseSearchList;
        for (var i = 0; i < courseSearchModel.length; i++) {
          if (courseSearchModel[i].listIntake!.isNotEmpty) {
            for (var j = 0; j < courseSearchModel[i].listIntake!.length; j++) {
              if (int.parse(
                      courseSearchModel[i].listIntake![j].split("-")[1]) >=
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
      } catch (e) {
        await ApiServices().errorHandle(
          Get.find<BaseController>().model1.id.toString(),
          e.toString(),
          "1111",
          StackTrace.current.toString(),
        );
      }

      return courseModelFilter;
    }
  }

  completeCourseDetailMethod(
      String universityId, String courseId, String instituteCourseId) async {
    try {
      String endpoint = Endpoints.completeCoursePart1! +
          universityId +
          Endpoints.completeCoursePart2! +
          courseId +
          Endpoints.completeCoursePart3! +
          instituteCourseId;
      var res =
          await apiservices.completeCourseDetail(Endpoints.baseUrl!, endpoint);
      if (res != null) {
        completeCourseDetail = res;
        return completeCourseDetail;
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

  setCompare(RxBool data) {
    compareApply = data;
    update();
  }

  courseShortList(String? id, String enqId) {
    apiservices.setShortListCourse(id, enqId);
  }

  courseFinalShortlist(String? id, String enqId, bool action) {
    apiservices.setFinalShortListCourse(
      id,
      enqId,
    );
  }
}
