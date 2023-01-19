import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ContactInformationController extends BaseController {
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
  int? genderId, maritalStatusId, childrenCount, countryId, stateId, cityId;

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

  @override
  void onInit() {
    getCountry();
    getMartialStatus();
    super.onInit();
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
