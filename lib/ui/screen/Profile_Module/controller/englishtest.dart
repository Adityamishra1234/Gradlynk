import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

class EnglishTestController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  EnglishTestDetailsViewModel englishTestDetailsViewModel =
      EnglishTestDetailsViewModel();

  // Using for Widget field
  String? examStatusSelected,
      examNameSelected,
      dateOfExamSelected,
      bookTestSelcted,
      specifyExamNameSelected,
      tentativeExamDateSelcted,
      dateOfTestReportSelcted,
      testscoreExpirationDateSelcted;
  int? examStatusCodeSelected = 1;
// specify and ExamName is Same

  // loading
  RxBool loadingExamStaus = false.obs;
  RxBool loadingExamName2 = false.obs;
  RxBool tentative = true.obs;
  RxBool duolingo = false.obs;
  RxBool loadingViewEnglishTestDetails = false.obs;
  RxBool editSave = true.obs;
  RxBool loadingFirstTime = false.obs;

//Field for Storing Data with API
  List examStatusList = [];
  List examStatusCode = [];
  List examNameList = [];

  //TextField
  static final listening = TextEditingController();
  static final writing = TextEditingController();
  static final reading = TextEditingController();
  static final speaking = TextEditingController();
  static final overallScoreController = TextEditingController();
  static final dateOfExam = TextEditingController();
  static final dateOfTestReport = TextEditingController();
  static final testScoreExpirationDate = TextEditingController();
  static final tentativeExamDate = TextEditingController();
  bool? save = false;

  @override
  Future<void> onInit() async {
    List<Future> futures = [
      getExamName(),
      getExamStatus(),
      getEnglishTestDetails(Get.find<BaseController>().model1.id.toString())
    ];

    await Future.wait(futures);

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
        loadingExamStaus = true.obs;
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
      var res =
          await apiServices.dropDown1(Endpoints.baseUrl!, Endpoints.examName!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        examNameList = map.values.toList();
        loadingExamName2 = true.obs;
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

  getEnglishTestDetails(String enqId) async {
    try {
      var res = await apiServices.viewEnglishTestDetails(
          Endpoints.baseUrl!, Endpoints.viewEnglishTestDetails! + enqId);
      if (res != null) {
        englishTestDetailsViewModel = res;
        loadingViewEnglishTestDetails = true.obs;
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

  updateEnglishTestDetaisl(String enqId,
      EnglishTestDetailsViewModel englishTestDetailsViewModel) async {
    change(null, status: RxStatus.loading());
    await apiServices.updateEnglishTestDetails(englishTestDetailsViewModel,
        Endpoints.updateEnglishTesttDetails! + enqId);
    change(null, status: RxStatus.success());
    update();
  }

  saveButton() async {
    if (examStatusSelected == null) {
      getToast(SnackBarConstants.examStatusError!);
      return false;
    } else if (examStatusSelected == "Not Yet Registered") {
      if (bookTestSelcted == null) {
        getToast(SnackBarConstants.bookTestSelectedError!);
        return false;
      } else {
        EnglishTestDetailsViewModel englishTestDetailsViewModel =
            EnglishTestDetailsViewModel();
        englishTestDetailsViewModel = englishTestDetailsViewModel;
        englishTestDetailsViewModel.dateOfExam = dateOfExamSelected;
        englishTestDetailsViewModel.tentativeExamDate =
            tentativeExamDateSelcted;
        englishTestDetailsViewModel.expirationDate =
            testscoreExpirationDateSelcted;
        englishTestDetailsViewModel.resultDate = dateOfTestReportSelcted;
        englishTestDetailsViewModel.enqId =
            Get.find<BaseController>().model1.id.toString();
        englishTestDetailsViewModel.examStatusID =
            examStatusCodeSelected.toString();
        englishTestDetailsViewModel.examName = examNameSelected;
        englishTestDetailsViewModel.reading = reading.text;
        englishTestDetailsViewModel.writing = writing.text;
        englishTestDetailsViewModel.listening = listening.text;
        englishTestDetailsViewModel.speaking = speaking.text;
        englishTestDetailsViewModel.literacy = listening.text;
        englishTestDetailsViewModel.comprehension = writing.text;
        englishTestDetailsViewModel.conversation = reading.text;
        englishTestDetailsViewModel.production = writing.text;

        if (getNUllChecker(tentativeExamDate.text)) {
          englishTestDetailsViewModel.overAll = overallScoreController.text;
        } else {
          englishTestDetailsViewModel.overAll =
              englishTestDetailsViewModel.overAll;
        }

        await updateEnglishTestDetaisl(
            Get.find<BaseController>().model1.id.toString(),
            englishTestDetailsViewModel);
        editSave.value = true;
        update();
      }
    } else {
      if (examNameSelected == null) {
        getToast(SnackBarConstants.examnameError!);
        return false;
      } else {
        EnglishTestDetailsViewModel englishTestDetailsViewModel =
            EnglishTestDetailsViewModel();
        englishTestDetailsViewModel = englishTestDetailsViewModel;
        englishTestDetailsViewModel.dateOfExam = dateOfExamSelected;
        englishTestDetailsViewModel.tentativeExamDate =
            tentativeExamDateSelcted;
        englishTestDetailsViewModel.expirationDate =
            testscoreExpirationDateSelcted;
        englishTestDetailsViewModel.resultDate = dateOfTestReportSelcted;
        englishTestDetailsViewModel.enqId =
            Get.find<BaseController>().model1.id.toString();
        englishTestDetailsViewModel.examStatusID =
            examStatusCodeSelected.toString();
        englishTestDetailsViewModel.examName = examNameSelected;
        englishTestDetailsViewModel.reading = reading.text;
        englishTestDetailsViewModel.writing = writing.text;
        englishTestDetailsViewModel.listening = listening.text;
        englishTestDetailsViewModel.speaking = speaking.text;
        englishTestDetailsViewModel.literacy = listening.text;
        englishTestDetailsViewModel.comprehension = writing.text;
        englishTestDetailsViewModel.conversation = reading.text;
        englishTestDetailsViewModel.production = writing.text;
        if (getNUllChecker(tentativeExamDate.text)) {
          englishTestDetailsViewModel.overAll = overallScoreController.text;
        } else {
          englishTestDetailsViewModel.overAll =
              englishTestDetailsViewModel.overAll;
        }
        await updateEnglishTestDetaisl(
            Get.find<BaseController>().model1.id.toString(),
            englishTestDetailsViewModel);
        editSave.value = true;
        update();
      }
    }
  }

  // updateEnglishTestDetails(EnglishTestDetailsViewModel model) {
  //   updateEnglishTestDetaisl(
  //       Get.find<BaseController>().model1.id.toString(), model);
  // }
}
