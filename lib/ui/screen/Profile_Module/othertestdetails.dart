import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/othertestdetails.dart';

import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_timer_widget.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';

class OthertestDetail extends StatelessWidget {
  OthertestDetail({Key? key, this.editButton}) : super(key: key);
  bool? editButton = false;

  var controller = Get.put(OtherTestDetailsController());

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      try {
        if (controller.loadingEdit.value == false &&
            controller.loadingExamStaus.value == true &&
            controller.loadingExamName.value == true &&
            controller.loadingViewOtherTestDetails.value == true) {
          controller.examStatusSelectedID =
              controller.otherTestDetailsModel.examStatus;
          for (var i = 0; i < controller.examStatusCode.length; i++) {
            if (controller.examStatusCode[i].toString() ==
                controller.otherTestDetailsModel.examStatus.toString()) {
              controller.examStatusSelected = controller.examStatusList[i];
            }
          }
          controller.bookTestSelected =
              controller.otherTestDetailsModel.testBook;
          controller.examNameSelected =
              controller.otherTestDetailsModel.examName;
          // controller.specifyExamNameSelected=controller.otherTestDetailsModel.
          controller.dateOfExamSelected =
              controller.otherTestDetailsModel.dateOfExam;
          controller.tentativeDateSelected =
              controller.otherTestDetailsModel.tentativeExamDate ?? "";
          controller.dateOftestReportSelected =
              controller.otherTestDetailsModel.resultDate ?? "";
          controller.testScoreExpirationDateSelected =
              controller.otherTestDetailsModel.expirationDate ?? "";
          controller.tentaiveDefinite =
              controller.otherTestDetailsModel.scoreType ?? "Tentative";

          OtherTestDetailsController.analyticalWriting.text = getNUllChecker(
                      controller.otherTestDetailsModel.analyticalWriting
                          .toString()) ==
                  false
              ? controller.otherTestDetailsModel.analyticalWriting.toString()
              : "";
          OtherTestDetailsController.verbalReasoning.text = getNUllChecker(
                      controller.otherTestDetailsModel.verbalReasoning
                          .toString()) ==
                  false
              ? controller.otherTestDetailsModel.verbalReasoning.toString()
              : "";
          OtherTestDetailsController.quantitative.text = getNUllChecker(
                      controller.otherTestDetailsModel.quantitativeApptitude
                          .toString()) ==
                  false
              ? controller.otherTestDetailsModel.quantitativeApptitude
                  .toString()
              : "";
          OtherTestDetailsController.integrateedReasoning.text = getNUllChecker(
                      controller.otherTestDetailsModel.integratedReasoning
                          .toString()) ==
                  false
              ? controller.otherTestDetailsModel.integratedReasoning.toString()
              : "";
          OtherTestDetailsController.overallScore.text = getNUllChecker(
                      controller.otherTestDetailsModel.overAll.toString()) ==
                  false
              ? controller.otherTestDetailsModel.overAll.toString()
              : "";
          OtherTestDetailsController.reading.text = getNUllChecker(
                      controller.otherTestDetailsModel.reading.toString()) ==
                  false
              ? controller.otherTestDetailsModel.reading.toString()
              : "";
          OtherTestDetailsController.writingAndLanguage.text = getNUllChecker(
                      controller.otherTestDetailsModel.writing.toString()) ==
                  false
              ? controller.otherTestDetailsModel.writing.toString()
              : "";
          OtherTestDetailsController.essay.text = getNUllChecker(
                      controller.otherTestDetailsModel.essay.toString()) ==
                  false
              ? controller.otherTestDetailsModel.essay.toString()
              : "";
          OtherTestDetailsController.math.text = getNUllChecker(
                      controller.otherTestDetailsModel.math.toString()) ==
                  false
              ? controller.otherTestDetailsModel.math.toString()
              : "";

          controller.loadingEdit.value = true;
        }
      } catch (e) {
        print(e.toString());
      }
      if (editButton == true) {
        controller.editSave.value = false;
        controller.update();
      }

      return SingleChildScrollView(
        child: Column(
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
                    // const Spacer(),
                    // if (controller.editSave.value == true)
                    //   TextButton(
                    //       onPressed: () {
                    //         controller.editSave.value = false;
                    //         controller.update();
                    //       },
                    //       child: CustomAutoSizeTextMontserrat(
                    //         text: "edit",
                    //         textColor: ThemeConstants.bluecolor,
                    //       )),
                    // if (controller.editSave.value == false)
                    //   TextButton(
                    //       onPressed: () {
                    //         controller.editSave.value = true;
                    //         controller.update();
                    //       },
                    //       child: CustomAutoSizeTextMontserrat(
                    //         text: "save",
                    //         textColor: ThemeConstants.bluecolor,
                    //       )),
                  ],
                ),
              ),
            ),
            CustomDropDownSingle(
              model: controller.loadingExamStaus.value == true
                  ? controller.examStatusList
                  : ["No Data"],
              initialSelectedValue: controller.loadingExamStaus.value == true
                  ? getNUllChecker(controller.examStatusSelected) == false
                      ? controller.examStatusSelected.toString()
                      : 'Kindly Select'
                  : "No Data",
              choosefieldtype: controller.editSave.value == true ? true : false,
              callbackFunction: callbackExamStatus,
            ),
            if (controller.examStatusSelectedID == "1") ...register(context),
            if (controller.examStatusSelectedID == "2")
              ...notYetRegister(context),
            if (controller.examStatusSelectedID == "3")
              ...testAlreadyTaken(context),
            // Align(
            //   alignment: AlignmentDirectional.topEnd,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 20, right: 20),
            //     child: SizedBox(
            //       width: 90,
            //       child: controller.editSave.value == false
            //           ? ElevatedButton(
            //               style: ElevatedButton.styleFrom(
            //                 foregroundColor: ThemeConstants.bluecolor,
            //                 elevation: 0.0,
            //                 backgroundColor:
            //                     ThemeConstants.bluecolor, // foreground
            //               ),
            //               onPressed: () async {
            //                 //register=> exam status,exam name
            //                 //not yet => exam status,  exam name,book test
            //                 //test already taken => exam status, exam name,
            //               },
            //               child: CustomAutoSizeTextMontserrat(
            //                 text: "Save",
            //                 textColor: ThemeConstants.whitecolor,
            //               ))
            //           : ElevatedButton(
            //               style: ElevatedButton.styleFrom(
            //                 foregroundColor: ThemeConstants.bluecolor,
            //                 elevation: 0.0,
            //                 backgroundColor:
            //                     ThemeConstants.bluecolor, // foreground
            //               ),
            //               onPressed: () async {
            //                 controller.editSave.value = false;
            //                 controller.update();
            //               },
            //               child: CustomAutoSizeTextMontserrat(
            //                 text: "Edit",
            //                 textColor: ThemeConstants.whitecolor,
            //               )),
            //     ),
            //   ),
            // ),

            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      );
    }, onLoading: getLoading(context));
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
      CustomDropDownSingle(
        model: controller.loadingExamName.value == true
            ? controller.examNameList
            : ["No Data"],
        initialSelectedValue: controller.loadingExamName.value == true
            ? getNUllChecker(controller.examNameSelected) == false
                ? controller.examNameSelected.toString()
                : "Kindly Select"
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
        child: SizedBox(
          height: 40,
          child: CustomTimerWidget(
              isBlank: true,
              initialTime: controller.otherTestDetailsModel.dateOfExam,
              startingDate: DateTime.now(),
              // enableField: controller.editSave.value == true ? true : false,
              // date: controller.dateOfExamSelected,
              callback: callbackDateOfExam),
        ),
      )
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
      CustomDropDownSingle(
        model: const ["Yes", "No"],
        initialSelectedValue: controller.bookTestSelected ?? "No",
        choosefieldtype: controller.editSave.value == true ? true : false,
        callbackFunction: callbackBookTest,
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
      CustomDropDownSingle(
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

            initialTime: controller.tentativeDateSelected,
            callback: (value) {
              callbackTentativeExamDate(value);
            },
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //       enableField: controller.editSave.value == true ? true : false,
      //       date: controller.tentativeDateSelected,
      //       callbackDate: callbackTentativeExamDate),
      // )
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
      CustomDropDownSingle(
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
          child: IgnorePointer(
             ignoring: controller.editSave.value == true ? true : false,
            child: CustomTimerWidget(
              isBlank: true,
              // enableField: false,
          
              initialTime: controller.dateOfExamSelected,
              callback: (value) {
                callbackExamName(value);
              },
            ),
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //       enableField: controller.editSave.value == true ? true : false,
      //       date: controller.dateOfExamSelected,
      //       callbackDate: callbackExamName),
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
          child: IgnorePointer(
             ignoring: controller.editSave.value == true ? true : false,
            child: CustomTimerWidget(
              isBlank: true,
              // enableField: false,
          
              initialTime: controller.dateOftestReportSelected,
              callback: (value) {
                callbackDateOfTestReport(value);
              },
            ),
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //       enableField: controller.editSave.value == true ? true : false,
      //       date: controller.dateOftestReportSelected,
      //       callbackDate: callbackTextScoreExpirationdate),
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
          child: IgnorePointer(
             ignoring: controller.editSave.value == true ? true : false,
            child: CustomTimerWidget(
              isBlank: true,
              // enableField: false,
          
              initialTime: controller.testScoreExpirationDateSelected,
              callback: (value) {
                callbackTextScoreExpirationdate(value);
              },
            ),
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: DatePickerExample(
      //       enableField: controller.editSave.value == true ? true : false,
      //       date: controller.testScoreExpirationDateSelected,
      //       callbackDate: callbackTextScoreExpirationdate),
      // ),
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
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomDropDownSingle(
          model: const ["Tentative", "Definite"],
          initialSelectedValue: controller.tentaiveDefinite,
          choosefieldtype: controller.editSave.value == true ? true : false,
          callbackFunction: callbackTentativeDefinite,
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.analyticalWriting,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .analyticalKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .analyticalKey
            //         .currentState!
            //         .save();
            //   }
            // },
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.verbalReasoning,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .verbalKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .verbalKey
            //         .currentState!
            //         .save();
            //   }
            // },
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.quantitative,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .quantitativeKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .quantitativeKey
            //         .currentState!
            //         .save();
            //   }
            // },
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.integrateedReasoning,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .integratedKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .integratedKey
            //         .currentState!
            //         .save();
            //   }
            // },
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Overall Score ",
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

          controller: OtherTestDetailsController.overallScore,
          keyboardType: TextInputType.number,
          // onChanged: (value) {
          //   if (Get.find<OtherTestDetailsController>()
          //       .overallKey
          //       .currentState!
          //       .validate()) {
          //     Get.find<OtherTestDetailsController>()
          //         .overallKey
          //         .currentState!
          //         .save();
          //   }
          // },
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
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.reading,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .readingKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .readingKey
            //         .currentState!
            //         .save();
            //   }
            // },
            validator: (value) {
              if (getNUllChecker(value) == false) {
                if (double.parse(value!) >= 200 && double.parse(value) <= 800) {
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.writingAndLanguage,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .writingKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .writingKey
            //         .currentState!
            //         .save();
            //   }
            // },
            validator: (value) {
              if (getNUllChecker(value) == false) {
                if (double.parse(value!) >= 200 && double.parse(value) <= 800) {
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            controller: OtherTestDetailsController.essay,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .essayKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .essayKey
            //         .currentState!
            //         .save();
            //   }
            // },
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.math,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .essayKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .essayKey
            //         .currentState!
            //         .save();
            //   }
            // },
            validator: (value) {
              if (getNUllChecker(value) == false) {
                if (double.parse(value!) >= 200 && double.parse(value) <= 800) {
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: OtherTestDetailsController.overallScore,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (getNUllChecker(value) == false) {
              if (double.parse(value!) >= 400 && double.parse(value) <= 1600) {
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
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.analyticalWriting,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .analyticalKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .analyticalKey
            //         .currentState!
            //         .save();
            //   }
            // },
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
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.verbalReasoning,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .verbalKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .verbalKey
            //         .currentState!
            //         .save();
            //   }
            // },
            validator: (value) {
              if (getNUllChecker(value) == false) {
                if (double.parse(value!) >= 130 && double.parse(value) <= 160) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants.GRE_Verbal_Quantitative_Multiples;
                  }
                } else {
                  return SnackBarConstants.GRE_Verbal_Quantitative_Range;
                }
              }
              return null;
            },
            readOnly: controller.editSave.value == true ? true : false,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: OtherTestDetailsController.quantitative,
            keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if (Get.find<OtherTestDetailsController>()
            //       .quantitativeKey
            //       .currentState!
            //       .validate()) {
            //     Get.find<OtherTestDetailsController>()
            //         .quantitativeKey
            //         .currentState!
            //         .save();
            //   }
            // },
            validator: (value) {
              if (getNUllChecker(value) == false) {
                if (double.parse(value!) >= 130 && double.parse(value) <= 160) {
                  if (double.parse(value) % 1 != 0) {
                    return SnackBarConstants.GRE_Verbal_Quantitative_Multiples;
                  }
                } else {
                  return SnackBarConstants.GRE_Verbal_Quantitative_Range;
                }
              }
              return null;
            },
            readOnly: controller.editSave.value == true ? true : false,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          controller: OtherTestDetailsController.overallScore,
          keyboardType: TextInputType.number,
          // onChanged: (value) {
          //   if (Get.find<OtherTestDetailsController>()
          //       .overallKey
          //       .currentState!
          //       .validate()) {
          //     Get.find<OtherTestDetailsController>()
          //         .overallKey
          //         .currentState!
          //         .save();
          //   }
          // },
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
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40),
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
    ];
  }

  callbackExamStatus(varTopic) {
    controller.specifyExamNameSelected = null;
    controller.specifyExamNameSelectedID = null;

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

  callbackBookTest(data) {
    if (data == "Yes") {
      controller.bookTestSelected = "Yes";
      controller.bookTestSelectedID = "0";
    } else {
      controller.bookTestSelected = "No";
      controller.bookTestSelectedID = "1";
    }
    controller.update();
  }

  callbackTentativeDefinite(data) {
    controller.otherTestDetailsModel.scoreType = data;
    controller.tentaiveDefinite = data;
    controller.update();
  }

  callbackDateOfExam(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    controller.dateOfExamSelected = data;
    controller.update();
  }

  callbackTentativeExamDate(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    controller.tentativeDateSelected = data;

    // date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
  }

  callbackDateOfTestReport(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    controller.dateOftestReportSelected = data;
    controller.update();
  }

  callbackTextScoreExpirationdate(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    controller.testScoreExpirationDateSelected = data;

    controller.update();
  }
}
