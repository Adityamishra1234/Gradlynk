import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ContactInformationController extends GetxController {
  ApiServices apiServices = ApiServices();

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

  //key
  // Local key
  GlobalKey<FormState> firstNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> lastNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> mobileNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> alternateNumberKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> whatsappNumberkey = GlobalKey<FormState>();
  GlobalKey<FormState> secondaryemailKey = GlobalKey<FormState>();
  GlobalKey<FormState> streetkey = GlobalKey<FormState>();
  GlobalKey<FormState> zipcodekey = GlobalKey<FormState>();
  GlobalKey<FormState> instragramkey = GlobalKey<FormState>();
  GlobalKey<FormState> facebookkey = GlobalKey<FormState>();
  GlobalKey<FormState> snapchatkey = GlobalKey<FormState>();

  @override
  void onInit() {
    getCountry();
    getMartialStatus();
    profiledetail();
    super.onInit();
  }

  @override
  void disposed() {}

  profiledetail() async {
    var res = await apiServices.dashboard(
        Endpoints.baseUrl!, "${Endpoints.dashboard!}8860373603");
    if (res != null) {
      model = res;
      loadingStudentPanelData = 1.obs;
      update();
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
      print(StackTrace.current);
      getToast(e.toString());
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
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getState(String countryId) async {
    try {
      loadingState.value = false;
      stateList = [];
      stateCode = [];
      stateSelected = null;
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
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getCity(String state) async {
    try {
      loadingCity.value = false;
      cityCode = [];
      cityList = [];
      citySelected = null;
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
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  updateData(PersonalInformationModel personalInformationModel) {
    apiServices.personalInformationDataUpdate(
        personalInformationModel, Endpoints.personalDetailUpdate);
  }
}
