import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/models/applicationmodel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ApplicationSummaryController extends GetxController {
  // Loading
  RxBool loadingApplicationSummary = false.obs;
  RxBool loadingApplicationCompleteDetails = false.obs;
  RxBool loadingStatus = false.obs;
  RxBool loadingStage = false.obs;

  // ID and Name Field
  List statusListId = [];
  List statusListName = [];
  List stageListID = [];
  List stageNameList = [];

  // Model
  ApiServices apiServices = ApiServices();
  List<ApplicationSummaryModel> applicationSummaryModel = [];

  List<ApplicationSummaryModel> searchedList = [];

  ApplicationDetailModel applicationDetailModel = ApplicationDetailModel();

  @override
  void onInit() async {
    super.onInit();
    List<Future> futures = [
      getapplicationStatus(),
      getapplicationStage(),
      getApplicationDetail(Get.find<BaseController>().model1.id.toString())
    ];

    await Future.wait(futures);

    print(applicationSummaryModel.length);
    searchedList = applicationSummaryModel;
    update();
    // print(searchedList.length);
  }

  getApplicationDetail(String enqId) async {
    try {
      var response = await apiServices.getApplicationSummaryList(enqId);
      if (response != null) {
        applicationSummaryModel = response;

        loadingApplicationSummary = true.obs;
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

  getApplicationDetailComplete(String? apliId) async {
    loadingApplicationCompleteDetails.value = false;
    try {
      var response = await apiServices.getApplicationDetails(
          Endpoints.applicationDetail, apliId);
      if (response != null) {
        applicationDetailModel = response;
        loadingApplicationCompleteDetails.value = true;
        update();
      } else {
        Get.back();
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

  getapplicationStatus() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.applicationStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        statusListId = map.keys.toList();
        statusListName = map.values.toList();
        loadingStatus.value = true;
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

  getapplicationStage() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.applicationStage!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        stageListID = map.keys.toList();
        stageNameList = map.values.toList();
        loadingStage.value = true;
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

  void filterSearchResults(String query) {
    // var items = Map.fromEntries(controller.applicationSummaryModel
    //     .map((e) => MapEntry(e.campusName, e.countryName)));

    print(query.length);

    // var lol = applicationSummaryModel.forEach((e) => items.add(e.countryName));
    // print(items);

    // itemsToShow = items
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();

    if (query.isEmpty) {
      searchedList = applicationSummaryModel;
      update();
    } else {
      searchedList = applicationSummaryModel
          .where((element) =>
              element.countryName!
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element.universityName!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();

      update();
    }
  }
}
