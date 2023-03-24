import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/QualificationDetails.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class QualificationWidget extends StatefulWidget {
  bool updateForEdit;
  int? index;
  Function callbackHighestQualification;
  Function callbackStream;
  Function callback;
  Function callbackCountry;
  Function callbackState;
  Function callbackCity;
  Function callbackEducationStatus;
  Function callbackYearOfPassing;
  Function callbackInstitution;
  Function callbackAffiliation;

  QualificationWidget(
      {Key? key,
      required this.updateForEdit,
      required this.callbackEducationStatus,
      required this.callbackYearOfPassing,
      required this.callbackInstitution,
      required this.callbackAffiliation,
      this.index,
      required this.callbackCity,
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
  State<QualificationWidget> createState() => _QualificationWidgetState();
}

class _QualificationWidgetState extends State<QualificationWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QualificationDetailsController>(builder: (controller1) {
      try {
        if (widget.index != null) {
          if (widget.updateForEdit == false) {
            QualificationWidget.qualificationName.text =
                controller1.modelList[widget.index!].courseName ?? "";
            QualificationWidget.multiplier.text =
                controller1.modelList[widget.index!].multiplier ?? "";
            QualificationWidget.percentage.text =
                controller1.modelList[widget.index!].percentage ?? "";
            QualificationWidget.reApper.text =
                controller1.modelList[widget.index!].reapperCount ?? "";
          }
          if (widget.updateForEdit == false &&
              controller1.loadingEditQualification.value == true) {
            controller1.loadingEditQualification.value = false;
            controller1.highestQualificationSelected =
                controller1.modelList[widget.index!].courseLevel;

            controller1.streamSelected =
                controller1.modelList[widget.index!].streamName ?? "";
            controller1.streamSelectedID = getNUllChecker(controller1
                        .modelList[widget.index!].streamId
                        .toString()) ==
                    false
                ? controller1.modelList[widget.index!].streamId.toString()
                : "";
            controller1.educationStatusSelected =
                controller1.modelList[widget.index!].educationStatus ?? "";
            controller1.yearOfPassingSelected =
                controller1.modelList[widget.index!].yearOfPassing ?? "";
            controller1.countrySelected =
                controller1.modelList[widget.index!].countryName;
            Get.find<QualificationDetailsController>().loadingEdit.value = 1;
            // cgpa.text = double.parse(controller1.modelList[index!].percentage.toString()) /;
            controller1.getEdit(
                controller1.modelList[widget.index!].countryId!,
                controller1.modelList[widget.index!].stateName,
                controller1.modelList[widget.index!].stateId,
                controller1.modelList[widget.index!].cityName,
                controller1.modelList[widget.index!].cityId,
                controller1.modelList[widget.index!].affiliationName,
                controller1.modelList[widget.index!].affiliationId,
                controller1.modelList[widget.index!].universityName,
                controller1.modelList[widget.index!].passingInstId);
          }
        }
      } catch (e) {
        print(e.toString());
      }

      return controller1.loadingEdit.value != 1
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: TextButton(
                          onPressed: () {
                            if (controller1.loadingViewQualification.value ==
                                true) {
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(
                          controller1.loadingHighestQualification.value,
                          controller1.highestQualificationSelected,
                          controller1.highestQualificationList),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingHighestQualification.value,
                          controller1.highestQualificationSelected,
                          controller1.highestQualificationList),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackHighestQualification,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      controller: QualificationWidget.qualificationName,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(controller1.loadingStream.value,
                          controller1.streamSelected, controller1.streamList),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingStream.value,
                          controller1.streamSelected,
                          controller1.streamList),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackStream,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(
                          controller1.loadingEducationStatus.value,
                          controller1.educationStatusSelected,
                          controller1.educationStatusList),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingEducationStatus.value,
                          controller1.educationStatusSelected,
                          controller1.educationStatusList),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackEducationStatus,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(
                          controller1.loadingyearOfpassing.value,
                          controller1.yearOfPassingSelected,
                          controller1.yearofPassing),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingyearOfpassing.value,
                          controller1.yearOfPassingSelected,
                          controller1.yearofPassing),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackYearOfPassing,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: QualificationWidget.cgpa,
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
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
                      onChanged: (value) {
                        try {
                          if (getNUllChecker(QualificationWidget.cgpa.text) ==
                                  false &&
                              getNUllChecker(
                                      QualificationWidget.multiplier.text) ==
                                  false) {
                            QualificationWidget.percentage.text = (double.parse(
                                        QualificationWidget.cgpa.text) *
                                    double.parse(
                                        QualificationWidget.multiplier.text))
                                .toString();
                          }
                        } catch (e) {}

                        setState(() {});
                      },
                      validator: (value) {
                        if (getNUllChecker(value) == false) {
                          if (double.parse(value!) > 11) {
                            return 'CGPA in Between 0 to 10';
                          } else {
                            return null;
                          }
                        } else {
                          return "CGPA in Between 0 to 10";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: QualificationWidget.multiplier,
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
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
                      onChanged: (value) {
                        try {
                          if (getNUllChecker(QualificationWidget.cgpa.text) ==
                                  false &&
                              getNUllChecker(
                                      QualificationWidget.multiplier.text) ==
                                  false) {
                            QualificationWidget.percentage.text = (double.parse(
                                        QualificationWidget.cgpa.text) *
                                    double.parse(
                                        QualificationWidget.multiplier.text))
                                .toString();
                          }
                        } catch (e) {}

                        setState(() {});
                      },
                      validator: (value) {
                        if (getNUllChecker(value) == false) {
                          if (double.parse(value!) > 11) {
                            return 'Multiplier in Between 0 to 10';
                          } else {
                            return null;
                          }
                        } else {
                          return "Multiplier in Between 0 to 10";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: QualificationWidget.percentage,
                      keyboardType: TextInputType.number,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
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
                      validator: (value) {
                        if (getNUllChecker(value) == false) {
                          if (double.parse(value!) > 101) {
                            return 'Percentage in Between 0 to 100';
                          } else {
                            return null;
                          }
                        } else {
                          return "Percentage in Between 0 to 100";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(controller1.loadingCountry.value,
                          controller1.countrySelected, controller1.countryList),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingCountry.value,
                          controller1.countrySelected,
                          controller1.countryList),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackCountry,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(controller1.loadingState.value,
                          controller1.stateSelected, controller1.stateList),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingState.value,
                          controller1.stateSelected,
                          controller1.stateList),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackState,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(controller1.loadingCity.value,
                          controller1.citySelected, controller1.cityList),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingCity.value,
                          controller1.citySelected,
                          controller1.cityList),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackCity,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(
                          controller1.loadingAffiliation.value,
                          controller1.affiliationNameSelected,
                          controller1.affiliationList),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingAffiliation.value,
                          controller1.affiliationNameSelected,
                          controller1.affiliationList),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackAffiliation,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: getDropdownModel(
                          controller1.loadingInstitution.value,
                          controller1.institutionSelected,
                          controller1.institutionList),
                      initialSelectedValue: getSelectedDropDown(
                          controller1.loadingInstitution.value,
                          controller1.institutionSelected,
                          controller1.institutionList),
                      choosefieldtype: false,
                      callbackFunction: widget.callbackInstitution,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      controller: QualificationWidget.reApper,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
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
                  if (widget.updateForEdit == true)
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
                                    foregroundColor: ThemeConstants.bluecolor,
                                    elevation: 0.0,
                                    backgroundColor:
                                        ThemeConstants.bluecolor, // foreground
                                  ),
                                  onPressed: () async {
                                    if (controller1
                                            .highestQualificationSelected ==
                                        null) {
                                      getToast(
                                          "Please select Highest Qualification");
                                    } else if (QualificationWidget
                                        .qualificationName.text.isEmpty) {
                                      getToast(
                                          "Please enter Qualification Name ");
                                    } else if (controller1.streamSelected ==
                                        null) {
                                      getToast("Please select Stream");
                                    } else if (controller1
                                            .educationStatusSelected ==
                                        null) {
                                      getToast(
                                          "Please select education status");
                                    } else if (controller1.countrySelected ==
                                        null) {
                                      getToast("Please select Country");
                                    } else {
                                      controller1.modelList
                                          .add(QualificationDetailsViewModel(
                                        grade: QualificationWidget.cgpa.text,
                                        multiplier:
                                            QualificationWidget.multiplier.text,
                                        applicantType: "",
                                        qualificationId: controller1
                                            .highestQualificationSelectedID
                                            .toString(),
                                        streamId: controller1.streamSelectedID
                                            .toString(),
                                        countryId: controller1.countrySelectedID
                                            .toString(),
                                        cityId: controller1.citySelectedID
                                            .toString(),
                                        stateId: controller1.stateSelectedID
                                            .toString(),
                                        affiliationId: controller1
                                            .affiliationCodeSelected
                                            .toString(),
                                        passingInstId: controller1
                                            .institutionSelectedID
                                            .toString(),
                                        educationStatus:
                                            controller1.educationStatusSelected,
                                        yearOfPassing:
                                            controller1.yearOfPassingSelected,
                                        percentage:
                                            QualificationWidget.percentage.text,
                                        reapperCount:
                                            QualificationWidget.reApper.text,
                                        courseLevel: controller1
                                            .highestQualificationSelected,
                                        streamName: controller1.streamSelected,
                                        countryName:
                                            controller1.countrySelected,
                                        stateName: controller1.stateSelected,
                                        cityName: controller1.citySelected,
                                        affiliationName:
                                            controller1.affiliationNameSelected,
                                        universityName:
                                            controller1.institutionSelected,
                                        courseName: QualificationWidget
                                            .qualificationName.text,
                                      ));
                                      controller1.updateQualification(
                                          Get.find<BaseController>()
                                              .model1
                                              .id
                                              .toString());
                                      // controller1.updteForEdit.value = false;
                                      controller1.update();
                                    }
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
                  if (widget.updateForEdit == false)
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
                                    foregroundColor: ThemeConstants.bluecolor,
                                    elevation: 0.0,
                                    backgroundColor:
                                        ThemeConstants.bluecolor, // foreground
                                  ),
                                  onPressed: () async {
                                    if (controller1
                                            .highestQualificationSelected ==
                                        null) {
                                      getToast(
                                          "Please select Highest Qualification");
                                    } else if (QualificationWidget
                                        .qualificationName.text.isEmpty) {
                                      getToast(
                                          "Please enter Qualification Name ");
                                    } else if (controller1.streamSelected ==
                                        null) {
                                      getToast("Please select Stream");
                                    } else if (controller1
                                            .educationStatusSelected ==
                                        null) {
                                      getToast(
                                          "Please select education status");
                                    } else if (controller1.countrySelected ==
                                        null) {
                                      getToast("Please select Country");
                                    } else {
                                      controller1.modelList
                                          .add(QualificationDetailsViewModel(
                                        grade: QualificationWidget.cgpa.text,
                                        multiplier:
                                            QualificationWidget.multiplier.text,
                                        applicantType: "",
                                        qualificationId: controller1
                                            .highestQualificationSelectedID
                                            .toString(),
                                        streamId: controller1.streamSelectedID
                                            .toString(),
                                        countryId: controller1.countrySelectedID
                                            .toString(),
                                        cityId: controller1.citySelectedID
                                            .toString(),
                                        stateId: controller1.stateSelectedID
                                            .toString(),
                                        affiliationId: controller1
                                            .affiliationCodeSelected
                                            .toString(),
                                        passingInstId: controller1
                                            .institutionSelectedID
                                            .toString(),
                                        educationStatus:
                                            controller1.educationStatusSelected,
                                        yearOfPassing:
                                            controller1.yearOfPassingSelected,
                                        percentage:
                                            QualificationWidget.percentage.text,
                                        reapperCount:
                                            QualificationWidget.reApper.text,
                                        courseLevel: controller1
                                            .highestQualificationSelected,
                                        streamName: controller1.streamSelected,
                                        countryName:
                                            controller1.countrySelected,
                                        stateName: controller1.stateSelected,
                                        cityName: controller1.citySelected,
                                        affiliationName:
                                            controller1.affiliationNameSelected,
                                        universityName:
                                            controller1.institutionSelected,
                                        courseName: QualificationWidget
                                            .qualificationName.text,
                                      ));
                                      controller1.updateQualification(
                                          Get.find<BaseController>()
                                              .model1
                                              .id
                                              .toString());
                                      controller1.updteForEdit.value = false;
                                      controller1.update();
                                    }
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
                    height: MediaQuery.of(context).viewInsets.bottom,
                  )
                ],
              ),
            )
          : Center(
              child: getLoading(context),
            );
    });
  }

  //Function
  List getDropdownModel(bool loading, String? selected, List model) {
    if (loading == true) {
      return model;
    } else {
      return ["No data"];
    }
  }

  String getSelectedDropDown(bool loading, String? selected, List model) {
    if (loading == true && model.isNotEmpty) {
      if (selected == null) {
        return model[0].toString();
      } else {
        return selected;
      }
    } else {
      return "No data";
    }
  }
}
