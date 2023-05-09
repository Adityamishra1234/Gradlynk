import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/englishtest.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class EnglishTestDetails extends StatelessWidget {
  EnglishTestDetails({Key? key}) : super(key: key);
  var controller = Get.put(EnglishTestController());
  static final listening = TextEditingController();
  static final writing = TextEditingController();
  static final reading = TextEditingController();
  static final speaking = TextEditingController();
  static final overallScoreController = TextEditingController();
  static final dateOfExam = TextEditingController();
  static final dateOfTestReport = TextEditingController();
  static final testScoreExpirationDate = TextEditingController();
  static final tentativeExamDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      if (controller.loadingFirstTime.value == false) {
        if (controller.loadingExamName2.value == true &&
            controller.loadingExamStaus.value == true &&
            controller.loadingViewEnglishTestDetails.value == true) {
          viewCondition();
        }
      }

      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Row(
                  children: [
                    CustomAutoSizeTextMontserrat(
                      text: "Exam Status",
                      mandatory: true,
                      textColor: ThemeConstants.TextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    if (controller.editSave.value == true)
                      TextButton(
                          onPressed: () {
                            controller.editSave.value = false;
                            controller.update();
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "edit",
                            textColor: ThemeConstants.bluecolor,
                          )),
                    if (controller.editSave.value == false)
                      TextButton(
                          onPressed: () {
                            if (controller.examStatusSelected ==
                                "Not Yet Registered") {
                              if (controller.bookTestSelcted == null) {
                                getToast(
                                    SnackBarConstants.bookTestSelectedError!);
                              }
                            }
                            if (controller.examStatusSelected == null) {
                              getToast(SnackBarConstants.examStatusError!);
                            } else {
                              if (controller.examNameSelected == null) {
                                getToast(SnackBarConstants.examnameError!);
                              } else {
                                EnglishTestDetailsViewModel
                                    englishTestDetailsViewModel =
                                    EnglishTestDetailsViewModel();
                                englishTestDetailsViewModel =
                                    controller.englishTestDetailsViewModel;
                                englishTestDetailsViewModel.dateOfExam =
                                    controller.dateOfExamSelected;
                                englishTestDetailsViewModel.tentativeExamDate =
                                    controller.tentativeExamDateSelcted;
                                englishTestDetailsViewModel.expirationDate =
                                    controller.testscoreExpirationDateSelcted;
                                englishTestDetailsViewModel.resultDate =
                                    controller.dateOfTestReportSelcted;
                                englishTestDetailsViewModel.enqId =
                                    Get.find<BaseController>()
                                        .model1
                                        .id
                                        .toString();
                                englishTestDetailsViewModel.examStatusID =
                                    controller.examStatusCodeSelected
                                        .toString();
                                englishTestDetailsViewModel.examName =
                                    controller.examNameSelected;
                                englishTestDetailsViewModel.reading =
                                    reading.text;
                                englishTestDetailsViewModel.writing =
                                    writing.text;
                                englishTestDetailsViewModel.listening =
                                    listening.text;
                                englishTestDetailsViewModel.speaking =
                                    speaking.text;
                                englishTestDetailsViewModel.literacy =
                                    listening.text;
                                englishTestDetailsViewModel.comprehension =
                                    writing.text;
                                englishTestDetailsViewModel.conversation =
                                    reading.text;
                                englishTestDetailsViewModel.production =
                                    writing.text;
                                if (getNUllChecker(tentativeExamDate.text)) {
                                  englishTestDetailsViewModel.overAll =
                                      overallScoreController.text;
                                } else {
                                  englishTestDetailsViewModel.overAll =
                                      controller
                                          .englishTestDetailsViewModel.overAll;
                                }
                                updateEnglishTestDetails(
                                    englishTestDetailsViewModel);
                                controller.editSave.value = true;
                                controller.update();
                              }
                            }
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "save",
                            textColor: ThemeConstants.bluecolor,
                          )),
                  ],
                ),
              ),
            ),
            CustomDropDownSingle(
              model: controller.loadingExamStaus.value == true
                  ? controller.examStatusList
                  : ["No Data"],
              initialSelectedValue: controller.loadingExamStaus.value == true
                  ? getNUllChecker(controller.examStatusSelected) == true
                      ? controller.examStatusList[0]
                      : controller.examStatusSelected.toString()
                  : "No Data",
              choosefieldtype: controller.editSave.value == true ? true : false,
              callbackFunction: callbackExamStatus,
            ),
            if (getNUllChecker(controller.examStatusSelected) == false)
              if (controller.examStatusCodeSelected == 1)
                ...registered(context),
            if (controller.examStatusCodeSelected == 2)
              ...notYetRegistered(context, controller.editSave.value),
            if (controller.examStatusCodeSelected == 3)
              ...testAllReadyTaken(context),
            if (controller.examStatusCodeSelected == 3 &&
                controller.tentative.value == true)
              ...tentative(context),
            if (controller.examStatusCodeSelected == 3 &&
                controller.tentative.value == false &&
                controller.duolingo.value == false)
              ...definite(context),
            if (controller.examStatusCodeSelected == 3 &&
                controller.tentative.value == false &&
                controller.duolingo.value == true)
              ...duolingo(context),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: SizedBox(
                  width: 90,
                  child: controller.editSave.value == false
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: ThemeConstants.bluecolor,
                            elevation: 0.0,
                            backgroundColor:
                                ThemeConstants.bluecolor, // foreground
                          ),
                          onPressed: () async {
                            if (controller.examStatusSelected == null) {
                              getToast(SnackBarConstants.examStatusError!);
                            } else if (controller.examStatusSelected ==
                                "Not Yet Registered") {
                              if (controller.bookTestSelcted == null) {
                                getToast(
                                    SnackBarConstants.bookTestSelectedError!);
                              } else {
                                EnglishTestDetailsViewModel
                                    englishTestDetailsViewModel =
                                    EnglishTestDetailsViewModel();
                                englishTestDetailsViewModel =
                                    controller.englishTestDetailsViewModel;
                                englishTestDetailsViewModel.dateOfExam =
                                    controller.dateOfExamSelected;
                                englishTestDetailsViewModel.tentativeExamDate =
                                    controller.tentativeExamDateSelcted;
                                englishTestDetailsViewModel.expirationDate =
                                    controller.testscoreExpirationDateSelcted;
                                englishTestDetailsViewModel.resultDate =
                                    controller.dateOfTestReportSelcted;
                                englishTestDetailsViewModel.enqId =
                                    Get.find<BaseController>()
                                        .model1
                                        .id
                                        .toString();
                                englishTestDetailsViewModel.examStatusID =
                                    controller.examStatusCodeSelected
                                        .toString();
                                englishTestDetailsViewModel.examName =
                                    controller.examNameSelected;
                                englishTestDetailsViewModel.reading =
                                    reading.text;
                                englishTestDetailsViewModel.writing =
                                    writing.text;
                                englishTestDetailsViewModel.listening =
                                    listening.text;
                                englishTestDetailsViewModel.speaking =
                                    speaking.text;
                                englishTestDetailsViewModel.literacy =
                                    listening.text;
                                englishTestDetailsViewModel.comprehension =
                                    writing.text;
                                englishTestDetailsViewModel.conversation =
                                    reading.text;
                                englishTestDetailsViewModel.production =
                                    writing.text;

                                if (getNUllChecker(tentativeExamDate.text)) {
                                  englishTestDetailsViewModel.overAll =
                                      overallScoreController.text;
                                } else {
                                  englishTestDetailsViewModel.overAll =
                                      controller
                                          .englishTestDetailsViewModel.overAll;
                                }
                                updateEnglishTestDetails(
                                    englishTestDetailsViewModel);
                                controller.editSave.value = true;
                                controller.update();
                              }
                            } else {
                              if (controller.examNameSelected == null) {
                                getToast(SnackBarConstants.examnameError!);
                              } else {
                                EnglishTestDetailsViewModel
                                    englishTestDetailsViewModel =
                                    EnglishTestDetailsViewModel();
                                englishTestDetailsViewModel =
                                    controller.englishTestDetailsViewModel;
                                englishTestDetailsViewModel.dateOfExam =
                                    controller.dateOfExamSelected;
                                englishTestDetailsViewModel.tentativeExamDate =
                                    controller.tentativeExamDateSelcted;
                                englishTestDetailsViewModel.expirationDate =
                                    controller.testscoreExpirationDateSelcted;
                                englishTestDetailsViewModel.resultDate =
                                    controller.dateOfTestReportSelcted;
                                englishTestDetailsViewModel.enqId =
                                    Get.find<BaseController>()
                                        .model1
                                        .id
                                        .toString();
                                englishTestDetailsViewModel.examStatusID =
                                    controller.examStatusCodeSelected
                                        .toString();
                                englishTestDetailsViewModel.examName =
                                    controller.examNameSelected;
                                englishTestDetailsViewModel.reading =
                                    reading.text;
                                englishTestDetailsViewModel.writing =
                                    writing.text;
                                englishTestDetailsViewModel.listening =
                                    listening.text;
                                englishTestDetailsViewModel.speaking =
                                    speaking.text;
                                englishTestDetailsViewModel.literacy =
                                    listening.text;
                                englishTestDetailsViewModel.comprehension =
                                    writing.text;
                                englishTestDetailsViewModel.conversation =
                                    reading.text;
                                englishTestDetailsViewModel.production =
                                    writing.text;
                                if (getNUllChecker(tentativeExamDate.text)) {
                                  englishTestDetailsViewModel.overAll =
                                      overallScoreController.text;
                                } else {
                                  englishTestDetailsViewModel.overAll =
                                      controller
                                          .englishTestDetailsViewModel.overAll;
                                }
                                updateEnglishTestDetails(
                                    englishTestDetailsViewModel);
                                controller.editSave.value = true;
                                controller.update();
                              }
                            }
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "Save",
                            textColor: ThemeConstants.whitecolor,
                          ))
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: ThemeConstants.bluecolor,
                            elevation: 0.0,
                            backgroundColor:
                                ThemeConstants.bluecolor, // foreground
                          ),
                          onPressed: () async {
                            controller.editSave.value = false;
                            controller.update();
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "Edit",
                            textColor: ThemeConstants.whitecolor,
                          )),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      );
    }, onLoading: getLoading(context));
  }

// CallBack Funcation
  callbackDateOfExam(data) {
    String temp = data.toString().split(' ')[0];
    List<String> date = temp.split('-');
    controller.dateOfExamSelected = date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
  }

  callbackTentativeExamDate(data) {
    String temp = data.toString().split(' ')[0];
    List<String> date = temp.split('-');
    controller.tentativeExamDateSelcted =
        date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
  }

  callbackDateOfTestReport(data) {
    String temp = data.toString().split(' ')[0];
    List<String> date = temp.split('-');
    controller.dateOfTestReportSelcted =
        date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
  }

  callbackTextScoreExpirationdate(data) {
    String temp = data.toString().split(' ')[0];
    List<String> date = temp.split('-');
    controller.testscoreExpirationDateSelcted =
        date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
  }

  callback(varTopic) {
    controller.bookTestSelcted = varTopic;
    controller.update();
  }

  callbackExamStatus(varTopic) {
    for (var i = 0; i < controller.examStatusList.length; i++) {
      if (controller.examStatusList[i] == varTopic) {
        controller.examStatusSelected = controller.examStatusList[i];
        controller.examStatusCodeSelected =
            int.parse(controller.examStatusCode[i]);
      }
    }
    controller.update();
  }

  callbackExamName(varTopic) {
    controller.examNameSelected = varTopic;
    if (varTopic == controller.examNameList[3]) {
      controller.duolingo.value = true;
      controller.update();
    } else {
      controller.duolingo.value = false;
      controller.update();
    }
  }

  callbackTentativeDefinite(varTopic) {
    if (varTopic.toString() == "Tentative") {
      controller.tentative.value = true;

      controller.update();
    } else {
      controller.tentative.value = false;
      controller.update();
    }
  }

// Widget Funcation
  List<Widget> registered(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Row(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "Exam Name",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
      GetBuilder<EnglishTestController>(builder: (controller) {
        return CustomDropDownSingle(
          model: controller.loadingExamName2.value == true
              ? controller.examNameList
              : ["No Data"],
          initialSelectedValue: controller.loadingExamName2.value == true
              ? getNUllChecker(controller.examNameSelected) == true
                  ? controller.examNameList[0]
                  : controller.examNameSelected.toString()
              : "No Data",
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callbackExamName,
        );
      }),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Date of Exam",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DatePickerExample(
          enableField: controller.editSave.value == true ? true : false,
          date: getNUllChecker(
                      controller.englishTestDetailsViewModel.dateOfExam) ==
                  false
              ? controller.dateOfExamSelected
              : "",
          callbackDate: callbackDateOfExam,
        ),
      )
    ];
  }

  List<Widget> notYetRegistered(BuildContext context, bool editsave) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Do you want to book test?",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      CustomDropDownSingle(
        model: const ["Yes", "No"],
        initialSelectedValue: controller.bookTestSelcted ?? "No",
        choosefieldtype: editsave,
        callbackFunction: callback,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Specify Exam Name",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      CustomDropDownSingle(
        model: controller.loadingExamName2.value == true
            ? controller.examNameList
            : ["No data"],
        initialSelectedValue: controller.loadingExamName2.value == true
            ? controller.examNameSelected
            : "No data",
        choosefieldtype: editsave,
        callbackFunction: callbackExamName,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Tentative Exam Date",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DatePickerExample(
          enableField: controller.editSave.value == true ? true : false,
          date: getNUllChecker(controller.tentativeExamDateSelcted) == false
              ? controller.tentativeExamDateSelcted
              : null,
          callbackDate: callbackTentativeExamDate,
        ),
      ),
    ];
  }

  List<Widget> testAllReadyTaken(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Exam Name",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      CustomDropDownSingle(
        model: controller.loadingExamName2.value == true
            ? controller.examNameList
            : ["No Data"],
        initialSelectedValue: controller.loadingExamName2.value == true
            ? getNUllChecker(controller.examNameSelected) == true
                ? controller.examNameList[0]
                : controller.examNameSelected.toString()
            : "No Data",
        choosefieldtype: controller.editSave.value == true ? true : false,
        callbackFunction: callbackExamName,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Date of Exam",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DatePickerExample(
          enableField: controller.editSave.value == true ? true : false,
          date: getNUllChecker(
                      controller.englishTestDetailsViewModel.dateOfExam) ==
                  false
              ? controller.dateOfExamSelected
              : "",
          callbackDate: callbackDateOfExam,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Date of Test Report",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DatePickerExample(
          enableField: controller.editSave.value == true ? true : false,
          callbackDate: callbackDateOfTestReport,
          date: controller.dateOfTestReportSelcted,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Test Score Expiration Date",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DatePickerExample(
          enableField: controller.editSave.value == true ? true : false,
          callbackDate: callbackTextScoreExpirationdate,
          date: controller.testscoreExpirationDateSelcted,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Exam Score Status",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      CustomDropDownSingle(
        model: const ["Tentative", "Definite"],
        initialSelectedValue:
            controller.tentative.value == true ? "Tentative" : "Definite",
        choosefieldtype: controller.editSave.value == true ? true : false,
        callbackFunction: callbackTentativeDefinite,
      ),
    ];
  }

  List<Widget> tentative(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Overall Score",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          readOnly: controller.editSave.value == true ? true : false,
          controller: overallScoreController,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: getNUllChecker(
                        controller.englishTestDetailsViewModel.overAll) ==
                    false
                ? controller.englishTestDetailsViewModel.overAll
                : "Overall Score",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
        ),
      ),
    ];
  }

  List<Widget> definite(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Listening",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: listening,
          // onChanged: (value) {
          //   if (Get.find<EnglishTestController>()
          //       .listeningKey
          //       .currentState!
          //       .validate()) {
          //     Get.find<EnglishTestController>()
          //         .listeningKey
          //         .currentState!
          //         .save();
          //   }
          // },
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (controller.examNameSelected == "PTE") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 90) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants.PTEValidation2;
                  }
                } else {
                  return SnackBarConstants.PTEValidation1;
                }
              } else if (controller.examNameSelected == "IELTS") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 9) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.IELTSValidation2;
                  }
                } else {
                  return SnackBarConstants.IELTSValidation1;
                }
              } else if (controller.examNameSelected == "Cambridge") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 230) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.CambridgeValidation2;
                  }
                } else {
                  return SnackBarConstants.CambridgeSValidation1;
                }
              } else if (controller.examNameSelected == "TOEFL") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 30) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.ToeflSValidation2;
                  }
                } else {
                  return SnackBarConstants.ToeflSValidation1;
                }
              }
            }
            return null;
          },
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
          decoration: InputDecoration(
            hintText: getNUllChecker(
                        controller.englishTestDetailsViewModel.listening) ==
                    true
                ? "Listening"
                : controller.englishTestDetailsViewModel.listening.toString(),
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          keyboardType: TextInputType.number,
          readOnly: controller.editSave.value == true ? true : false,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Writing",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          keyboardType: TextInputType.number,
          readOnly: controller.editSave.value == true ? true : false,
          controller: writing,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
          decoration: InputDecoration(
            hintText: "Writing",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          // onChanged: (value) {
          //   if (Get.find<EnglishTestController>()
          //       .writingKey
          //       .currentState!
          //       .validate()) {
          //     Get.find<EnglishTestController>()
          //         .writingKey
          //         .currentState!
          //         .save();
          //   }
          // },
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (controller.examNameSelected == "PTE") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 90) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants.PTEValidation2;
                  }
                } else {
                  return SnackBarConstants.PTEValidation1;
                }
              } else if (controller.examNameSelected == "IELTS") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 9) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.IELTSValidation2;
                  }
                } else {
                  return SnackBarConstants.IELTSValidation1;
                }
              } else if (controller.examNameSelected == "Cambridge") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 230) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.CambridgeValidation2;
                  }
                } else {
                  return SnackBarConstants.CambridgeSValidation1;
                }
              } else if (controller.examNameSelected == "TOEFL") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 30) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.ToeflSValidation2;
                  }
                } else {
                  return SnackBarConstants.ToeflSValidation1;
                }
              }
            }
            return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Reading",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          keyboardType: TextInputType.number,
          readOnly: controller.editSave.value == true ? true : false,
          controller: reading,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
          decoration: InputDecoration(
            hintText: "Reading",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          // onChanged: (value) {
          //   if (Get.find<EnglishTestController>()
          //       .readingKey
          //       .currentState!
          //       .validate()) {
          //     Get.find<EnglishTestController>()
          //         .readingKey
          //         .currentState!
          //         .save();
          //   }
          // },
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (controller.examNameSelected == "PTE") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 90) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants.PTEValidation2;
                  }
                } else {
                  return SnackBarConstants.PTEValidation1;
                }
              } else if (controller.examNameSelected == "IELTS") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 9) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.IELTSValidation2;
                  }
                } else {
                  return SnackBarConstants.IELTSValidation1;
                }
              } else if (controller.examNameSelected == "Cambridge") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 230) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.CambridgeValidation2;
                  }
                } else {
                  return SnackBarConstants.CambridgeSValidation1;
                }
              } else if (controller.examNameSelected == "TOEFL") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 30) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.ToeflSValidation2;
                  }
                } else {
                  return SnackBarConstants.ToeflSValidation1;
                }
              }
            }
            return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Speaking",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          keyboardType: TextInputType.number,
          readOnly: controller.editSave.value == true ? true : false,
          controller: speaking,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
          decoration: InputDecoration(
            hintText: "Speaking",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          // onChanged: (value) {
          //   if (Get.find<EnglishTestController>()
          //       .speakingKey
          //       .currentState!
          //       .validate()) {
          //     Get.find<EnglishTestController>()
          //         .speakingKey
          //         .currentState!
          //         .save();
          //   }
          // },
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (controller.examNameSelected == "PTE") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 90) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants.PTEValidation2;
                  }
                } else {
                  return SnackBarConstants.PTEValidation1;
                }
              } else if (controller.examNameSelected == "IELTS") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 9) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.IELTSValidation2;
                  }
                } else {
                  return SnackBarConstants.IELTSValidation1;
                }
              } else if (controller.examNameSelected == "Cambridge") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 230) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.CambridgeValidation2;
                  }
                } else {
                  return SnackBarConstants.CambridgeSValidation1;
                }
              } else if (controller.examNameSelected == "TOEFL") {
                if (double.parse(value!) >= 0 && double.parse(value) <= 30) {
                  if (double.parse(value) % 0.5 != 0) {
                    return SnackBarConstants.ToeflSValidation2;
                  }
                } else {
                  return SnackBarConstants.ToeflSValidation1;
                }
              }
            }
            return null;
          },
        ),
      ),
      ...overallScore(context),
    ];
  }

  List<Widget> duolingo(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Literacy",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: listening,
          keyboardType: TextInputType.number,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
          decoration: InputDecoration(
            hintText: "Literacy",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (double.parse(value!) >= 0 && double.parse(value) <= 160) {
                if (double.parse(value) % 5 != 0) {
                  return SnackBarConstants.DuolingoSValidation2;
                }
              } else {
                return SnackBarConstants.DuolingoSValidation1;
              }
            }
            return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Comprehension",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          controller: writing,
          keyboardType: TextInputType.number,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
          decoration: InputDecoration(
            hintText: "Comprehension",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          // onChanged: (value) {
          //   if (Get.find<EnglishTestController>()
          //       .comprehensionKey
          //       .currentState!
          //       .validate()) {
          //     Get.find<EnglishTestController>()
          //         .comprehensionKey
          //         .currentState!
          //         .save();
          //   }
          // },
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (double.parse(value!) >= 0 && double.parse(value) <= 160) {
                if (double.parse(value) % 5 != 0) {
                  return SnackBarConstants.DuolingoSValidation2;
                }
              } else {
                return SnackBarConstants.DuolingoSValidation1;
              }
            }
            return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Conversation",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          controller: reading,
          keyboardType: TextInputType.number,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
          decoration: InputDecoration(
            hintText: "Conversation",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (double.parse(value!) >= 0 && double.parse(value) <= 160) {
                if (double.parse(value) % 5 != 0) {
                  return SnackBarConstants.DuolingoSValidation2;
                }
              } else {
                return SnackBarConstants.DuolingoSValidation1;
              }
            }
            return null;
          },
          // onChanged: (value) {
          //   if (Get.find<EnglishTestController>()
          //       .conversationKey
          //       .currentState!
          //       .validate()) {
          //     Get.find<EnglishTestController>()
          //         .comprehensionKey
          //         .currentState!
          //         .save();
          //   }
          // },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Production",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          controller: speaking,
          keyboardType: TextInputType.number,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
          decoration: InputDecoration(
            hintText: "Production",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (double.parse(value!) >= 0 && double.parse(value) <= 160) {
                if (double.parse(value) % 5 != 0) {
                  return SnackBarConstants.DuolingoSValidation2;
                }
              } else {
                return SnackBarConstants.DuolingoSValidation1;
              }
            }
            return null;
          },
          // onChanged: (value) {
          //   if (Get.find<EnglishTestController>()
          //       .productionkey
          //       .currentState!
          //       .validate()) {
          //     Get.find<EnglishTestController>()
          //         .productionkey
          //         .currentState!
          //         .save();
          //   }
          // },
        ),
      ),
      ...overallScore(context),
    ];
  }

  getOverallScore() {
    if (controller.examNameSelected == "TOEFL") {
      // sum
    } else {
      //average
    }
  }

  List<Widget> overallScore(BuildContext context) {
    try {
      double temp = 0;
      if (controller.examNameSelected == "TOEFL") {
        if (listening.text.isNotEmpty &&
            writing.text.isNotEmpty &&
            reading.text.isNotEmpty &&
            speaking.text.isNotEmpty) {
          temp = double.parse(listening.text) +
              double.parse(writing.text) +
              double.parse(reading.text) +
              double.parse(speaking.text);
          temp = (temp);
        }
        return [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Overall Score",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //toStringAsFixed(2)
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: overallScoreController,
              readOnly: true,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: temp != 0 ? temp.toStringAsFixed(2) : "",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
            ),
          ),
        ];
      } else {
        if (listening.text.isNotEmpty &&
            writing.text.isNotEmpty &&
            reading.text.isNotEmpty &&
            speaking.text.isNotEmpty) {
          temp = double.parse(listening.text) +
              double.parse(writing.text) +
              double.parse(reading.text) +
              double.parse(speaking.text);
          temp = (temp / 4);
          overallScoreController.text = temp.toStringAsFixed(2);
        }

        return [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Overall Score",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: overallScoreController,
              readOnly: true,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: temp != 0 ? temp.toStringAsFixed(2) : "",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
            ),
          ),
        ];
      }
    } catch (e) {
      print(e.toString());
      return [Container()];
    }
  }

  viewCondition() {
    try {
      //exam status
      controller.dateOfExamSelected =
          controller.englishTestDetailsViewModel.dateOfExam;
      controller.dateOfTestReportSelcted =
          controller.englishTestDetailsViewModel.resultDate;
      controller.testscoreExpirationDateSelcted =
          controller.englishTestDetailsViewModel.expirationDate;
      controller.tentativeExamDateSelcted =
          controller.englishTestDetailsViewModel.tentativeExamDate;
      overallScoreController.text =
          getNUllChecker(controller.englishTestDetailsViewModel.overAll) ==
                  false
              ? controller.englishTestDetailsViewModel.overAll.toString()
              : "";
      for (var i = 0; i < controller.examStatusCode.length; i++) {
        if (controller.examStatusCode[i].toString() ==
            controller.englishTestDetailsViewModel.examStatusID) {
          controller.examStatusCodeSelected =
              int.parse(controller.examStatusCode[i]);
          controller.examStatusSelected = controller.examStatusList[i];
        }
      }

      //Exam Name
      if (controller.englishTestDetailsViewModel.examName == "Duolingo") {
        controller.duolingo.value = true;
      } else {
        controller.examNameSelected =
            controller.englishTestDetailsViewModel.examName;
        controller.duolingo.value = false;
      }
      //tentative / Definite
      if (getNUllChecker(controller.englishTestDetailsViewModel.listening) ||
          getNUllChecker(controller.englishTestDetailsViewModel.writing) ||
          getNUllChecker(controller.englishTestDetailsViewModel.literacy) ||
          getNUllChecker(
              controller.englishTestDetailsViewModel.analyticalWriting)) {
        controller.tentative.value = true;
      }
      controller.loadingFirstTime.value = true;
      controller.update();
    } catch (e) {
      print(e.toString());
    }
  }

  updateEnglishTestDetails(
      EnglishTestDetailsViewModel englishTestDetailsViewModel) {
    controller.updateEnglishTestDetaisl(
        Get.find<BaseController>().model1.id.toString(),
        englishTestDetailsViewModel);
  }
}
