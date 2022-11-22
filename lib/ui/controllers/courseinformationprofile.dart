import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/utils/endpoint.dart';

class CourseInformationProfileController extends BaseController {
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
    var res = await apiServices.getCourseLevel(
        Endpoints.baseUrl!, Endpoints.courselevel!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      courseLevelList = map.keys.toList();
      courseLevelCode = map.values.toList();
      loadingCourseLevel.value = true;
      update();
    }
  }

  getCoursenarrow() async {
    var res = await apiServices.getCourseNarrowProfile(
        Endpoints.baseUrl!, Endpoints.courseNarrowFieldProfile!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      courseNarrowList = map.keys.toList();
      courseNarrowCode = map.values.toList();
      loadingCourseNarrow.value = true;
      update();
    }
  }

  getCourseBroadField(int courseNarrowFieldId) async {
    var res = await apiServices.getCourseNarrowProfile(
        Endpoints.baseUrl!,
        Endpoints.courseBroadFieldByNarrowField! +
            courseNarrowFieldId.toString());
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      courseBroadSelected =
          map.keys.toList().toString().split('[')[1].split(']')[0];

      courseBroadSelectedId =
          int.parse(map.values.toList().toString().split('[')[1].split(']')[0]);
      loadingCourseBroad = true.obs;
      update();
    }
  }

  getCourseInformation(int enq_id) async {
    var res = await apiServices.getCourseInformation(Endpoints.baseUrl!,
        Endpoints.viewCourseInformation! + enq_id.toString());
    if (res != null) {
      viewCourseInformationList = res;
      loadingViewCourseInformation.value = true;
      update();
    }
  }

  updateCourseInformation(int enq_id, int courseLevelId) async {
    String? endpoint;
    endpoint = Endpoints.addCourseInformationPart1! +
        enq_id.toString() +
        Endpoints.addCourseInformationPart2! +
        courseLevelId.toString();
    for (var i = 0; i < viewCourseInformationList.length; i++) {
      endpoint = endpoint! +
          getaddCourseInformationPart3(
              i,
              viewCourseInformationList[i].courseBroadId!,
              viewCourseInformationList[i].courseNarrowId!);
    }
    print(endpoint);
    var res = await apiServices.addProfileModule(
        Endpoints.baseUrl!, endpoint!, "Course Information");
    loadingViewCourseInformation.value = true;
    update();
  }

  callbackCourseLevel(String? data) {
    for (var i = 0; i < courseLevelList.length; i++) {
      if (courseLevelList[i] == data) {
        courseLevelSelectedId = courseLevelCode[i];
        courseLevelSelected = courseLevelList[i];
      }
    }
  }

  callbackCourseNarrow(String? data) {
    print(data);
    for (var i = 0; i < courseNarrowList.length; i++) {
      if (courseNarrowList[i] == data) {
        courseNarrowSelectedId = courseNarrowCode[i];
        courseNarrowSelected = courseNarrowList[i];
      }
    }
    if (courseNarrowSelectedId != null) {
      getCourseBroadField(courseNarrowSelectedId!);
    }
  }
}
