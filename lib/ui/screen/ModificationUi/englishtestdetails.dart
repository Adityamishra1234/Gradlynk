import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/englishtest.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class EnglishTestDetails extends StatelessWidget {
  EnglishTestDetails({Key? key}) : super(key: key);
  var controller = Get.put(EnglishTestController());
  final listening = TextEditingController();
  final writing = TextEditingController();
  final reading = TextEditingController();
  final speaking = TextEditingController();
  final overallScoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnglishTestController>(builder: (_) {
      if (controller.loadingExamName.value = true &&
          controller.loadingExamStaus.value == true &&
          controller.loadingViewEnglishTestDetails.value == true) {
        viewCondition();
      }
      return Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Row(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Exam Status",
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        Spacer(),
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
                                controller.editSave.value = true;
                                controller.update();
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "save",
                                textColor: ThemeConstants.bluecolor,
                              )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: CustomDropDownSingle(
                    model: _.loadingExamStaus.value == true
                        ? _.examStatusList
                        : ["No Data"],
                    initialSelectedValue: _.loadingExamStaus.value == true
                        ? _.examStatusList[0]
                        : "No Data",
                    choosefieldtype:
                        controller.editSave.value == true ? true : false,
                    callbackFunction: callbackExamStatus,
                  ),
                ),
                if (_.examStatusCodeSelected == 1) ...registered(),
                if (_.examStatusCodeSelected == 2) ...notYetRegistered(),
                if (_.examStatusCodeSelected == 3) ...testAllReadyTaken(),
                if (_.examStatusCodeSelected == 3 && _.tentative.value == true)
                  ...tentative(),
                if (_.examStatusCodeSelected == 3 &&
                    _.tentative.value == false &&
                    _.duolingo.value == false)
                  ...definite(),
                if (_.examStatusCodeSelected == 3 &&
                    _.tentative.value == false &&
                    _.duolingo.value == true)
                  ...duolingo(),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: SizedBox(
                      width: 90,
                      child: controller.editSave.value == false
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                primary: ThemeConstants.bluecolor, // background
                                onPrimary:
                                    ThemeConstants.bluecolor, // foreground
                              ),
                              onPressed: () async {
                                controller.editSave.value = true;
                                controller.update();
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "Save",
                                textColor: ThemeConstants.whitecolor,
                              ))
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                primary: ThemeConstants.bluecolor, // background
                                onPrimary:
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
              ],
            ),
          ),
        ],
      );
    });
  }

// CallBack Funcation
  callback(varTopic) {}
  callbackExamStatus(varTopic) {
    print(varTopic);
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
  List<Widget> registered() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Exam Name",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: controller.loadingExamName.value == true
              ? controller.examNameList
              : ["No Data"],
          initialSelectedValue: controller.loadingExamName.value == true
              ? controller.examNameList[0]
              : "No Data",
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callbackExamName,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Date Of Exam",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: ["Date", "No"],
          initialSelectedValue: "Date",
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callback,
        ),
      ),
    ];
  }

  List<Widget> notYetRegistered() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Do you want to book test?",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: ["Yes", "No"],
          initialSelectedValue: "No",
          choosefieldtype: false,
          callbackFunction: callback,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Specify Exam Name",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: ["Yes", "No"],
          initialSelectedValue: "No",
          choosefieldtype: false,
          callbackFunction: callback,
        ),
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
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Date",
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

  List<Widget> testAllReadyTaken() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Exam Name",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: controller.loadingExamName.value == true
              ? controller.examNameList
              : ["No Data"],
          initialSelectedValue: controller.loadingExamName.value == true
              ? controller.examNameList[0]
              : "No Data",
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callbackExamName,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Date Of Exam",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: ["Date", "No"],
          initialSelectedValue: "Date",
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callback,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Date Of Test Report",
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
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Enter Contact Of Relative",
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
        child: TextField(
          readOnly: controller.editSave.value == true ? true : false,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Enter Contact Of Relative",
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
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: ["Tentative", "Definite"],
          initialSelectedValue: "Tentative",
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callbackTentativeDefinite,
        ),
      ),
    ];
  }

  List<Widget> tentative() {
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
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Overall Score",
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

  List<Widget> definite() {
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
        child: TextField(
          controller: listening,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            controller.chooseField.value = 1;
            getValidation(value);
            controller.update();
          },
          decoration: InputDecoration(
            hintText: "Listening",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          readOnly: controller.editSave.value == true ? true : false,
        ),
      ),
      if (controller.chooseField.value == 1) getValidationError(),
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
        child: TextField(
          readOnly: controller.editSave.value == true ? true : false,
          controller: writing,
          textInputAction: TextInputAction.next,
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
          onChanged: (value) {
            controller.chooseField.value = 2;
            getValidation(value);
            controller.update();
          },
        ),
      ),
      if (controller.chooseField.value == 2) getValidationError(),
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
        child: TextField(
          readOnly: controller.editSave.value == true ? true : false,
          controller: reading,
          textInputAction: TextInputAction.next,
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
          onChanged: (value) {
            controller.chooseField.value = 3;
            getValidation(value);
            controller.update();
          },
        ),
      ),
      if (controller.chooseField.value == 3) getValidationError(),
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
        child: TextField(
          readOnly: controller.editSave.value == true ? true : false,
          controller: speaking,
          textInputAction: TextInputAction.next,
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
          onChanged: (value) {
            controller.chooseField.value = 4;
            getValidation(value);
            controller.update();
          },
        ),
      ),
      if (controller.chooseField.value == 4) getValidationError(),
      ...overallScore(),
    ];
  }

  List<Widget> duolingo() {
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
        child: TextField(
          controller: listening,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Listening",
            filled: true,
            fillColor: ThemeConstants.lightblueColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: ThemeConstants.montserrattextstyle,
          onChanged: (value) {
            controller.chooseField.value = 1;
            getValidation(value);
            controller.update();
          },
        ),
      ),
      if (controller.chooseField.value == 1) getValidationError(),
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
        child: TextField(
          controller: writing,
          textInputAction: TextInputAction.next,
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
          onChanged: (value) {
            controller.chooseField.value = 2;
            getValidation(value);
            controller.update();
          },
        ),
      ),
      if (controller.chooseField.value == 2) getValidationError(),
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
        child: TextField(
          controller: reading,
          textInputAction: TextInputAction.next,
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
          onChanged: (value) {
            controller.chooseField.value = 3;
            getValidation(value);
            controller.update();
          },
        ),
      ),
      if (controller.chooseField.value == 3) getValidationError(),
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
        child: TextField(
          controller: speaking,
          textInputAction: TextInputAction.next,
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
          onChanged: (value) {
            controller.chooseField.value = 4;
            getValidation(value);
            controller.update();
          },
        ),
      ),
      if (controller.chooseField.value == 4) getValidationError(),
      ...overallScore(),
    ];
  }

  getOverallScore() {
    if (controller.examNameSelected == "TOEFL") {
      // sum
    } else {
      //average
    }
  }

  getValidation(String value) {
    print(value);
    if (value.isNotEmpty) {
      switch (controller.examNameSelected) {
        case "PTE":
          if (double.parse(value) >= 0 && double.parse(value) <= 90) {
            controller.PTE.value = 1;
            if (double.parse(value) % 1 != 0) {
              controller.PTE.value = 4;
            }
            controller.update();
          } else {
            controller.PTE.value = 2;
            controller.update();
          }
          break;
        case "IELTS":
          if (double.parse(value) >= 0 && double.parse(value) <= 9) {
            controller.IELTS.value = 1;
            if (double.parse(value) % 0.5 != 0) {
              print(controller.PTE.value);
              controller.IELTS.value = 4;
            }
            controller.update();
          } else {
            controller.IELTS.value = 2;
            controller.update();
          }
          break;
        case "Cambridge":
          if (double.parse(value) >= 0 && double.parse(value) <= 230) {
            controller.cambridge.value = 1;
            if (double.parse(value) % 1 != 0) {
              controller.cambridge.value = 4;
            }
            controller.update();
          } else {
            controller.cambridge.value = 2;
            controller.update();
          }
          break;
        case "Duolingo":
          if (double.parse(value) >= 0 && double.parse(value) <= 160) {
            controller.Duolingo.value = 1;
            if (double.parse(value) % 5 != 0) {
              controller.Duolingo.value = 4;
            }
            controller.update();
          } else {
            controller.Duolingo.value = 2;
            controller.update();
          }
          break;
        case "TOEFL":
          if (double.parse(value) >= 0 && double.parse(value) <= 30) {
            controller.Toefl.value = 1;
            if (double.parse(value) % 1 != 0) {
              controller.Toefl.value = 4;
            }
            controller.update();
          } else {
            controller.Toefl.value = 2;
            controller.update();
          }
          break;
        default:
      }
    }
  }

  getValidationError() {
    if (controller.PTE.value == 2) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.PTEValidation1,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.PTE.value == 4) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.PTEValidation2,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.IELTS.value == 2) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.IELTSValidation1,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.IELTS.value == 4) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.IELTSValidation2,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.cambridge.value == 2) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.CambridgeSValidation1,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.cambridge.value == 4) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.CambridgeValidation2,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.Duolingo.value == 2) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.DuolingoSValidation1,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.Duolingo.value == 4) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.DuolingoSValidation2,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.Toefl.value == 2) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.ToeflSValidation1,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else if (controller.Toefl.value == 4) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAutoSizeTextMontserrat(
          text: SnackBarConstants.ToeflSValidation2,
          fontSize: 12,
          textColor: ThemeConstants.red,
        ),
      );
    } else {
      return Container();
    }
  }

  List<Widget> overallScore() {
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
            readOnly: controller.editSave.value == true ? true : false,
            textInputAction: TextInputAction.next,
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
            readOnly: controller.editSave.value == true ? true : false,
            textInputAction: TextInputAction.next,
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
  }

  viewCondition() {
    //exam status

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
      controller.duolingo.value = false;
    }
    //tentative / Definite
    if (controller.englishTestDetailsViewModel.writing != "" ||
        controller.englishTestDetailsViewModel.writing != "null" ||
        controller.englishTestDetailsViewModel.writing != null) {
      controller.tentative.value = false;
    }
    controller.update();
  }
}
