import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/affiliationdropdown.dart';
import 'package:studentpanel/ui/models/institutiondropdown.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/ui/models/stream.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class QualificationDetailsController extends BaseController {
  ApiServices apiServices = ApiServices();
  List<QualificationDetailsViewModel> modelList = [];

  //create dropdown field list / code list
  List highestQualificationList = [];
  List highestQualificationCode = [];
  List streamList = [];
  List streamCode = [];
  List educationStatusList = [];
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
  List yearofPassing = [];

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
  RxBool loadingyearOfpassing = false.obs;
  RxBool loadingEditQualification = false.obs;

  // set view Qualification/Add Qualification
  RxBool addedQualification = false.obs;
  RxBool updteForEdit = true.obs;
  int? modelindex;

  // Selected Field
  String? highestQualificationSelected,
      affiliationCodeSelected,
      affiliationNameSelected,
      streamSelected,
      educationStatusSelected,
      yearOfPassingSelected,
      countrySelected,
      stateSelected,
      citySelected,
      institutionSelected;
  String? highestQualificationSelectedID,
      streamSelectedID,
      countrySelectedID,
      stateSelectedID,
      citySelectedID,
      institutionSelectedID;

  @override
  void onInit() {
    getHighestQualification();
    getStream();
    getCountryOfEducation();
    getYearOfpassing();
    getEducationStatus();
    viewQualification("78623");
    super.onInit();
  }

//use for Edit case

  getEdit(
      String countryId,
      String? state,
      String? stateID,
      String? city,
      String? cityID,
      String? affiliation,
      String? affiliationID,
      String? institution,
      String? institutionId) {
    getStateEdit(countryId, state, stateID);
    if (stateID != null) {
      getCityEdit(stateID, city, cityID);
    }
    getAffiliationEdit(countryId, affiliation, affiliationID);
    if (cityID != null) {
      geInstitutionEdit(cityID, institution, institutionId);
    }
  }

  getStateEdit(String countryId, String? state, String? stateID) async {
    try {
      loadingState = false.obs;
      stateList = [];
      stateCode = [];
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
        stateSelected = state;
        stateSelectedID = stateID;
        loadingState = true.obs;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getCityEdit(String stateId, String? city, String? cityID) async {
    try {
      loadingCity.value = false;
      cityCode = [];
      cityList = [];
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
        citySelected = city;
        citySelectedID = cityID;
        loadingCity = true.obs;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getAffiliationEdit(
      String countryId, String? affiliation, String? affiliationID) async {
    try {
      loadingAffiliation = false.obs;
      affiliationList = [];
      affiliationCode = [];
      List<AffiliationDropDownModel> affiliationDropDown = [];
      var res = await apiServices.getAffiliation(Endpoints.baseUrl!,
          Endpoints.affiliationForCountry! + countryId.toString());
      if (res != null) {
        affiliationDropDown = res;
        affiliationDropDown.forEach((element) {
          affiliationList.add(element.affiliationName);
          affiliationCode.add(element.id);
          affiliationCodeSelected = affiliationID ?? affiliationList[0];
          affiliationNameSelected = affiliation ?? affiliationCode[0];
          loadingAffiliation.value = true;
          update();
        });
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  geInstitutionEdit(
      String cityId, String? institution, String? institutionId) async {
    try {
      institutionCode = [];
      institutionList = [];
      loadingAffiliation.value = false;
      var res = await apiServices.getInstitute(
          Endpoints.baseUrl!, Endpoints.instituteForCity! + cityId.toString());
      if (res != null) {
        List<InstitutionDropDown> dropdown = [];
        dropdown = res;
        for (var i = 0; i < dropdown.length; i++) {
          institutionCode.add(dropdown[i].id);
          institutionList.add(dropdown[i].universityName);
        }
        // Map map = Map<String, dynamic>.from(res);
        // List<dynamic> temp = map.keys.toList();
        // temp.forEach((element) {
        //   institutionList.add(element);
        // });
        // temp = map.values.toList();
        // temp.forEach((element) {
        //   institutionCode.add(element.toString());
        // });
        institutionSelected = institution ?? institutionList[0];
        institutionSelectedID = institutionId ?? institutionCode[0];
        loadingInstitution = true.obs;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getHighestQualification() async {
    try {
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
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getStream() async {
    try {
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
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getCountryOfEducation() async {
    try {
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

  updateQualification(String enqId) async {
    String endpoint = Endpoints.addQualification! + enqId;
    for (var i = 0; i < modelList.length; i++) {
      endpoint = endpoint +
          getAddQualificationPart2(
              i.toString(),
              modelList[i].qualificationId ?? "",
              modelList[i].courseName ?? "",
              modelList[i].cityId ?? "",
              modelList[i].stateId ?? "",
              modelList[i].countryId ?? "",
              modelList[i].reapperCount ?? "",
              modelList[i].grade ?? "",
              modelList[i].multiplier ?? "",
              modelList[i].percentage ?? "",
              modelList[i].passingInstId ?? "",
              modelList[i].streamId ?? "",
              modelList[i].affiliationId ?? "",
              modelList[i].educationStatus ?? "",
              modelList[i].yearOfPassing ?? "");
    }
    await apiServices.updateQualification(endpoint);
  }

  viewQualification(String enq_id) async {
    var res = await apiServices.getQualificationDetails(
        Endpoints.baseUrl!, Endpoints.viewQualificationDetails! + enq_id);
    if (res != null) {
      modelList = res;
      loadingViewQualification.value = true;
      update();
    }
  }

  setaddedQualification(bool data) {
    addedQualification.value = data;
    update();
  }

  getYearOfpassing() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.yearofpassing!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        yearofPassing = map.values.toList();
        loadingyearOfpassing.value = true;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getEducationStatus() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.educationStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        educationStatusList = map.values.toList();
        loadingEducationStatus.value = true;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getState(String countryId) async {
    try {
      loadingState = false.obs;
      stateList = [];
      stateCode = [];
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
        // stateSelected = null;
        // stateSelectedID = null;
        loadingState = true.obs;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getCity(String stateId) async {
    try {
      loadingCity.value = false;
      cityCode = [];
      cityList = [];
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
        // citySelected = null;
        // citySelectedID = null;
        loadingCity = true.obs;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  getAffiliation(String countryId) async {
    try {
      loadingAffiliation = false.obs;
      affiliationList = [];
      affiliationCode = [];
      List<AffiliationDropDownModel> affiliationDropDown = [];
      var res = await apiServices.getAffiliation(Endpoints.baseUrl!,
          Endpoints.affiliationForCountry! + countryId.toString());
      if (res != null) {
        affiliationDropDown = res;
        affiliationDropDown.forEach((element) {
          affiliationList.add(element.affiliationName);
          affiliationCode.add(element.id);
          // affiliationCodeSelected = null;
          // affiliationNameSelected = null;

          loadingAffiliation = true.obs;
          update();
        });
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  geInstitution(String cityId) async {
    try {
      affiliationCode = [];
      affiliationList = [];
      loadingAffiliation.value = false;
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
          institutionCode.add(element.toString());
        });
        // institutionSelected = null;
        // institutionSelectedID = null;
        loadingInstitution = true.obs;
        update();
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }
}
