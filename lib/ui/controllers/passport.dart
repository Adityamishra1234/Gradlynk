import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/passport.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class PassportController extends BaseController {
  ApiServices apiServices = ApiServices();
  PassportModel passportModel = PassportModel();

  //Field
  List countryList = [];
  List countryCode = [];
  List stateList = [];
  List stateCode = [];
  List cityList = [];
  List cityCode = [];
  List placeOfIssuse = [];

  //Loading
  RxBool loadingPassport = false.obs;
  RxBool loadingCountry = false.obs;
  RxBool loadingState = false.obs;
  RxBool loadingCity = false.obs;
  RxBool loadingPlaceOfIssuse = false.obs;
  RxBool loadingFirstTime = false.obs;

//button
  RxBool editSave = false.obs;

//dropdown
  RxBool passportAvaliable = true.obs;

// Selected
  String? countrySelected;
  String? countryCodeSelected;
  String? stateSelected;
  String? stateCodeSelected;
  String? placeOfIssuseSelected;
  String? citizenSelected;
  String? citizenCodeSelected;
  String? dateOfIssue;
  String? expireDate;

  @override
  void onInit() {
    getPassPortDetail("78623");
    getCountry();
    getPlaceOfIssue();
    super.onInit();
  }

  updatePassportDetail(String? enq_id, PassportModel passportModel) async {
    var res = await apiServices.updatePassport(
        passportModel, Endpoints.updatepassPostDetails! + enq_id!);
  }

  getPassPortDetail(String? enq_id) async {
    var res = await apiServices.viewPassportDetail(
        Endpoints.baseUrl!, Endpoints.viewPassport! + enq_id!);
    if (res != null) {
      passportModel = res;

      loadingPassport.value = true;

      update();
    }
  }

  getCountry() async {
    loadingCountry.value == false;
    var res =
        await apiServices.getCountry(Endpoints.baseUrl!, Endpoints.allCountry!);
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
  }

  getState(String countryId) async {
    stateList = [];
    stateCode = [];
    stateCodeSelected = null;
    stateSelected = null;
    loadingState.value = false;
    var res = await apiServices.getState2(
        Endpoints.baseUrl!, Endpoints.state! + countryId);
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
      if (getNUllChecker(passportModel.stateOfIssue) == false) {
        for (var i = 0; i < stateCode.length; i++) {
          if (stateCode[i] == passportModel.stateOfIssue) {
            stateCodeSelected = passportModel.stateOfIssue;
            stateSelected = stateList[i];
          }
        }
      }
      loadingState = true.obs;
      update();
    }
  }

  getPlaceOfIssue() async {
    var res = await apiServices.dropDown1(
        Endpoints.baseUrl!, Endpoints.passportPlaceOfIssuse!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      placeOfIssuse = map.values.toList();
      loadingPlaceOfIssuse.value = true;
      update();
    }
  }
}
