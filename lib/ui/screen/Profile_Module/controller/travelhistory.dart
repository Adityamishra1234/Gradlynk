import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/travelhistory.dart';
import 'package:studentpanel/utils/endpoint.dart';

class TravelHistoryController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  List<TravelHistoryModel> modelList = [];

  // dropdown fields
  List travelStatus = [];
  List typeOfVisaList = [];
  List typeofVisaCode = [];
  List visaStatusList = [];
  List visaStatusCode = [];
  List countryList = [];
  List countryCode = [];

  //Loading
  RxBool loadingtravelStatus = false.obs;
  RxBool loadingTypeVisa = false.obs;
  RxBool loadingVisaStatus = false.obs;
  RxBool loadingCountry = false.obs;
  RxBool loadingVisaTravelDetails = false.obs;
  RxBool loadingEdit = false.obs;

  // View / Add
  RxBool viewDetails = false.obs;
  RxBool applicationNumberField = true.obs;
  RxBool updateForEdit = true.obs;

  // Selected
  String? travelAbroadSelected = 'No';
  String? travelAbroadSelectedID;
  String? travelStatusSelected;
  String? countrySelected;
  String? countryCodeSelected;
  String? typeOfVisaSelected;
  String? typeOfVisaCodeSelected;
  String? visaStatusSelected;
  String? proofAvailableSelectedID;
  String? proofAvailableSelected = "No";
  String? dateOfApplicatiton;
  String? dateOfReject;
  String? reasonOfReject;

  int? index;

  static final Rx<TextEditingController> dateOfApplication =
      TextEditingController().obs;
  static final Rx<TextEditingController> dateOfReject1 =
      TextEditingController().obs;
  static final Rx<TextEditingController> reasonOfRejection =
      TextEditingController().obs;
  static final Rx<TextEditingController> applicationNumber =
      TextEditingController().obs;
  static final Rx<TextEditingController> visaNumber =
      TextEditingController().obs;

  resetfields() {
    updateForEdit = true.obs;
    travelAbroadSelected = null;
    travelAbroadSelectedID = null;
    travelStatusSelected = null;
    countrySelected = null;
    countryCodeSelected = null;
    typeOfVisaSelected = null;
    typeOfVisaCodeSelected = null;
    visaStatusSelected = null;
    proofAvailableSelectedID = null;
    proofAvailableSelected = "No";
    dateOfApplicatiton = null;
    dateOfReject = null;
    reasonOfReject = null;
    index = null;

    dateOfApplication.value.text = "";
    dateOfReject1.value.text = "";
    reasonOfRejection.value.text = "";
    applicationNumber.value.text = "";
    visaNumber.value.text = "";
  }

  @override
  Future<void> onInit() async {
    List<Future> futures = [
      getTravelStatus(),
      getCountry(),
      getTypeOfVisa(),
      getVisaTravelHistory(Get.find<BaseController>().model1.id.toString())
    ];

    await Future.wait(futures);

    change(null, status: RxStatus.success());
    super.onInit();
  }

  getTravelStatus() async {
    try {
      loadingtravelStatus.value = false;
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.travelStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        travelStatus.add("select travel status");
        travelStatus.addAll(map.values.toList());
        loadingtravelStatus.value = true;
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

  getTypeOfVisa() async {
    typeOfVisaList = [];
    typeofVisaCode = [];
    try {
      loadingTypeVisa.value = false;
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.typeOfVisa!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        typeOfVisaList.add("Select type of visa");
        typeofVisaCode.add("0");
        typeOfVisaList.addAll(map.values.toList());
        typeofVisaCode.addAll(map.keys.toList());
        loadingTypeVisa.value = true;
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

  getVisaStatus(String travelStatus) async {
    try {
      visaStatusList = [];
      visaStatusCode = [];
      visaStatusSelected = null;

      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.visaStatus! + travelStatus);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        visaStatusList.add("select visa status");
        visaStatusList.addAll(map.values.toList());
        visaStatusCode.addAll(map.keys.toList());
        loadingVisaStatus.value = true;
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

  getCountry() async {
    try {
      loadingCountry.value == false;
      var res = await apiServices.getCountry(
          Endpoints.baseUrl!, Endpoints.allCountry!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        countryList.add("select country");
        countryCode.add(0);
        for (var element in temp) {
          countryList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          countryCode.add(element.toString());
        }

        loadingCountry = true.obs;
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

  getVisaTravelHistory(String enqId) async {
    try {
      var res = await apiServices.getTravelHistory(
          Endpoints.baseUrl!, Endpoints.viewTravelDetails! + enqId);
      if (res != null) {
        modelList = res;
        //TODO

        loadingVisaTravelDetails.value = true;
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

  updateTravelHistory(String enqId, String travelHistory, String action) async {
    change(null, status: RxStatus.loading());
    try {
      String endpoint;
      endpoint = Endpoints.addTravelHistoryPart1! +
          enqId +
          Endpoints.addTravelHistoryPart2! +
          travelHistory;
      for (var i = 0; i < modelList.length; i++) {
        endpoint = endpoint +
            addTravelHistoryPart3(
                i.toString(),
                modelList[i].travelStatus.toString(),
                modelList[i].proofAvailable.toString(),
                modelList[i].countryName,
                modelList[i].chooseCountry.toString(),
                modelList[i].typeOfVisa.toString(),
                modelList[i].visaStatus,
                modelList[i].dateOfRejection,
                modelList[i].reasonOfRejection,
                modelList[i].applicationNumber,
                modelList[i].visaNumber,
                modelList[i].dateOfApplication);
      }

      var res = await apiServices.updateTravelHistory(endpoint, action);
      if (res == true) {
        resetfields();
      }
      change(null, status: RxStatus.success());
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  updateTravelHistoryNo(
      String enqId, String travelHistory, String action) async {
    change(null, status: RxStatus.loading());
    try {
      String endpoint;
      endpoint = Endpoints.addTravelHistoryPart1! +
          enqId +
          Endpoints.addTravelHistoryPart2! +
          "0";

      var res = await apiServices.updateTravelHistory(endpoint, action);
      if (res == true) {
        resetfields();
      }
      change(null, status: RxStatus.success());
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getUpdateCondition(int index) {
    change(null, status: RxStatus.loading());
    travelAbroadSelected = "Yes";
    travelStatusSelected = modelList[index].travelStatus;
    countrySelected = modelList[index].countryName;
    countryCodeSelected = modelList[index].chooseCountry.toString();
    if (typeOfVisaList.isNotEmpty) {
      for (var i = 0; i < typeOfVisaList.length; i++) {
        if (typeofVisaCode[i].toString() ==
            modelList[index].typeOfVisa.toString()) {
          typeOfVisaSelected = typeOfVisaList[i];
          typeOfVisaCodeSelected = modelList[index].typeOfVisa.toString();
        }
      }
    }
    visaStatusSelected = modelList[index].visaStatus;
    applicationNumber.value.text = modelList[index].applicationNumber ?? "";
    dateOfApplication.value.text = modelList[index].dateOfApplication ?? "";
    reasonOfRejection.value.text = modelList[index].reasonOfRejection ?? "";
    change(null, status: RxStatus.success());
  }
}
