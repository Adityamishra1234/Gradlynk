import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/realtion.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class RelativeInformationController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  List<RealtionModel> modelList = [];
  int? index;

  RxBool viewDetails = false.obs;
  RxBool updateForEdit = true.obs;

  //Loading
  RxBool loadingCountry = false.obs;
  RxBool loadingCitizen = false.obs;
  RxBool loadingRealtion = false.obs;
  RxBool loadingViewModelList = false.obs;

  // DropDown field
  List countryList = [];
  List countryCode = [];
  List citizenShipStatus = [];
  List realtion = [];

  //selected Fields
  String? anyRelativeCountryInterestedSelected;
  String? countryNameSelected;
  String? countryNameCodeSelected;
  String? citizenShipStatusSelected;
  String? citizenShipStatusCodeSelected;
  String? relationSelected;

  static final realtiveEmail = TextEditingController();
  static final contactOfRelative = TextEditingController();
  static final addresOfrelative = TextEditingController();

  resetfields() {
    anyRelativeCountryInterestedSelected = null;
    countryNameSelected = null;
    countryNameCodeSelected = null;
    citizenShipStatusSelected = null;
    citizenShipStatusCodeSelected = null;
    relationSelected = null;
    index = null;
    updateForEdit = true.obs;
  }

  @override
  void onInit() {
    getCountry();
    getCitizenShipStatus();
    getRealtionWithStatus();
    viewRelativeHistory(Get.find<BaseController>().model1.id.toString());
    change(null, status: RxStatus.success());
    super.onInit();
  }

  setViewDetails(bool data) {
    viewDetails.value = data;
    update();
  }

  getCountry() async {
    try {
      loadingCountry.value == false;
      var res = await apiServices.getCountry(
          Endpoints.baseUrl!, Endpoints.allCountry!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
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

  getCitizenShipStatus() async {
    try {
      // single
      loadingCountry.value == false;
      var res = await apiServices.getCountry(
          Endpoints.baseUrl!, Endpoints.citizenshipStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        citizenShipStatus = map.keys.toList();
      }
      loadingCitizen.value = true;
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

  getRealtionWithStatus() async {
    try {
      //single
      loadingCountry.value == false;
      var res = await apiServices.getCountry(
          Endpoints.baseUrl!, Endpoints.realtionWithRelative!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        realtion = map.keys.toList();
      }
      loadingRealtion.value = true;
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

  viewRelativeHistory(String enqId) async {
    try {
      var res = await apiServices.viewRelativeInformation(
          Endpoints.baseUrl!, Endpoints.viewRelative! + enqId);
      if (res != null) {
        modelList = res;
        loadingViewModelList.value = true;
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

  updateRelativeInformation(
      String enqId, String anyCountryInterested, String action) async {
    change(null, status: RxStatus.loading());
    try {
      String endpoint = Endpoints.addRelativeInformationPart1! +
          enqId +
          Endpoints.addCourseInformationPart2! +
          anyCountryInterested;
      for (var i = 0; i < modelList.length; i++) {
        endpoint = endpoint +
            addRelativeInformationPart3(
                i.toString(),
                modelList[i].id.toString(),
                modelList[i].anyRelativeCountryInterested,
                modelList[i].citizenshipStatus,
                modelList[i].relativeCountry.toString(),
                modelList[i].relativeEmailId,
                modelList[i].addressOfRelative,
                modelList[i].contactOfRelative.toString(),
                modelList[i].relationWithRelative);
      }
      var res = await apiServices.updateRelativeInformation(endpoint, action);
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
}
