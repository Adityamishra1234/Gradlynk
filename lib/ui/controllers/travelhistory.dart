import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/travelhistory.dart';
import 'package:studentpanel/utils/endpoint.dart';

class TravelHistoryController extends BaseController {
  ApiServices apiServices = ApiServices();
  List<TravelHistoryModel> travelHistoryList = [];

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

  // View / Add
  RxBool viewDetails = false.obs;
  RxBool applicationNumberField = true.obs;

  // Selected
  String? travelAbroadSelected;
  String? travelStatusSelected;
  String? countrySelected;
  String? countryCodeSelected;
  String? typeOfVisaSelected;
  String? typeOfVisaCodeSelected;
  String? visaStatusSelected;
  String? visaStatusCodeSelected;
  String? proofAvailable;

  @override
  void onInit() {
    getTypeOfVisa();
    getTravelStatus();
    getCountry();
    // getTypeOfVisa();
    getVisaTravelHistory("78623");
    super.onInit();
  }

  getTravelStatus() async {
    var res = await apiServices.dropDown1(
        Endpoints.baseUrl!, Endpoints.travelStatus!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      travelStatus = map.values.toList();
      loadingtravelStatus.value = true;
      update();
    }
  }

  getTypeOfVisa() async {
    var res =
        await apiServices.dropDown1(Endpoints.baseUrl!, Endpoints.typeOfVisa!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      typeOfVisaList = map.values.toList();
      typeofVisaCode = map.keys.toList();
      loadingTypeVisa.value = true;
      update();
    }
  }

  getVisaStatus(String travelStatus) async {
    var res = await apiServices.dropDown1(
        Endpoints.baseUrl!, Endpoints.visaStatus! + travelStatus!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      visaStatusList = map.values.toList();
      visaStatusCode = map.keys.toList();
      loadingVisaStatus.value = true;
      update();
    }
  }

  getCountry() async {
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
  }

  getVisaTravelHistory(String enq_id) async {
    var res = await apiServices.getTravelHistory(
        Endpoints.baseUrl!, Endpoints.viewTravelDetails! + enq_id);
    if (res != null) {
      travelHistoryList = res;
      loadingVisaTravelDetails.value = true;
      update();
    }
  }

  updateTravelHistory(String enq_id, String travelHistory) async {
    String endpoint;
    endpoint = Endpoints.addTravelHistoryPart1! +
        enq_id +
        Endpoints.addTravelHistoryPart2! +
        travelHistory;
    for (var i = 0; i < travelHistoryList.length; i++) {
      endpoint = endpoint +
          addTravelHistoryPart3(
              i.toString(),
              travelHistoryList[i].travelStatus.toString(),
              travelHistoryList[i].proofAvailable.toString(),
              travelHistoryList[i].countryName,
              travelHistoryList[i].chooseCountry.toString(),
              travelHistoryList[i].typeOfVisa.toString(),
              travelHistoryList[i].visaStatus,
              travelHistoryList[i].dateOfRejection,
              travelHistoryList[i].reasonOfRejection,
              travelHistoryList[i].applicationNumber,
              travelHistoryList[i].visaNumber,
              travelHistoryList[i].dateOfApplication);
    }
    print(endpoint);
    var res = await apiServices.updateTravelHistory(endpoint);
  }
}
