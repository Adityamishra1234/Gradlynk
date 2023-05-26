import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/idsfromZipCode.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ContactInformationController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();

  bool whatsappNumberIsSameAsMobileNumber = false;

// Selected fields
//Name
  String? genderSelected;
  String? maritalStatusSelected;
  String? countrySelected;
  String? stateSelected;
  String? citySelected;
  String? dob;
  String? selectedChildCount;

//Code
  int? genderIdSelected,
      maritalStatusIdSelected,
      childrenCountSelected,
      countryIdSelected,
      stateIdSelected,
      cityIdSelected;

//  Dropdown Fields
  List<String> countryList = [];
  List<String> countryCode = [];
  List<String> stateList = [];
  List<String> stateCode = [];
  List<String> cityList = [];
  List<String> cityCode = [];
  List martialStatusList = [];
  List martialStatusCode = [];

  //Loading
  RxBool loadingCountry = false.obs;
  RxBool loadingState = false.obs;
  RxBool loadingCity = false.obs;
  RxBool loadingmartialStatus = false.obs;
  // 0=> ,1=> first time,2=> loading,3=> normal
  RxInt loadingStudentPanelData = 0.obs;

  StudentPanel model = StudentPanel();

  @override
  void onInit() {
    getCountry();
    getMartialStatus();
    profiledetail();
    super.onInit();
    change(null, status: RxStatus.success());
  }

  IdsFromZipCodeModel idsFromZipCodeModel = IdsFromZipCodeModel();
  idsFromZipCode(int zipcode) async {
    var res = await apiservice.idsFromZipcode(zipcode);

    idsFromZipCodeModel = IdsFromZipCodeModel.fromJson(res);

    for (var i = 0; i < countryList.length; i++) {
      if (i == 0) {
        countryIdSelected = null;
        countryIdSelected = null;

        print(idsFromZipCodeModel.countryId);
        print(countryCode[i]);
      } else {
        if (countryCode[i] == idsFromZipCodeModel.countryId) {
          countrySelected = countryList[i];
          countryIdSelected = int.parse(idsFromZipCodeModel.countryId!);
          await getState(countryCode[i]);
        }
      }
    }

    for (var j = 0; j < stateList.length; j++) {
      if (j == 0) {
        stateSelected = null;
        stateIdSelected = null;
      } else {
        if (stateCode[j] == idsFromZipCodeModel.stateId) {
          stateSelected = stateList[j];
          stateIdSelected = int.parse(idsFromZipCodeModel.stateId!);
          await getCity(stateCode[j]);
        }
      }
    }
    update();
  }

  profiledetail() async {
    try {
      var res = await apiServices.dashboard(Endpoints.baseUrl!,
          "${Endpoints.dashboard!}${Get.find<BaseController>().model1.mobile.toString()}");
      if (res != null) {
        model = res;
        loadingStudentPanelData = 1.obs;
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
      var res =
          await apiServices.dropDown1(Endpoints.baseUrl!, Endpoints.country!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        countryList.add("Select Country");
        countryCode.add("0");
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

  getMartialStatus() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.maritalStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        martialStatusList.add("Select Martial Status");
        martialStatusCode.add(0);
        martialStatusCode.addAll(map.keys.toList());
        martialStatusList.addAll(map.values.toList());
        loadingmartialStatus.value = true;
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

  getState(String countryId) async {
    try {
      loadingCity.value = false;
      cityCode = [];
      cityList = [];
      citySelected = null;
      cityIdSelected = null;
      loadingState.value = false;
      stateList = [];
      stateCode = [];
      stateSelected = null;
      stateIdSelected = null;
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.state! + countryId);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        stateList.add("select State");
        stateCode.add("0");
        for (var element in temp) {
          stateList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          stateCode.add(element.toString());
        }

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

  getCity(String state) async {
    try {
      loadingCity.value = false;
      cityCode = [];
      cityList = [];
      citySelected = null;
      cityIdSelected = null;
      List tempList;
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.city! + state);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        cityList.add("Select city");
        cityCode.add("0");
        for (var element in temp) {
          cityList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          cityCode.add(element.toString());
        }
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

  updateData(PersonalInformationModel personalInformationModel) async {
    change(null, status: RxStatus.loading());
    await apiServices.personalInformationDataUpdate(
        personalInformationModel, Endpoints.personalDetailUpdate);
    change(null, status: RxStatus.success());
  }
}
