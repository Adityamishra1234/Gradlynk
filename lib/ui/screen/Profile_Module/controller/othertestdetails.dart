import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/otherTestDetails.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

class OtherTestDetailsController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  OtherTestDetailsModel otherTestDetailsModel = OtherTestDetailsModel();

  // loading
  RxBool loadingExamStaus = false.obs;
  RxBool loadingExamName = false.obs;
  RxBool tentative = true.obs;
  RxBool loadingViewOtherTestDetails = false.obs;
  RxBool editSave = true.obs;
  RxBool loadingEdit = false.obs;

//Field for Storing Data with API
  List examStatusList = [];
  List examStatusCode = [];
  List examNameList = [];

  //Selected
  String? examStatusSelected;
  String? examStatusSelectedID;
  String? examNameSelected = "GRE";
  String? examNameSelectedID;
  String? bookTestSelected;
  String? bookTestSelectedID;
  String? specifyExamNameSelected;
  String? specifyExamNameSelectedID;
  String? tentaiveDefinite = "Tentative";
  String? dateOfExamSelected;
  String? dateOftestReportSelected;
  String? testScoreExpirationDateSelected;
  String? tentativeDateSelected;

//Text field
  static final analyticalWriting = TextEditingController();
  static final verbalReasoning = TextEditingController();
  static final quantitative = TextEditingController();
  static final integrateedReasoning = TextEditingController();
  static final reading = TextEditingController();
  static final writingAndLanguage = TextEditingController();
  static final essay = TextEditingController();
  static final math = TextEditingController();
  static final overallScore = TextEditingController();

  @override
  Future<void> onInit() async {
    await getExamName();
    await getExamStatus();
    await getOtherTestDetails(Get.find<BaseController>().model1.id.toString());
    change(null, status: RxStatus.success());
    super.onInit();
  }

  getExamStatus() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.examStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        examStatusList = map.values.toList();
        examStatusCode = map.keys.toList();
        loadingExamStaus.value = true;
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

  getExamName() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.examNameOtherTest!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        examNameList = map.values.toList();
        loadingExamName.value = true;
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

  getOtherTestDetails(String enqId) async {
    try {
      var res = await apiServices.viewOtherTestDetails(
          Endpoints.baseUrl!, Endpoints.viewOtherTestDetails! + enqId);
      if (res != null) {
        otherTestDetailsModel = res;
        loadingViewOtherTestDetails.value = true;
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

  updateOtherTestDetails(String? enqId) async {
    change(null, status: RxStatus.loading());
    await apiServices.updateOtherTestDetails(
        otherTestDetailsModel, Endpoints.otherTestDetails! + enqId!);
    change(null, status: RxStatus.success());
    return true;
  }

  saveButton() {
    if (examStatusSelected == "Not Yet Registered") {
      if (bookTestSelected == null) {
        getToast(SnackBarConstants.bookTestSelectedError!);
      }
    }
    if (examStatusSelected == null) {
      getToast(SnackBarConstants.examStatusError!);
    } else if (examStatusSelected == "Not Yet Registered") {
      if (bookTestSelected == null) {
        getToast(SnackBarConstants.bookTestSelectedError!);
      } else {
        // DropDown
        otherTestDetailsModel.examStatus = examStatusSelectedID ?? "";
        if (getNUllChecker(examNameSelected) == false) {
          otherTestDetailsModel.examName = examNameSelected;
        } else {
          otherTestDetailsModel.examName = null;
        }
        otherTestDetailsModel.testBook = bookTestSelectedID;
        otherTestDetailsModel.scoreType = tentaiveDefinite;

        // text field
        otherTestDetailsModel.dateOfExam = dateOfExamSelected;
        otherTestDetailsModel.tentativeExamDate = tentativeDateSelected;
        otherTestDetailsModel.resultDate = dateOftestReportSelected;
        otherTestDetailsModel.expirationDate = testScoreExpirationDateSelected;

        // int condition for null
        otherTestDetailsModel.analyticalWriting =
            getNUllChecker(analyticalWriting.text) == false
                ? int.parse(analyticalWriting.text)
                : 0;
        otherTestDetailsModel.verbalReasoning =
            getNUllChecker(verbalReasoning.text) == false
                ? int.parse(verbalReasoning.text)
                : 0;

        otherTestDetailsModel.quantitativeApptitude =
            getNUllChecker(quantitative.text) == false
                ? int.parse(quantitative.text)
                : 0;
        otherTestDetailsModel.integratedReasoning =
            getNUllChecker(integrateedReasoning.text) == false
                ? int.parse(integrateedReasoning.text)
                : 0;
        otherTestDetailsModel.reading =
            getNUllChecker(reading.text) == false ? int.parse(reading.text) : 0;
        otherTestDetailsModel.writing =
            getNUllChecker(writingAndLanguage.text) == false
                ? int.parse(writingAndLanguage.text)
                : 0;
        otherTestDetailsModel.essay =
            getNUllChecker(essay.text) == false ? int.parse(essay.text) : 0;
        otherTestDetailsModel.math =
            getNUllChecker(math.text) == false ? int.parse(math.text) : 0;
        otherTestDetailsModel.overAll =
            getNUllChecker(overallScore.text) == false
                ? int.parse(overallScore.text)
                : 0;
        editSave.value = true;
        return updateOtherTestDetails(
            Get.find<BaseController>().model1.id.toString());
      }
    } else if (examNameSelected == null) {
      getToast(SnackBarConstants.examnameError!);
    } else {
      // DropDown
      otherTestDetailsModel.examStatus = examStatusSelectedID ?? "";
      if (getNUllChecker(examNameSelected) == false) {
        otherTestDetailsModel.examName = examNameSelected;
      } else {
        otherTestDetailsModel.examName = null;
      }
      otherTestDetailsModel.testBook = bookTestSelectedID;
      otherTestDetailsModel.scoreType = tentaiveDefinite;

      // text field
      otherTestDetailsModel.dateOfExam = dateOfExamSelected;
      otherTestDetailsModel.tentativeExamDate = tentativeDateSelected;
      otherTestDetailsModel.resultDate = dateOftestReportSelected;
      otherTestDetailsModel.expirationDate = testScoreExpirationDateSelected;

      // int condition for null
      otherTestDetailsModel.analyticalWriting =
          getNUllChecker(analyticalWriting.text) == false
              ? int.parse(analyticalWriting.text)
              : 0;
      otherTestDetailsModel.verbalReasoning =
          getNUllChecker(verbalReasoning.text) == false
              ? int.parse(verbalReasoning.text)
              : 0;

      otherTestDetailsModel.quantitativeApptitude =
          getNUllChecker(quantitative.text) == false
              ? int.parse(quantitative.text)
              : 0;
      otherTestDetailsModel.integratedReasoning =
          getNUllChecker(integrateedReasoning.text) == false
              ? int.parse(integrateedReasoning.text)
              : 0;
      otherTestDetailsModel.reading =
          getNUllChecker(reading.text) == false ? int.parse(reading.text) : 0;
      otherTestDetailsModel.writing =
          getNUllChecker(writingAndLanguage.text) == false
              ? int.parse(writingAndLanguage.text)
              : 0;
      otherTestDetailsModel.essay =
          getNUllChecker(essay.text) == false ? int.parse(essay.text) : 0;
      otherTestDetailsModel.math =
          getNUllChecker(math.text) == false ? int.parse(math.text) : 0;
      otherTestDetailsModel.overAll = getNUllChecker(overallScore.text) == false
          ? int.parse(overallScore.text)
          : 0;
      editSave.value = true;
      return updateOtherTestDetails(
          Get.find<BaseController>().model1.id.toString());
    }
  }
}
