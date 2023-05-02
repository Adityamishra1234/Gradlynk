import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/affiliationdropdown.dart';
import 'package:studentpanel/ui/models/institutiondropdown.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/ui/models/stream.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class QualificationDetailsController extends GetxController with StateMixin {
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
  //0= normal view, 1= loading,2=edit complete;
  RxInt loadingEdit = 0.obs;

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

  static final Rx<TextEditingController> qualificationName =
      TextEditingController().obs;

  static final Rx<TextEditingController> multiplier =
      TextEditingController().obs;

  static final Rx<TextEditingController> cgpa = TextEditingController().obs;

  static final Rx<TextEditingController> percentage =
      TextEditingController().obs;

  static final Rx<TextEditingController> reApper = TextEditingController().obs;

  @override
  void onInit() {
    getHighestQualification();
    getStream();
    getCountryOfEducation();
    getYearOfpassing();
    getEducationStatus();
    viewQualification(Get.find<BaseController>().model1.id.toString());
    change(null, status: RxStatus.success());
    super.onInit();
  }

  resetFields() {
    //Text fields resets
    reApper.value.text = "";
    cgpa.value.text = "";
    percentage.value.text = "";
    reApper.value.text = "";
    multiplier.value.text = "";
    qualificationName.value.text = "";

    //Dropdown
    highestQualificationSelected = null;
    affiliationCodeSelected = null;
    streamSelected = null;
    educationStatusSelected = null;
    yearOfPassingSelected = null;
    countrySelected = null;
    stateSelected = null;
    citySelected = null;
    highestQualificationSelectedID = null;
    streamSelectedID = null;
    countrySelectedID = null;
    stateSelectedID = null;
    citySelectedID = null;
    institutionSelectedID = null;
    institutionSelected = null;

    updteForEdit.value = true;
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
      String? institutionId) async {
    try {
      getStateEdit(countryId, state, stateID);
      if (stateID != null) {
        await getCityEdit(stateID, city, cityID);
      }
      await getAffiliationEdit(countryId, affiliation, affiliationID);
      if (cityID != null) {
        await geInstitutionEdit(cityID, institution, institutionId);
      }
      loadingEdit = 0.obs;
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

  getStateEdit(String countryId, String? state, String? stateID) async {
    try {
      loadingState = false.obs;
      loadingCity = false.obs;
      loadingInstitution = false.obs;
      stateList = [];
      stateCode = [];
      var res = await apiServices.getState2(
          Endpoints.baseUrl!, Endpoints.state! + countryId);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        stateList.add("Select State");
        stateCode.add(0);
        for (var element in temp) {
          stateList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          stateCode.add(element.toString());
        }
        stateSelected = state;
        stateSelectedID = stateID;
        loadingState = true.obs;
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

  getCityEdit(String stateId, String? city, String? cityID) async {
    try {
      loadingCity.value = false;
      loadingInstitution = false.obs;
      cityCode = [];
      cityList = [];
      var res = await apiServices.getCity2(
          Endpoints.baseUrl!, Endpoints.city! + stateId.toString());
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        cityList.add("Select City");
        cityCode.add(0);
        for (var element in temp) {
          cityList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          cityCode.add(element.toString());
        }
        citySelected = city;
        citySelectedID = cityID;
        loadingCity = true.obs;
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
        for (var element in affiliationDropDown) {
          affiliationList.add("Select Affiliation");
          affiliationCode.add(0);
          affiliationList.add(element.affiliationName);
          affiliationCode.add(element.id);
          affiliationCodeSelected = affiliationID;
          affiliationNameSelected = affiliation;
          loadingAffiliation.value = true;
          update();
        }
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

  geInstitutionEdit(
      String cityId, String? institution, String? institutionId) async {
    try {
      institutionCode = [];
      institutionList = [];

      var res = await apiServices.getInstitute(
          Endpoints.baseUrl!, Endpoints.instituteForCity! + cityId.toString());
      if (res != null) {
        List<InstitutionDropDown> dropdown = [];
        dropdown = res;
        for (var i = 0; i < dropdown.length; i++) {
          institutionCode.add(0);
          institutionList.add("Select Institution");
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
        institutionSelected = institution;
        institutionSelectedID = institutionId;
        loadingInstitution = true.obs;
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

  getHighestQualification() async {
    try {
      var res = await apiServices.getHighestQualification(
          Endpoints.baseUrl!, Endpoints.highestQualification!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        highestQualificationList.add("Select Highest Qualification");
        highestQualificationCode.add(0);
        for (var element in temp) {
          highestQualificationList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          highestQualificationCode.add(element.toString());
        }
        loadingHighestQualification = true.obs;
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

  getStream() async {
    try {
      List<StreamDropDown> streamDropDownList = [];
      var res = await apiServices.getStream(
          Endpoints.baseUrl!, Endpoints.viewCourseStream!);
      if (res != null) {
        streamDropDownList = res;
        streamCode.add(0);
        streamList.add("Select Stream");
        for (var element in streamDropDownList) {
          streamCode.add(element.id);
          streamList.add(element.streamName);
        }
        loadingStream = true.obs;
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

  getCountryOfEducation() async {
    try {
      var res =
          await apiServices.getCountry(Endpoints.baseUrl!, Endpoints.country!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        countryList.add("Select Country");
        countryCode.add(0);
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

  updateQualification(String enqId, [String action = ""]) async {
    change(null, status: RxStatus.loading());
    try {
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
      var res = await apiServices.updateQualification(endpoint, action);
      if (res == true) {
        resetFields();
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

  viewQualification(String enqId) async {
    try {
      var res = await apiServices.getQualificationDetails(
          Endpoints.baseUrl!, Endpoints.viewQualificationDetails! + enqId);
      if (res != null) {
        modelList = res;
        loadingViewQualification.value = true;
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
        yearofPassing.add("Select year of Passing");
        yearofPassing = map.values.toList();
        loadingyearOfpassing.value = true;
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

  getEducationStatus() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.educationStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        educationStatusList.add("Select Education Status");

        educationStatusList.addAll(map.values.toList());
        loadingEducationStatus.value = true;
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
      stateList = [];
      stateCode = [];
      var res = await apiServices.getState2(
          Endpoints.baseUrl!, Endpoints.state! + countryId);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        stateList.add("Select State");
        stateCode.add(0);
        for (var element in temp) {
          stateList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          stateCode.add(element.toString());
        }
        print(stateList);
        // stateSelected = null;
        // stateSelectedID = null;
        loadingState = true.obs;
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
        cityList.add("Select City");
        cityCode.add(0);
        for (var element in temp) {
          cityList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          cityCode.add(element.toString());
        }
        // citySelected = null;
        // citySelectedID = null;
        loadingCity = true.obs;
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
        affiliationList.add("Select Affiliation");
        affiliationCode.add(0);
        for (var element in affiliationDropDown) {
          affiliationList.add(element.affiliationName);
          affiliationCode.add(element.id);
          // affiliationCodeSelected = null;
          // affiliationNameSelected = null;

          loadingAffiliation = true.obs;
          update();
        }
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

  getInstitution([String? countryId, String? stateId, String? cityId]) async {
    try {
      List<InstitutionDropDown> institutionDropDown = [];
      institutionList = [];
      institutionCode = [];
      loadingInstitution.value = false;
      var res = await apiServices.getInstitute(Endpoints.baseUrl!,
          "${Endpoints.instituteForCity!}${cityId}country_id=${countryId}state_id=$stateId");
      if (res != null) {
        institutionDropDown = res;
        institutionList.add("Select Institution");
        institutionCode.add(0);
        for (var element in institutionDropDown) {
          institutionList.add(element.universityName);
          institutionCode.add(element.id);
        }
        loadingInstitution = true.obs;
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

  getUpdateQualificationDetails(int index) async {
    try {
      change(null, status: RxStatus.loading());
      if (index != null) {
        // if (updateForEdit == false) {
        qualificationName.value.text = modelList[index].courseName ?? "";
        multiplier.value.text = modelList[index].multiplier ?? "";
        percentage.value.text = modelList[index].percentage ?? "";
        reApper.value.text = modelList[index].reapperCount ?? "";
        // }
        // if (updateForEdit == false && loadingEditQualification.value == true) {
        loadingEditQualification.value = false;
        highestQualificationSelected = modelList[index].courseLevel;

        streamSelected = modelList[index].streamName ?? "";
        streamSelectedID =
            getNUllChecker(modelList[index].streamId.toString()) == false
                ? modelList[index].streamId.toString()
                : "";
        educationStatusSelected = modelList[index].educationStatus ?? "";
        yearOfPassingSelected = modelList[index].yearOfPassing ?? "";
        countrySelected = modelList[index].countryName;
        Get.find<QualificationDetailsController>().loadingEdit.value = 1;
        // cgpa.text = double.parse(modelList[index].percentage.toString()) /;
        await getEdit(
            modelList[index].countryId!,
            modelList[index].stateName,
            modelList[index].stateId,
            modelList[index].cityName,
            modelList[index].cityId,
            modelList[index].affiliationName,
            modelList[index].affiliationId,
            modelList[index].universityName,
            modelList[index].passingInstId);
        change(null, status: RxStatus.success());
        // }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
