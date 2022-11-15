import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/ui/models/stream.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/utils/endpoint.dart';

class QualificationDetailsController extends BaseController {
  ApiServices apiServices = ApiServices();
  QualificationDetailsViewModel qualificationDetailsView =
      QualificationDetailsViewModel();

  //create dropdown field list / code list
  List highestQualificationList = [];
  List highestQualificationCode = [];
  List streamList = [];
  List streamCode = [];
  List educationStatusList = [];
  List educationStatusCode = [];
  List countryList = [];
  List countryCode = [];
  List stateList = [];
  List stateCode = [];
  List cityList = [];
  List cityCode = [];
  List affiliationList = [];
  List affiliationCode = [];
  List institutionList = [];
  List institutionCode = [];

  // loading
  RxBool loadingHighestQualification = false.obs;
  RxBool loadingStream = false.obs;
  RxBool loadingEducationStatus = false.obs;
  RxBool loadingCountry = false.obs;
  RxBool loadingState = false.obs;
  RxBool loadingCity = false.obs;
  RxBool loadingAffiliation = false.obs;
  RxBool loadingInstitution = false.obs;
  RxBool loadingViewQualification = false.obs;

  // set view Qualification/Add Qualification
  RxBool addedQualification = false.obs;

  @override
  void onInit() {
    getHighestQualification();
    getStream();
    getCountryOfEducation();
    super.onInit();
  }

  getHighestQualification() async {
    var res = await apiServices.getHighestQualification(
        Endpoints.baseUrl!, Endpoints.highestQualification!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      List<dynamic> temp = map.keys.toList();
      temp.forEach((element) {
        highestQualificationList.add(element);
      });
      temp = map.values.toList();
      temp.forEach((element) {
        highestQualificationCode.add(element.toString());
      });

      loadingHighestQualification = true.obs;
      update();
    }
  }

  getStream() async {
    List<StreamDropDown> streamDropDownList = [];
    var res = await apiServices.getStream(
        Endpoints.baseUrl!, Endpoints.viewCourseStream!);
    if (res != null) {
      streamDropDownList = res;
      streamDropDownList.forEach((element) {
        streamCode.add(element.id);
        streamList.add(element.streamName);
      });
      loadingStream = true.obs;
      update();
    }
  }

  getCountryOfEducation() async {
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

  getState(String countryId) async {
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
      loadingState = true.obs;
      update();
    }
  }

  getCity(int stateId) async {
    var res = await apiServices.getCity2(
        Endpoints.baseUrl!, Endpoints.city! + stateId.toString());
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
      update();
    }
  }

  getAffiliation(int countryId) async {
    var res = await apiServices.getAffiliation(Endpoints.baseUrl!,
        Endpoints.affiliationForCountry! + countryId.toString());
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      List<dynamic> temp = map.keys.toList();
      temp.forEach((element) {
        affiliationList.add(element);
      });
      temp = map.values.toList();
      temp.forEach((element) {
        affiliationCode.add(element.toString());
      });
      loadingAffiliation = true.obs;
      update();
    }
  }

  geInstitution(int cityId) async {
    var res = await apiServices.getInstitute(
        Endpoints.baseUrl!, Endpoints.instituteForCity! + cityId.toString());
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      List<dynamic> temp = map.keys.toList();
      temp.forEach((element) {
        institutionList.add(element);
      });
      temp = map.values.toList();
      temp.forEach((element) {
        institutionList.add(element.toString());
      });
      loadingInstitution = true.obs;
      update();
    }
  }

  addQualification() {}

  viewQualification() async {
    var res = await apiServices.getQualificationDetails(
        Endpoints.baseUrl!, Endpoints.viewQualificationDetails!);
    if (res != null) {
      qualificationDetailsView = res;
      loadingViewQualification.value = true;
      update();
    }
  }

  setaddedQualification(bool data) {
    addedQualification.value = data;
    update();
  }

  // [complete,Pursuing,Awaiting results]
  // getEducationStatus() async {
  //   var res = await apiServices.getEducationStatus(
  //       Endpoints.baseUrl!, Endpoints.);
  //   if (res != null) {
  //     Map map = Map<String, dynamic>.from(res);
  //     List<dynamic> temp = map.keys.toList();
  //     temp.forEach((element) {
  //       stateList.add(element);
  //     });
  //     temp = map.values.toList();
  //     temp.forEach((element) {
  //       streamCode.add(element.toString());
  //     });

  //     loadingStream = true.obs;
  //     update();
  //   }
  // }\

// 1995-2030
  // getYearofPassing() {}
}
