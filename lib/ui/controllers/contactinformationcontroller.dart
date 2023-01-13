import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ContactInformationController extends BaseController {
  ApiServices apiServices = ApiServices();

// Selected fields
  String? genderSelected;
  String? maritalStatusSelected;
  String? childcountSelected;
  String? countrySelected;
  String? stateSelected;
  String? citySelected;
  String? dob;

//  Dropdown Fields
  List<String> countryList = [];
  List<String> countryCode = [];
  List<String> stateList = [];
  List<String> stateCode = [];
  List<String> cityList = [];
  List<String> cityCode = [];

  //Loading
  RxBool loadingCountry = false.obs;
  RxBool loadingState = false.obs;
  RxBool loadingCity = false.obs;

  @override
  void onInit() {
    getCountry();
    super.onInit();
  }

  getCountry() async {
    try {
      loadingCountry.value == false;
      var res =
          await apiServices.getCountry(Endpoints.baseUrl!, Endpoints.country!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        temp.forEach((element) {
          countryList.add(element);
        });
        temp = map.values.toList();
        temp.forEach((element) {
          countryCode.add(element.toString());
        });

        loadingCountry = true.obs;
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
      var res = await apiServices.getState(
          Endpoints.baseUrl!, Endpoints.state!, countryId);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        temp.forEach((element) {
          stateList.add(element);
        });
        temp = map.values.toList();
        temp.forEach((element) {
          stateCode.add(element.toString());
        });

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
      List tempList;
      var res =
          await apiServices.getCity(Endpoints.baseUrl!, Endpoints.city!, state);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        temp.forEach((element) {
          cityList.add(element);
        });
        temp = map.values.toList();
        temp.forEach((element) {
          cityCode.add(element.toString());
        });
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
