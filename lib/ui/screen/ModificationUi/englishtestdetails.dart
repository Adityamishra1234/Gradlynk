import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/englishtest.dart';
import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
import 'package:studentpanel/utils/constants.dart';
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
  final dateOfExam = TextEditingController();
  final dateOfTestReport = TextEditingController();
  final testScoreExpirationDate = TextEditingController();
  final tentativeExamDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnglishTestController>(builder: (_) {
      if (_.loadingFirstTime.value == false) {
        if (_.loadingExamName2.value == true &&
            _.loadingExamStaus.value == true &&
            _.loadingViewEnglishTestDetails.value == true) {
          viewCondition();
        }
      }

      return ListView(
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
                  if (_.editSave.value == true)
                    TextButton(
                        onPressed: () {
                          _.editSave.value = false;
                          _.update();
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "edit",
                          textColor: ThemeConstants.bluecolor,
                        )),
                  if (_.editSave.value == false)
                    TextButton(
                        onPressed: () {
                          _.editSave.value = true;
                          _.update();
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
                  ? getNUllChecker(_.examStatusSelected) == true
                      ? _.examStatusList[0]
                      : _.examStatusSelected.toString()
                  : "No Data",
              choosefieldtype: _.editSave.value == true ? true : false,
              callbackFunction: callbackExamStatus,
            ),
          ),
          if (getNUllChecker(_.examStatusSelected) == false)
            if (_.examStatusCodeSelected == 1) ...registered(context),
          if (_.examStatusCodeSelected == 2) ...notYetRegistered(context),
          if (_.examStatusCodeSelected == 3) ...testAllReadyTaken(context),
          if (_.examStatusCodeSelected == 3 && _.tentative.value == true)
            ...tentative(context),
          if (_.examStatusCodeSelected == 3 &&
              _.tentative.value == false &&
              _.duolingo.value == false)
            ...definite(context),
          if (_.examStatusCodeSelected == 3 &&
              _.tentative.value == false &&
              _.duolingo.value == true)
            ...duolingo(context),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: SizedBox(
                width: 90,
                child: _.editSave.value == false
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: ThemeConstants.bluecolor, // background
                          onPrimary: ThemeConstants.bluecolor, // foreground
                        ),
                        onPressed: () async {
                          //Book test
                          //Specify_exam_name
                          //already_given_exam_name
                          EnglishTestDetailsViewModel
                              englishTestDetailsViewModel =
                              EnglishTestDetailsViewModel();
                          englishTestDetailsViewModel =
                              _.englishTestDetailsViewModel;
                          englishTestDetailsViewModel.enqId = "78623";
                          englishTestDetailsViewModel.examStatusID =
                              _.examStatusCodeSelected.toString();
                          englishTestDetailsViewModel.dateOfExam =
                              dateOfExam.text;
                          englishTestDetailsViewModel.examName =
                              _.examNameSelected;

                          englishTestDetailsViewModel.resultDate =
                              dateOfTestReport.text;
                          englishTestDetailsViewModel.expirationDate =
                              testScoreExpirationDate.text;
                          englishTestDetailsViewModel.tentativeExamDate =
                              tentativeExamDate.text;
                          englishTestDetailsViewModel.reading = reading.text;
                          englishTestDetailsViewModel.writing = writing.text;
                          englishTestDetailsViewModel.listening =
                              listening.text;
                          englishTestDetailsViewModel.speaking = speaking.text;
                          englishTestDetailsViewModel.literacy = listening.text;
                          englishTestDetailsViewModel.comprehension =
                              writing.text;
                          englishTestDetailsViewModel.conversation =
                              reading.text;
                          englishTestDetailsViewModel.production = writing.text;
                          print(getNUllChecker(tentativeExamDate.text));
                          if (getNUllChecker(tentativeExamDate.text)) {
                            englishTestDetailsViewModel.overAll =
                                overallScoreController.text;
                          } else {
                            englishTestDetailsViewModel.overAll =
                                controller.englishTestDetailsViewModel.overAll;
                          }

                          updateEnglishTestDetails(englishTestDetailsViewModel);
                          _.editSave.value = true;
                          _.update();
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Save",
                          textColor: ThemeConstants.whitecolor,
                        ))
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: ThemeConstants.bluecolor, // background
                          onPrimary: ThemeConstants.bluecolor, // foreground
                        ),
                        onPressed: () async {
                          _.editSave.value = false;
                          _.update();
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Edit",
                          textColor: ThemeConstants.whitecolor,
                        )),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
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
      GetBuilder<EnglishTestController>(builder: (_) {
        return SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model:
                _.loadingExamName2.value == true ? _.examNameList : ["No Data"],
            initialSelectedValue: _.loadingExamName2.value == true
                ? getNUllChecker(_.examNameSelected) == true
                    ? _.examNameList[0]
                    : _.examNameSelected.toString()
                : "No Data",
            choosefieldtype: _.editSave.value == true ? true : false,
            callbackFunction: callbackExamName,
          ),
        );
      }),
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
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          controller: dateOfExam,
          readOnly: controller.editSave.value == true ? true : false,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: getNUllChecker(
                        controller.englishTestDetailsViewModel.dateOfExam) ==
                    true
                ? "Enter Contact Of Relative"
                : controller.englishTestDetailsViewModel.dateOfExam.toString(),
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

  List<Widget> notYetRegistered(BuildContext context) {
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
            mandatory: true,
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
          controller: tentativeExamDate,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
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
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          controller: dateOfExam,
          readOnly: controller.editSave.value == true ? true : false,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: getNUllChecker(
                        controller.englishTestDetailsViewModel.dateOfExam) ==
                    true
                ? "Enter Contact Of Relative"
                : controller.englishTestDetailsViewModel.dateOfExam.toString(),
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
          controller: dateOfTestReport,
          readOnly: controller.editSave.value == true ? true : false,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: controller.englishTestDetailsViewModel.resultDate == null
                ? "Enter Contact Of Relative"
                : controller.englishTestDetailsViewModel.resultDate.toString(),
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
          controller: testScoreExpirationDate,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          readOnly: controller.editSave.value == true ? true : false,
          decoration: InputDecoration(
            hintText:
                controller.englishTestDetailsViewModel.expirationDate == null
                    ? "Enter Contact Of Relative"
                    : controller.englishTestDetailsViewModel.expirationDate
                        .toString(),
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
          onTap: (() {
            Fluttertoast.showToast(
                msg: "Overall Scroe will autofill",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: ThemeConstants.whitecolor,
                textColor: ThemeConstants.blackcolor,
                fontSize: 16.0);
          }),
          readOnly: controller.editSave.value == true ? true : false,
          controller: overallScoreController,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: getNUllChecker(
                        controller.englishTestDetailsViewModel.overAll) ==
                    true
                ? "Overall Score"
                : controller.englishTestDetailsViewModel.overAll,
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
        child: TextField(
          controller: listening,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          onChanged: (value) {
            controller.chooseField.value = 1;
            getValidation(value);
            controller.update();
          },
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
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
        child: TextField(
          controller: listening,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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

  List<Widget> overallScore(BuildContext context) {
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
  }

  updateEnglishTestDetails(
      EnglishTestDetailsViewModel englishTestDetailsViewModel) {
    controller.updateEnglishTestDetaisl("78623", englishTestDetailsViewModel);
  }
}
