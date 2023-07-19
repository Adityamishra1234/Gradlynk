import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:studentpanel/ui/screen/Profile_Module/controller/englishtest.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_timer_widget.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class EnglishTestDetails extends StatelessWidget {
  EnglishTestDetails({Key? key, this.editButton}) : super(key: key);

  bool? editButton = false;
  var controller = Get.put(EnglishTestController());

  @override
  Widget build(BuildContext context) {
    if (editButton == true) {
      controller.editSave.value = false;
      controller.update();
    }
    return controller.obx((state) {
      // if (controller.loadingFirstTime.value == false) {
      //   if (controller.loadingExamName2.value == true &&
      //       controller.loadingExamStaus.value == true &&
      //       controller.loadingViewEnglishTestDetails.value == true) {
      //     viewCondition();
      //   }
      // }

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
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.dateOfExamSelected = date[0] + "-" + date[1] + '-' + date[2];

    controller.dateOfExamSelected = data;
    controller.update();
  }

  callbackTentativeExamDate(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.tentativeExamDateSelcted =
    //     date[0] + "-" + date[1] + '-' + date[2];
    controller.tentativeExamDateSelcted = data;

    controller.update();
  }

  callbackDateOfTestReport(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    controller.dateOfTestReportSelcted = data;
    controller.update();
  }

  callbackTextScoreExpirationdate(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    controller.testscoreExpirationDateSelcted = data;
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
      Container(
        height: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomTimerWidget(
            isBlank: true,
            // enableField: false,

            initialTime: controller.dateOfExamSelected,
            callback: (value) {
              callbackDateOfExam(value);
            },
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //     enableField: controller.editSave.value == true ? true : false,
      //     date: getNUllChecker(
      //                 controller.englishTestDetailsViewModel.dateOfExam) ==
      //             false
      //         ? controller.dateOfExamSelected
      //         : "",
      //     callbackDate: callbackDateOfExam,
      //   ),
      // )
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
      Container(
        height: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomTimerWidget(
            isBlank: true,
            // enableField: false,

            initialTime: controller.tentativeExamDateSelcted,
            callback: (value) {
              callbackTentativeExamDate(value);
            },
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //     enableField: controller.editSave.value == true ? true : false,
      //     date: getNUllChecker(controller.tentativeExamDateSelcted) == false
      //         ? controller.tentativeExamDateSelcted
      //         : null,
      //     callbackDate: callbackTentativeExamDate,
      //   ),
      // ),
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
      Container(
        height: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomTimerWidget(
            isBlank: true,
            // enableField: false,

            initialTime: controller.dateOfExamSelected,
            callback: (value) {
              callbackDateOfExam(value);
            },
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //     enableField: controller.editSave.value == true ? true : false,
      //     date: getNUllChecker(
      //                 controller.englishTestDetailsViewModel.dateOfExam) ==
      //             false
      //         ? controller.dateOfExamSelected
      //         : "",
      //     callbackDate: callbackDateOfExam,
      //   ),
      // ),
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
      Container(
        height: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomTimerWidget(
            isBlank: true,
            // enableField: false,

            initialTime: controller.dateOfTestReportSelcted,
            callback: (value) {
              callbackDateOfTestReport(value);
            },
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //     enableField: controller.editSave.value == true ? true : false,
      //     callbackDate: callbackDateOfTestReport,
      //     date: controller.dateOfTestReportSelcted,
      //   ),
      // ),
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
      Container(
        height: 45,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomTimerWidget(
            isBlank: true,
            // enableField: false,

            initialTime: controller.testscoreExpirationDateSelcted,
            callback: (value) {
              callbackTextScoreExpirationdate(value);
            },
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //     enableField: controller.editSave.value == true ? true : false,
      //     callbackDate: callbackTextScoreExpirationdate,
      //     date: controller.testscoreExpirationDateSelcted,
      //   ),
      // ),
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
          controller: EnglishTestController.overallScoreController,
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
          controller: EnglishTestController.listening,
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
          controller: EnglishTestController.writing,
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
          controller: EnglishTestController.reading,
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
          onSaved: (value) {
            controller.update();
          },
          keyboardType: TextInputType.number,
          readOnly: controller.editSave.value == true ? true : false,
          controller: EnglishTestController.speaking,
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
          controller: EnglishTestController.listening,
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

          controller: EnglishTestController.writing,
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

          controller: EnglishTestController.reading,
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

          controller: EnglishTestController.speaking,
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
        if (EnglishTestController.listening.text.isNotEmpty &&
            EnglishTestController.writing.text.isNotEmpty &&
            EnglishTestController.reading.text.isNotEmpty &&
            EnglishTestController.speaking.text.isNotEmpty) {
          temp = double.parse(EnglishTestController.listening.text) +
              double.parse(EnglishTestController.writing.text) +
              double.parse(EnglishTestController.reading.text) +
              double.parse(EnglishTestController.speaking.text);
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
              controller: EnglishTestController.overallScoreController,
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
        if (EnglishTestController.listening.text.isNotEmpty &&
            EnglishTestController.writing.text.isNotEmpty &&
            EnglishTestController.reading.text.isNotEmpty &&
            EnglishTestController.speaking.text.isNotEmpty) {
          temp = double.parse(EnglishTestController.listening.text) +
              double.parse(EnglishTestController.writing.text) +
              double.parse(EnglishTestController.reading.text) +
              double.parse(EnglishTestController.speaking.text);
          temp = (temp / 4);
          EnglishTestController.overallScoreController.text =
              temp.toStringAsFixed(2);
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
              controller: EnglishTestController.overallScoreController,
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
}
