import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class CourseInformationProfileController extends GetxController {
  List<ViewCourseInformation> viewCourseInformationList = [];
  ApiServices apiServices = ApiServices();
  List courseLevelList = [];
  List courseLevelCode = [];
  List courseNarrowList = [];
  List courseNarrowCode = [];

  // Selected
  String? courseLevelSelected;
  int? courseLevelSelectedId;
  String? courseNarrowSelected;
  int? courseNarrowSelectedId;
  String? courseBroadSelected;
  int? courseBroadSelectedId;

  // Loading
  RxBool loadingCourseLevel = false.obs;
  RxBool loadingCourseNarrow = false.obs;
  RxBool loadingCourseBroad = false.obs;
  RxBool loadingViewCourseInformation = false.obs;

  @override
  void onInit() {
    getCourseLevel();
    getCoursenarrow();
    getCourseInformation(78623);
    super.onInit();
  }

  getCourseLevel() async {
    try {
      var res = await apiServices.getCourseLevel(
          Endpoints.baseUrl!, Endpoints.courselevel!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        courseLevelList.add("Select course level");
        courseLevelCode.add("0");
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

  getCoursenarrow() async {
    try {
      var res = await apiServices.getCourseNarrowProfile(
          Endpoints.baseUrl!, Endpoints.courseNarrowFieldProfile!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        courseNarrowList.add("Select course narrow");
        courseNarrowCode.add("0");
        courseNarrowList.addAll(map.keys.toList());
        courseNarrowCode.addAll(map.values.toList());
        loadingCourseNarrow.value = true;
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

  getCourseBroadField(int courseNarrowFieldId) async {
    try {
      loadingCourseBroad.value = false;
      var res = await apiServices.getCourseNarrowProfile(
          Endpoints.baseUrl!,
          Endpoints.courseBroadFieldByNarrowField! +
              courseNarrowFieldId.toString());
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        courseBroadSelected =
            map.keys.toList().toString().split('[')[1].split(']')[0];

        courseBroadSelectedId = int.parse(
            map.values.toList().toString().split('[')[1].split(']')[0]);
        loadingCourseBroad = true.obs;
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

  getCourseInformation(int enqId) async {
    var res = await apiServices.getCourseInformation(Endpoints.baseUrl!,
        Endpoints.viewCourseInformation! + enqId.toString());
    if (res != null) {
      viewCourseInformationList = res;
      loadingViewCourseInformation.value = true;
      update();
    }
  }

  updateCourseInformation(int enqId, int courseLevelId) async {
    try {
      String? endpoint;
      endpoint = Endpoints.addCourseInformationPart1! +
          enqId.toString() +
          Endpoints.addCourseInformationPart2! +
          courseLevelId.toString();
      for (var i = 0; i < viewCourseInformationList.length; i++) {
        endpoint = endpoint! +
            getaddCourseInformationPart3(
                i,
                viewCourseInformationList[i].courseBroadId!,
                viewCourseInformationList[i].courseNarrowId!);
      }
      var res = await apiServices.addProfileModule(
          Endpoints.baseUrl!, endpoint!, "Course Information");
      loadingViewCourseInformation.value = true;
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

  callbackCourseLevel(String? data) {
    for (var i = 0; i < courseLevelList.length; i++) {
      if (i == 0) {
      } else {
        if (courseLevelList[i] == data) {
          courseLevelSelectedId = courseLevelCode[i];
          courseLevelSelected = courseLevelList[i];
          update();
        }
      }
    }
  }

  callbackCourseNarrow(String? data) {
    for (var i = 0; i < courseNarrowList.length; i++) {
      if (i == 0) {
      } else {
        if (courseNarrowList[i] == data) {
          courseNarrowSelectedId = courseNarrowCode[i];
          courseNarrowSelected = courseNarrowList[i];
          update();
        }
      }
    }
    if (courseNarrowSelectedId != null) {
      getCourseBroadField(courseNarrowSelectedId!);
    }
  }
}
