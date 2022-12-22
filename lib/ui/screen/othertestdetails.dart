import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/othertestdetails.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class OthertestDetail extends StatelessWidget {
  OthertestDetail({Key? key}) : super(key: key);

  var controller = Get.put(OtherTestDetailsController());
  static final dateOfExam = TextEditingController();
  static final tentativeExamDate = TextEditingController();
  static final dateOfTestReport = TextEditingController();
  static final testScoreExpirationDate = TextEditingController();
  static final analyticalWriting = TextEditingController();
  static final verbalReasoning = TextEditingController();
  static final quantitative = TextEditingController();
  static final integrateedReasoning = TextEditingController();
  static final reading = TextEditingController();
  static final writingAndLanguage = TextEditingController();
  static final essay = TextEditingController();
  static final math = TextEditingController();
  static final overallScore = TextEditingController();

  static final analyticalKey = GlobalKey<FormState>();
  static final verbalKey = GlobalKey<FormState>();
  static final quantitativeKey = GlobalKey<FormState>();
  static final integratedKey = GlobalKey<FormState>();
  static final overallKey = GlobalKey<FormState>();

  static final readingKey = GlobalKey<FormState>();
  static final writingKey = GlobalKey<FormState>();
  static final essayKey = GlobalKey<FormState>();
  static final mathKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherTestDetailsController>(builder: (_) {
      if (_.loadingEdit.value == false &&
          _.loadingExamStaus.value == true &&
          _.loadingExamName.value == true &&
          _.loadingViewOtherTestDetails.value == true) {
        _.examStatusSelectedID = _.otherTestDetailsModel.examStatus;
        for (var i = 0; i < _.examStatusCode.length; i++) {
          if (_.examStatusCode[i].toString() ==
              _.otherTestDetailsModel.examStatus.toString()) {
            _.examStatusSelected = _.examStatusList[i];
          }
        }
        _.bookTestSelected = _.otherTestDetailsModel.testBook ?? "";
        _.examNameSelected = _.otherTestDetailsModel.examName;
        // _.specifyExamNameSelected=_.otherTestDetailsModel.
        tentativeExamDate.text =
            _.otherTestDetailsModel.tentativeExamDate ?? "";
        dateOfTestReport.text = _.otherTestDetailsModel.resultDate ?? "";
        testScoreExpirationDate.text =
            _.otherTestDetailsModel.expirationDate ?? "";
        _.tentaiveDefinite = _.otherTestDetailsModel.scoreType ?? "Tentative";

        analyticalWriting.text = getNUllChecker(
                    _.otherTestDetailsModel.analyticalWriting.toString()) ==
                false
            ? _.otherTestDetailsModel.analyticalWriting.toString()
            : "";
        verbalReasoning.text = getNUllChecker(
                    _.otherTestDetailsModel.verbalReasoning.toString()) ==
                false
            ? _.otherTestDetailsModel.verbalReasoning.toString()
            : "";
        quantitative.text = getNUllChecker(
                    _.otherTestDetailsModel.quantitativeApptitude.toString()) ==
                false
            ? _.otherTestDetailsModel.quantitativeApptitude.toString()
            : "";
        integrateedReasoning.text = getNUllChecker(
                    _.otherTestDetailsModel.integratedReasoning.toString()) ==
                false
            ? _.otherTestDetailsModel.integratedReasoning.toString()
            : "";
        overallScore.text =
            getNUllChecker(_.otherTestDetailsModel.overAll.toString()) == false
                ? _.otherTestDetailsModel.overAll.toString()
                : "";
        reading.text =
            getNUllChecker(_.otherTestDetailsModel.reading.toString()) == false
                ? _.otherTestDetailsModel.reading.toString()
                : "";
        writingAndLanguage.text =
            getNUllChecker(_.otherTestDetailsModel.writing.toString()) == false
                ? _.otherTestDetailsModel.writing.toString()
                : "";
        essay.text =
            getNUllChecker(_.otherTestDetailsModel.essay.toString()) == false
                ? _.otherTestDetailsModel.essay.toString()
                : "";
        math.text =
            getNUllChecker(_.otherTestDetailsModel.math.toString()) == false
                ? _.otherTestDetailsModel.math.toString()
                : "";

        _.loadingEdit.value = true;
      }

      return ListView(
        children: [
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
                  ? getNUllChecker(_.examStatusSelected) == false
                      ? _.examStatusSelected.toString()
                      : _.examStatusList[0]
                  : "No Data",
              choosefieldtype: _.editSave.value == true ? true : false,
              callbackFunction: callbackExamStatus,
            ),
          ),
          if (_.examStatusSelectedID == "1") ...register(context),
          if (_.examStatusSelectedID == "2") ...notYetRegister(context),
          if (_.examStatusSelectedID == "3") ...testAlreadyTaken(context),
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
                          _.updateOtherTestDetails("78623");
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
        ],
      );
    });
  }

// Function

  List<Widget> register(BuildContext context) {
    return [
      // // Case 1
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
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: controller.loadingExamName.value == true
              ? controller.examNameList
              : ["No Data"],
          initialSelectedValue: controller.loadingExamName.value == true
              ? getNUllChecker(controller.examNameSelected) == false
                  ? controller.examNameSelected.toString()
                  : controller.examNameList[0]
              : "No Data",
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callbackExamStatus,
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
            hintText:
                getNUllChecker(controller.otherTestDetailsModel.dateOfExam) ==
                        true
                    ? "Enter Contact Of Relative"
                    : controller.otherTestDetailsModel.dateOfExam.toString(),
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

  List<Widget> notYetRegister(BuildContext context) {
    return [
      //case 2
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Row(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "Do you want to book test?",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: const ["Yes", "No"],
          initialSelectedValue: "No",
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callbackBookTest,
        ),
      ),
      //Yes
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Row(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "Specify Exam Name",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ],
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
          callbackFunction: callbackBookTest,
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
          readOnly: controller.editSave.value == true ? true : false,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: "Enter Tentative Exam Date",
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

  List<Widget> testAlreadyTaken(BuildContext context) {
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
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: controller.loadingExamName.value == true
              ? controller.examNameList
              : ["No Data"],
          initialSelectedValue: controller.loadingExamName.value == true
              ? getNUllChecker(controller.examNameSelected) == false
                  ? controller.examNameSelected.toString()
                  : controller.examNameList[0]
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
          controller: tentativeExamDate,
          readOnly: controller.editSave.value == true ? true : false,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: "Enter Date Of Exam",
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
            hintText: "Enter Date Of Test Report",
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
          readOnly: controller.editSave.value == true ? true : false,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: "Enter Test Score Expiration Date",
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
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 50,
          child: CustomDropDownSingle(
            model: const ["Tentative", "Definite"],
            initialSelectedValue: controller.tentaiveDefinite,
            choosefieldtype: controller.editSave.value == true ? true : false,
            callbackFunction: callbackTentativeDefinite,
          ),
        ),
      ),
      if (controller.examNameSelected == "GMAT")
        ...GMAT(context, controller.tentaiveDefinite!),
      if (controller.examNameSelected == "SAT")
        ...SAT(context, controller.tentaiveDefinite!),
      if (controller.examNameSelected == "GRE")
        ...GRE(context, controller.tentaiveDefinite!),
    ];
  }

  List<Widget> GMAT(BuildContext context, String tentaiveDefinite) {
    return [
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Analytical Writing",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: analyticalKey,
            child: TextFormField(
              controller: analyticalWriting,
              onChanged: (value) {
                if (analyticalKey.currentState!.validate()) {
                  analyticalKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 0 && double.parse(value) <= 5) {
                    if (double.parse(value) % 0.5 != 0) {
                      return SnackBarConstants.GMAT_Analytical__Multiples;
                    }
                  } else {
                    return SnackBarConstants.GMAT_Analytical_Integrated_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Analytical Writing",
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
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Verbal Reasoning",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: verbalKey,
            child: TextFormField(
              controller: verbalReasoning,
              onChanged: (value) {
                if (verbalKey.currentState!.validate()) {
                  verbalKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 0 && double.parse(value) <= 60) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants
                          .GMAT_Verbal_Quantitative_Integrated__Multiples;
                    }
                  } else {
                    return SnackBarConstants.GMAT_Verbal_Quantitative_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Verbal Reasoning",
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
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Quantitative Aptitude",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: quantitativeKey,
            child: TextFormField(
              controller: quantitative,
              onChanged: (value) {
                if (quantitativeKey.currentState!.validate()) {
                  quantitativeKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 0 && double.parse(value) <= 60) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants
                          .GMAT_Verbal_Quantitative_Integrated__Multiples;
                    }
                  } else {
                    return SnackBarConstants.GMAT_Verbal_Quantitative_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Quantitative Aptitude",
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
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Integrated Reasoning",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: integratedKey,
            child: TextFormField(
              controller: integrateedReasoning,
              onChanged: (value) {
                if (integratedKey.currentState!.validate()) {
                  integratedKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 0 && double.parse(value) <= 6) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants
                          .GMAT_Verbal_Quantitative_Integrated__Multiples;
                    }
                  } else {
                    return SnackBarConstants.GMAT_Verbal_Quantitative_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Integrated Reasoning",
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
        ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Overall Score (Other Test)",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: overallKey,
          child: TextFormField(
            controller: overallScore,
            onChanged: (value) {
              if (overallKey.currentState!.validate()) {
                overallKey.currentState!.save();
              }
            },
            validator: (value) {
              if (getNUllChecker(value) == false) {
                if (double.parse(value!) >= 200 && double.parse(value) <= 800) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants
                        .GMAT_Verbal_Quantitative_Integrated__Multiples;
                  }
                } else {
                  return SnackBarConstants.GMAT_Overall;
                }
              }
              return null;
            },
            readOnly: controller.editSave.value == true ? true : false,
            scrollPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).viewInsets.bottom + 30),
            decoration: InputDecoration(
              hintText: "Enter Overall Score (Other Test)",
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
      ),
    ];
  }

  List<Widget> SAT(BuildContext context, String tentaiveDefinite) {
    return [
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Reading (Other Test)",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: readingKey,
            child: TextFormField(
              controller: reading,
              onChanged: (value) {
                if (readingKey.currentState!.validate()) {
                  readingKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 200 &&
                      double.parse(value) <= 800) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants.SAT__Multiples;
                    }
                  } else {
                    return SnackBarConstants.SAT_Reading_Writting_Math_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Reading (Other Test)",
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
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Writing and Language",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: writingKey,
            child: TextFormField(
              controller: writingAndLanguage,
              onChanged: (value) {
                if (writingKey.currentState!.validate()) {
                  writingKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 200 &&
                      double.parse(value) <= 800) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants.SAT__Multiples;
                    }
                  } else {
                    return SnackBarConstants.SAT_Reading_Writting_Math_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Writing and Language",
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
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Essay(optional)",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: essayKey,
            child: TextFormField(
              controller: essay,
              onChanged: (value) {
                if (essayKey.currentState!.validate()) {
                  essayKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 2 && double.parse(value) <= 8) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants.SAT__Multiples;
                    }
                  } else {
                    return SnackBarConstants.SAT_Essay_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Essay(optional)",
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
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Math",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: mathKey,
            child: TextFormField(
              controller: math,
              onChanged: (value) {
                if (essayKey.currentState!.validate()) {
                  essayKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 200 &&
                      double.parse(value) <= 800) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants.SAT__Multiples;
                    }
                  } else {
                    return SnackBarConstants.SAT_Reading_Writting_Math_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Math",
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
        ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Overall Score (Other Test)",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: overallKey,
          child: TextFormField(
            controller: overallScore,
            onChanged: (value) {
              if (overallKey.currentState!.validate()) {
                overallKey.currentState!.save();
              }
            },
            validator: (value) {
              if (getNUllChecker(value) == false) {
                if (double.parse(value!) >= 400 &&
                    double.parse(value) <= 1600) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants.SAT__Multiples;
                  }
                } else {
                  return SnackBarConstants.SAT_Reading_Writting_Math_Range;
                }
              }
              return null;
            },
            readOnly: controller.editSave.value == true ? true : false,
            scrollPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).viewInsets.bottom + 30),
            decoration: InputDecoration(
              hintText: "Enter Overall Score (Other Test)",
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
      ),
    ];
  }

  List<Widget> GRE(BuildContext context, String tentaiveDefinite) {
    return [
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Analytical Writing",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: analyticalKey,
            child: TextFormField(
              controller: analyticalWriting,
              onChanged: (value) {
                if (analyticalKey.currentState!.validate()) {
                  analyticalKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 0 && double.parse(value) <= 6) {
                    if (double.parse(value) % 0.5 != 0) {
                      return SnackBarConstants.GRE_Analytical_Multiples;
                    }
                  } else {
                    return SnackBarConstants.GRE_Analytical_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Analytical Writing",
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
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Verbal Reasoning",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: verbalKey,
            child: TextFormField(
              controller: verbalReasoning,
              onChanged: (value) {
                if (verbalKey.currentState!.validate()) {
                  verbalKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 130 &&
                      double.parse(value) <= 160) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants
                          .GRE_Verbal_Quantitative_Multiples;
                    }
                  } else {
                    return SnackBarConstants.GRE_Verbal_Quantitative_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Verbal Reasoning",
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
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Quantitative Aptitude",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (tentaiveDefinite == "Definite")
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: quantitativeKey,
            child: TextFormField(
              controller: quantitative,
              onChanged: (value) {
                if (quantitativeKey.currentState!.validate()) {
                  quantitativeKey.currentState!.save();
                }
              },
              validator: (value) {
                if (getNUllChecker(value) == false) {
                  if (double.parse(value!) >= 130 &&
                      double.parse(value) <= 160) {
                    if (double.parse(value) % 1 != 0) {
                      return SnackBarConstants
                          .GRE_Verbal_Quantitative_Multiples;
                    }
                  } else {
                    return SnackBarConstants.GRE_Verbal_Quantitative_Range;
                  }
                }
                return null;
              },
              readOnly: controller.editSave.value == true ? true : false,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Quantitative Aptitude",
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
        ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Overall Score (Other Test)",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: overallKey,
          child: TextFormField(
            controller: overallScore,
            onChanged: (value) {
              if (overallKey.currentState!.validate()) {
                overallKey.currentState!.save();
              }
            },
            validator: (value) {
              if (getNUllChecker(value) == false) {
                if (double.parse(value!) >= 260 && double.parse(value) <= 340) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants.GRE_Overall_Multiples;
                  }
                } else {
                  return SnackBarConstants.GRE_Overall;
                }
              }
              return null;
            },
            readOnly: controller.editSave.value == true ? true : false,
            scrollPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).viewInsets.bottom + 30),
            decoration: InputDecoration(
              hintText: "Enter Overall Score (Other Test)",
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
      ),
    ];
  }

  callbackExamStatus(varTopic) {
    print(varTopic);
    for (var i = 0; i < controller.examStatusList.length; i++) {
      if (controller.examStatusList[i] == varTopic) {
        controller.examStatusSelected = controller.examStatusList[i];
        controller.examStatusSelectedID = controller.examStatusCode[i];
      }
    }
    controller.update();
  }

  callbackExamName(varTopic) {
    controller.examNameSelected = varTopic;
    controller.update();
  }

  callbackBookTest(data) {}
  callbackSpecifyExamName(data) {}
  callbackTentativeDefinite(data) {
    controller.otherTestDetailsModel.scoreType = data;
    controller.tentaiveDefinite = data;
    controller.update();
  }
}
