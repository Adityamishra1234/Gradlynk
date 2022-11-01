import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ContactInformationController extends BaseController {
  ApiServices apiServices = ApiServices();

  List<dynamic> countryList = [];
  List<dynamic> countryCode = [];
  List<dynamic> stateList = [];
  List<dynamic> stateCode = [];
  List<dynamic> cityList = [];
  List<dynamic> cityCode = [];

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
    var res =
        await apiServices.getCountry(Endpoints.baseUrl!, Endpoints.country!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      countryList = map.keys.toList();
      countryCode = map.values.toList();
      loadingCountry.value = true;
      update();
    }
  }

  getState(String country) async {
    var res = await apiServices.getState(
        Endpoints.baseUrl!, Endpoints.state!, country);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      stateList = map.keys.toList();
      stateCode = map.values.toList();
      loadingState = true.obs;
      update();
    }
  }

  getCity(String state) async {
    List tempList;
    var res =
        await apiServices.getCity(Endpoints.baseUrl!, Endpoints.city!, state);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      cityList = map.keys.toList();
      cityCode = map.values.toList();
      loadingCity = true.obs;
      update();
    }
  }
}
