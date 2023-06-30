import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/idsfromZipCode.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

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

  List gender = ["Select gender", "Male", "Female", "Other"];

  StudentPanel model = StudentPanel();

  static TextEditingController firstName = TextEditingController();
  static TextEditingController lastName = TextEditingController();
  static TextEditingController mobileNumber = TextEditingController();
  static TextEditingController alt_Number = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController whatsappNumber = TextEditingController();
  static TextEditingController secondaryNumber = TextEditingController();
  static TextEditingController secondaryEmail = TextEditingController();
  static TextEditingController street = TextEditingController();
  static TextEditingController zipCode = TextEditingController();
  static TextEditingController instagramId = TextEditingController();
  static TextEditingController facebookId = TextEditingController();
  static TextEditingController snapchatId = TextEditingController();
  static TextEditingController otherCountryinterested = TextEditingController();
  static TextEditingController assignedBranch = TextEditingController();
  static TextEditingController service = TextEditingController();
  static TextEditingController firstCountryInterest = TextEditingController();
  static TextEditingController assignedAdvisors = TextEditingController();

  GlobalKey<FormState> profilePageKey = GlobalKey<FormState>();

  @override
  void onInit() {
    getCountry();
    getMartialStatus();
    profiledetail();
    super.onInit();
    change(null, status: RxStatus.success());
  }

  @override
  void onClose() {
    profilePageKey;
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
        fieldUpdate();
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
    var res = await apiServices.personalInformationDataUpdate(
        personalInformationModel, Endpoints.personalDetailUpdate);
    change(null, status: RxStatus.success());
    return res;
  }

  saveButton() {
    try {
      if (getNUllChecker(firstName.text) == true) {
        getToast(SnackBarConstants.firstNameError!);
      } else if (profilePageKey.currentState!.validate() != true) {
        getToast(SnackBarConstants.contactInformationErrorForAllFields!);
      } else if (getNUllChecker(lastName.text) == true) {
        getToast(SnackBarConstants.lastNameError!);
      } else if (getNUllChecker(dob)) {
        getToast(SnackBarConstants.dobError!);
      } else if (getNUllChecker(genderIdSelected) == true) {
        getToast(SnackBarConstants.genderError!);
      } else if (getNUllChecker(maritalStatusSelected) == true) {
        getToast(SnackBarConstants.maritalStatusError!);
      } else if (getNUllChecker(mobileNumber.text) == true) {
        getToast(SnackBarConstants.mobileNumberError!);
      } else if (getNUllChecker(alt_Number.text) == true) {
        getToast(SnackBarConstants.alternateNumberError!);
      } else if (getNUllChecker(email.text)) {
        getToast(SnackBarConstants.emailError!);
      } else if (getNUllChecker(countrySelected)) {
        getToast(SnackBarConstants.countryError!);
      } else if (getNUllChecker(stateSelected)) {
        getToast(SnackBarConstants.stateError!);
      } else if (getNUllChecker(citySelected)) {
        getToast(SnackBarConstants.cityError!);
      } else if (getNUllChecker(zipCode.text)) {
        getToast(SnackBarConstants.zipCodeError!);
      } else {
        var res = updatePesonalDetail(
            Get.find<BaseController>().model1.id!,
            firstName.text,
            lastName.text,
            dob,
            genderIdSelected!,
            maritalStatusIdSelected!,
            childrenCountSelected!,
            mobileNumber.text,
            email.text,
            int.parse(whatsappNumber.text),
            int.parse(alt_Number.text),
            countryIdSelected!,
            stateIdSelected!,
            cityIdSelected!,
            street.text,
            int.parse(zipCode.text),
            facebookId.text,
            snapchatId.text,
            instagramId.text,
            secondaryEmail.text);
        return res;
      }
    } catch (e) {
      print(StackTrace.current);
      getToast(e.toString());
    }
  }

  updatePesonalDetail(
      int id,
      String firstName,
      String lastName,
      String? dateOfBirth,
      int genderId,
      int maritalStatusId,
      int childCount,
      String mobile,
      String email,
      int whatsappNumber,
      int secondaryNumber,
      int countryId,
      int stateId,
      int cityId,
      String street,
      int pincode,
      String facebookId,
      String snapchatId,
      String instagramId,
      String secondaryEmail) {
    PersonalInformationModel personalInformationModel =
        PersonalInformationModel(
            id: id,
            dateOfBirth: dateOfBirth,
            genderId: genderId,
            enquiryName: firstName,
            familyName: lastName,
            email: email,
            secondaryEmail: secondaryEmail,
            mobile: mobile,
            maritalStatusId: maritalStatusId,
            childrenCount: childCount,
            whatsappNumber: whatsappNumber,
            alternateNumber: secondaryNumber,
            countryId: countryId,
            stateId: stateId,
            cityId: cityId,
            street: street,
            zipCode: pincode,
            instagramId: instagramId,
            facebookId: facebookId,
            snapchatId: snapchatId);
    var res = updateData(personalInformationModel);

    return res;
    // saveAndEdit = true;
    // setState(() {});
  }

  fieldUpdate() {
    try {
      if (loadingStudentPanelData.value == 1) {
        for (var i = 0; i < model.addtionalDetails!.length; i++) {
          if (model.addtionalDetails![i].serviceName == "Student Visa") {
            ContactInformationController.assignedBranch.text =
                model.addtionalDetails![i].branchName ?? "";
            ContactInformationController.service.text =
                model.addtionalDetails![i].serviceName ?? "";
            ContactInformationController.firstCountryInterest.text =
                model.addtionalDetails![i].countryName ?? "";
            ContactInformationController.assignedAdvisors.text =
                model.addtionalDetails![i].assigned_advisor ?? "";
            if (getNUllChecker(model.addtionalDetails![i].assigne) == false) {
              ContactInformationController.assignedAdvisors.text =
                  ContactInformationController.assignedAdvisors.text +
                      model.addtionalDetails![i].assigne!;
            }
          }
        }

        dob = model.dateOfBirth;
        ContactInformationController.firstName.text = model.enquiryName ?? "";
        ContactInformationController.lastName.text = model.lastname ?? "";
        ContactInformationController.mobileNumber.text =
            getNUllChecker(model.mobile) == false
                ? model.mobile.toString()
                : "";

        ContactInformationController.email.text = model.email ?? "";
        ContactInformationController.whatsappNumber.text =
            getNUllChecker(model.whatsappNumber.toString()) == false
                ? model.whatsappNumber.toString()
                : "";
        ContactInformationController.alt_Number.text =
            getNUllChecker(model.alternateNumber.toString()) == false
                ? model.alternateNumber.toString()
                : "";
        childrenCountSelected = model.child_count;
        ContactInformationController.secondaryEmail.text =
            model.secondaryEmail ?? "";
        ContactInformationController.street.text = model.street ?? "";
        ContactInformationController.zipCode.text =
            getNUllChecker(model.pincode) == false
                ? model.pincode.toString()
                : "";
        genderSelected = model.gender ?? gender[0];
        for (var i = 0; i < gender.length; i++) {
          if (gender[i].toString() == model.gender.toString()) {
            genderSelected = gender[i];
            genderIdSelected = i;
            update();
          }
        }
        maritalStatusSelected = model.maritalStatus;
        for (var i = 1; i < martialStatusList.length; i++) {
          if (martialStatusList[i].toString() ==
              model.maritalStatus.toString()) {
            maritalStatusSelected = martialStatusList[i];
            maritalStatusIdSelected = i;
            update();
          }
        }
        countrySelected = model.countryName;
        stateSelected = model.stateName;
        citySelected = model.cityName;
        String? temp = "";
        if (model.otherCountryOfInterest != null) {
          for (var i = 0; i < model.otherCountryOfInterest!.length; i++) {
            if (i == 0) {
              temp = model.otherCountryOfInterest![i].countryName!;
            } else {
              temp =
                  "${temp!},${model.otherCountryOfInterest![i].countryName!}";
            }
          }
        }
        getState(model.countryID.toString());
        getCity(model.stateID.toString());
        stateIdSelected = model.stateID;
        cityIdSelected = model.cityID;
        countryIdSelected = model.countryID;
        stateSelected = model.stateName;
        citySelected = model.cityName;
        ContactInformationController.otherCountryinterested.text = temp!;
        loadingStudentPanelData.value = 3;
        update();
      }
    } catch (e) {
      ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }
}
