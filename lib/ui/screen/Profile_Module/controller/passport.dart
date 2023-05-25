import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/passport.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

class PassportController extends GetxController with StateMixin {
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

  bool? updateData = false;

  static final passportNumber = TextEditingController();

  @override
  void onInit() {
    getPassPortDetail(Get.find<BaseController>().model1.id.toString());
    getCountry();
    getPlaceOfIssue();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  updatePassportDetail(String? enqId, PassportModel passportModel) async {
    change(null, status: RxStatus.loading());
    var res = await apiServices.updatePassport(
        passportModel, Endpoints.updatepassPostDetails! + enqId!);
    updateData = true;

    change(null, status: RxStatus.success());
    return true;
  }

  getPassPortDetail(String? enqId) async {
    try {
      var res = await apiServices.viewPassportDetail(
          Endpoints.baseUrl!, Endpoints.viewPassport! + enqId!);
      if (res != null) {
        passportModel = res;

        loadingPassport.value = true;

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
      var res = await apiServices.getCountry(
          Endpoints.baseUrl!, Endpoints.allCountry!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
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

  getState(String countryId) async {
    try {
      stateList = [];
      stateCode = [];
      stateCodeSelected = null;
      stateSelected = null;
      loadingState.value = false;
      loadingPlaceOfIssuse.value = false;

      var res = await apiServices.getState2(
          Endpoints.baseUrl!, Endpoints.state! + countryId);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        for (var element in temp) {
          stateList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          stateCode.add(element.toString());
        }
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
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getPlaceOfIssue() async {
    try {
      placeOfIssuse = [];
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.passportPlaceOfIssuse!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        placeOfIssuse = map.values.toList();
        loadingPlaceOfIssuse.value = true;
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

  saveButton() async {
    if (passportAvaliable.value == true) {
      editSave.value = false;
      update();
      updatePassport();
    } else {
      if (citizenSelected == null) {
        getToast(SnackBarConstants.citizenSelectError!);
      } else if (passportNumber.text.isEmpty) {
        getToast(SnackBarConstants.passportNumberError!);
      } else if (countrySelected == null) {
        getToast(SnackBarConstants.countrySelectError!);
      } else if (stateSelected == null) {
        getToast(SnackBarConstants.stateError!);
      } else if (placeOfIssuseSelected == null) {
        getToast(SnackBarConstants.placeSelectError!);
      } else if (dateOfIssue == null) {
        getToast(SnackBarConstants.dateOfISsueSelectError!);
      } else if (expireDate == null) {
        getToast(SnackBarConstants.expireDateError!);
      } else {
        editSave.value = false;
        update();
        var res = await updatePassport();
        if (res != true) {
          return true;
        }
      }
    }
  }

  updatePassport() async {
    passportModel.dateOfIssue = dateOfIssue;
    passportModel.expiryDate = expireDate;
    //  controller.passportModel.passportTentativeDate
    passportModel.passportNumber = passportNumber.text;
    passportModel.citizenOf = citizenCodeSelected;
    passportModel.countryOfIssue = countryCodeSelected;
    passportModel.stateOfIssue = stateCodeSelected;
    passportModel.placeOfIssue = placeOfIssuseSelected;
    passportModel.passportAvailable =
        passportAvaliable.value == true ? "2" : "1";
    passportModel.enqId = Get.find<BaseController>().model1.id.toString();

    var res = await updatePassportDetail(
        Get.find<BaseController>().model1.id.toString(), passportModel);
    if (res != true) {
      return true;
    }
  }
}
