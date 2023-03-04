import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class WorkHistoryController extends GetxController {
  ApiServices apiServices = ApiServices();
  List<WorkHistoryViewModel> workHistoryViewModelList = [];

  // Store field Name and Ids
  List industriesList = [];
  List industriesCode = [];
  List employmentTypeList = [];
  List employmentTypeCode = [];

// field selection
  RxBool viewDetails = false.obs;
  RxBool updateForEdit = true.obs;
  //Loading
  RxBool loadingIndustries = false.obs;
  RxBool loadingEmploymentType = false.obs;
  RxBool loadingWorkHistory = false.obs;
  RxBool loadingWorkUpdate = false.obs;
  RxBool loadingEdit = false.obs;

  // field Selected
  String? industryNameSelected,
      employementTypeSelected,
      workingFromSelected,
      workingTillSelected;
  int? industryNameCode, employementTypeCode;
  int? index;

  @override
  void onInit() {
    getIndustries();
    emplyoymentType();
    getWorkHistoryView(Get.find<BaseController>().model1.id.toString());
    super.onInit();
  }

  getIndustries() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.jobInstitute!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        industriesList = map.values.toList();
        industriesCode = map.keys.toList();
        loadingIndustries.value = true;
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

  emplyoymentType() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.employmentType!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        employmentTypeList = map.values.toList();
        employmentTypeCode = map.keys.toList();
        loadingEmploymentType.value = true;
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

  getWorkHistoryView(String? enqId) async {
    try {
      var res = await apiServices.getWorkHistoryView(
          Endpoints.baseUrl!, Endpoints.viewWorkHistoryDetails! + enqId!);
      if (res != null) {
        workHistoryViewModelList = res;
        loadingWorkHistory.value = true;
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

  updatedWorkHistory(String action) async {
    try {
      String? endpoint;
      endpoint =
          "${Endpoints.addworkHistoryDetailsPart1!}${Get.find<BaseController>().model1.id}";
      for (var i = 0; i < workHistoryViewModelList.length; i++) {
        endpoint = endpoint! +
            addWorkHistoryPart2(
                workHistoryViewModelList[i].workingFrom,
                workHistoryViewModelList[i].workingTill,
                workHistoryViewModelList[i].jobType,
                workHistoryViewModelList[i].organisationName,
                workHistoryViewModelList[i].jobRole,
                workHistoryViewModelList[i].jobIndustryId.toString(),
                workHistoryViewModelList[i].income.toString(),
                i);
      }
      var res = await apiServices.addProfileModule(
          Endpoints.baseUrl!, endpoint!, "Work History", action);
      loadingWorkUpdate.value = true;
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

  setViewDetails(bool data) {
    viewDetails.value = data;
    update();
  }
}
