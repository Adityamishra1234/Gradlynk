import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/qualificationdetails.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class QualificationWidget extends StatelessWidget {
  bool updateForEdit;
  int? index;
  Function callbackHighestQualification;
  Function callbackStream;
  Function callback;
  Function callbackCountry;
  Function callbackState;

  QualificationWidget(
      {Key? key,
      required this.updateForEdit,
      this.index,
      required this.callbackHighestQualification,
      required this.callbackStream,
      required this.callbackCountry,
      required this.callbackState,
      required this.callback})
      : super(key: key);

  static final qualificationName = TextEditingController();
  static final multiplier = TextEditingController();
  static final cgpa = TextEditingController();
  static final percentage = TextEditingController();
  static final reApper = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QualificationDetailsController>(builder: (controller1) {
      if (updateForEdit == false) {
        qualificationName.text = controller1.modelList[index!].courseName ?? "";
        multiplier.text = controller1.modelList[index!].multiplier ?? "";
        percentage.text = controller1.modelList[index!].percentage ?? "";
        reApper.text = controller1.modelList[index!].reapperCount ?? "";
      }

      if (updateForEdit == false &&
          controller1.loadingEditQualification.value == true) {
        controller1.loadingEditQualification.value = false;
        controller1.highestQualificationSelected =
            controller1.modelList[index!].courseLevel;

        controller1.streamSelected =
            controller1.modelList[index!].streamName ?? "";
        controller1.streamSelectedID =
            getNUllChecker(controller1.modelList[index!].streamId.toString()) ==
                    false
                ? controller1.modelList[index!].streamId.toString()
                : "";
        controller1.educationStatusSelected =
            controller1.modelList[index!].educationStatus ?? "";
        controller1.yearOfPassingSelected =
            controller1.modelList[index!].yearOfPassing ?? "";

        // cgpa.text = double.parse(controller1.modelList[index!].percentage.toString()) /;

        controller1.countrySelected =
            controller1.modelList[index!].countryName ?? "";
        controller1.countrySelectedID =
            controller1.modelList[index!].countryId ?? "";
        controller1.stateSelected =
            controller1.modelList[index!].stateName ?? "";
        controller1.stateSelectedID =
            controller1.modelList[index!].stateId ?? "";
        controller1.citySelected = controller1.modelList[index!].cityName ?? "";
        controller1.citySelectedID = controller1.modelList[index!].cityId ?? "";
        controller1.affiliationNameSelected =
            controller1.modelList[index!].affiliationName ?? "";
        controller1.affiliationCodeSelected =
            controller1.modelList[index!].affiliationId ?? "";
        controller1.institutionSelected =
            controller1.modelList[index!].universityName ?? "";
        controller1.institutionSelectedID =
            controller1.modelList[index!].passingInstId ?? "";

        controller1.getState(controller1.countrySelectedID!);
        controller1.getCity(controller1.stateSelectedID ?? "");
        controller1.getAffiliation(controller1.countrySelectedID ?? "");
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextButton(
                    onPressed: () {
                      if (controller1.loadingViewQualification.value == true) {
                        controller1.setaddedQualification(true);
                      }
                    },
                    child: CustomAutoSizeTextMontserrat(
                      text: "View Details",
                      fontSize: 14,
                      textColor: ThemeConstants.orangeColor,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Highest Qualification",
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
                model: controller1.loadingHighestQualification.value == true
                    ? controller1.highestQualificationList
                    : ["No data"],
                initialSelectedValue:
                    controller1.loadingHighestQualification.value == true
                        ? controller1.highestQualificationSelected ??
                            controller1.highestQualificationList[0]
                        : "No data",
                choosefieldtype: false,
                callbackFunction: callbackHighestQualification,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Qualification Name",
                  mandatory: true,
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: qualificationName,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
                decoration: InputDecoration(
                  hintText: "Enter Qualification Name",
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
                  text: "Stream",
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
                model: controller1.loadingStream.value == true
                    ? controller1.streamList
                    : ["No data"],
                initialSelectedValue: controller1.loadingStream.value == true
                    ? controller1.streamSelected ?? controller1.streamList[0]
                    : "No data",
                choosefieldtype: false,
                callbackFunction: callbackStream,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Education Status",
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
                model: controller1.loadingEducationStatus.value == true
                    ? controller1.educationStatusList
                    : ["No Data"],
                initialSelectedValue:
                    controller1.loadingEducationStatus.value == true
                        ? controller1.educationStatusSelected ??
                            controller1.educationStatusList[0]
                        : "No Data",
                choosefieldtype: false,
                callbackFunction: callback,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Year of Passing",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: CustomDropDownSingle(
                model: controller1.loadingyearOfpassing.value == true
                    ? controller1.yearofPassing
                    : ["No Data"],
                initialSelectedValue:
                    controller1.loadingyearOfpassing.value == true
                        ? controller1.yearOfPassingSelected ??
                            controller1.yearofPassing[0]
                        : "No Data",
                choosefieldtype: false,
                callbackFunction: callback,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Multiplier",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: multiplier,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
                decoration: InputDecoration(
                  hintText: "Multiplier",
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
                  text: "CGPA",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: cgpa,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
                decoration: InputDecoration(
                  hintText: "CGPA",
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
                  text: "Percentage",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: percentage,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
                decoration: InputDecoration(
                  hintText: "Enter your Percentage",
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
                  text: "Country of Education",
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
                model: controller1.loadingCountry.value == true
                    ? controller1.countryList
                    : ["No data"],
                initialSelectedValue: controller1.loadingCountry.value == true
                    ? controller1.countrySelected ?? controller1.countryList[0]
                    : "No data",
                choosefieldtype: false,
                callbackFunction: callbackCountry,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "State",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: CustomDropDownSingle(
                model: controller1.loadingState.value == true
                    ? controller1.stateList
                    : ["No data"],
                initialSelectedValue: controller1.loadingState.value == true
                    ? controller1.stateSelected ?? controller1.stateList[0]
                    : "No data",
                choosefieldtype: false,
                callbackFunction: callbackState,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "City",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: CustomDropDownSingle(
                model: controller1.loadingCity.value == true
                    ? controller1.cityList
                    : ["No data"],
                initialSelectedValue: controller1.loadingCity.value == true
                    ? controller1.citySelected ?? controller1.cityList[0]
                    : "No data",
                choosefieldtype: false,
                callbackFunction: callback,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Affiliation",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: CustomDropDownSingle(
                model: controller1.loadingAffiliation.value == true
                    ? controller1.affiliationList
                    : ["No data"],
                initialSelectedValue:
                    controller1.loadingAffiliation.value == true
                        ? controller1.affiliationNameSelected ??
                            controller1.affiliationList[0]
                        : "No data",
                choosefieldtype: false,
                callbackFunction: callback,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "name of the Institution",
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
                model: controller1.loadingAffiliation.value == true
                    ? controller1.affiliationList
                    : ["No data"],
                initialSelectedValue:
                    controller1.loadingAffiliation.value == true
                        ? controller1.affiliationList[0]
                        : "No data",
                choosefieldtype: false,
                callbackFunction: callback,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Re-appear/Backlog",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: reApper,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
                decoration: InputDecoration(
                  hintText: "Enter backlogs",
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
            if (updateForEdit == true)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: SizedBox(
                        width: 90,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              primary: ThemeConstants.bluecolor, // background
                              onPrimary: ThemeConstants.bluecolor, // foreground
                            ),
                            onPressed: () async {
                              controller1.modelList
                                  .add(QualificationDetailsViewModel(
                                grade: cgpa.text,
                                multiplier: multiplier.text,
                                applicantType: "",
                                qualificationId: controller1
                                    .highestQualificationSelectedID
                                    .toString(),
                                streamId:
                                    controller1.streamSelectedID.toString(),
                                countryId:
                                    controller1.countrySelectedID.toString(),
                                cityId: controller1.citySelectedID.toString(),
                                stateId: controller1.stateSelectedID.toString(),
                                affiliationId: controller1
                                    .affiliationCodeSelected
                                    .toString(),
                                passingInstId: controller1.institutionSelectedID
                                    .toString(),
                                educationStatus:
                                    controller1.educationStatusSelected,
                                yearOfPassing:
                                    controller1.yearOfPassingSelected,
                                percentage: percentage.text,
                                reapperCount: reApper.text,
                                courseLevel:
                                    controller1.highestQualificationSelected,
                                streamName: controller1.streamSelected,
                                countryName: controller1.countrySelected,
                                stateName: controller1.stateSelected,
                                cityName: controller1.citySelected,
                                affiliationName:
                                    controller1.affiliationNameSelected,
                                universityName: controller1.institutionSelected,
                                courseName: qualificationName.text,
                              ));
                              controller1.updateQualification("78623");
                              controller1.updteForEdit.value = false;
                              controller1.update();
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "Added",
                              textColor: ThemeConstants.whitecolor,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            if (updateForEdit == false)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: SizedBox(
                        width: 110,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              primary: ThemeConstants.bluecolor, // background
                              onPrimary: ThemeConstants.bluecolor, // foreground
                            ),
                            onPressed: () async {
                              // Api call
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "Update",
                              textColor: ThemeConstants.whitecolor,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 120,
            )
          ],
        ),
      );
    });
  }
}
