import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
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
        controller1.countrySelected = controller1.modelList[index!].countryName;
        Get.find<QualificationDetailsController>().loadingEdit.value = 1;
        // cgpa.text = double.parse(controller1.modelList[index!].percentage.toString()) /;
        controller1.getEdit(
            controller1.modelList[index!].countryId!,
            controller1.modelList[index!].stateName,
            controller1.modelList[index!].stateId,
            controller1.modelList[index!].cityName,
            controller1.modelList[index!].cityId,
            controller1.modelList[index!].affiliationName,
            controller1.modelList[index!].affiliationId,
            controller1.modelList[index!].universityName,
            controller1.modelList[index!].passingInstId);
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
                      callbackFunction: callbackHighestQualification,
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
                      controller: qualificationName,
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
                      callbackFunction: callbackStream,
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
                      callbackFunction: callbackEducationStatus,
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
                      callbackFunction: callbackYearOfPassing,
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
                    child: Form(
                      key: controller1.CGPAKey,
                      child: TextFormField(
                        controller: cgpa,
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
                          if (controller1.CGPAKey.currentState!.validate()) {
                            controller1.CGPAKey.currentState!.save();
                          }
                          if (getNUllChecker(cgpa.text) == false &&
                              getNUllChecker(multiplier.text) == false) {
                            percentage.text = (double.parse(cgpa.text) *
                                    double.parse(multiplier.text))
                                .toString();
                          }
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
                    child: Form(
                      key: controller1.MultiplierKey,
                      child: TextFormField(
                        controller: multiplier,
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
                          if (controller1.MultiplierKey.currentState!
                              .validate()) {
                            controller1.MultiplierKey.currentState!.save();
                          }
                          if (getNUllChecker(cgpa.text) == false &&
                              getNUllChecker(multiplier.text) == false) {
                            percentage.text = (double.parse(cgpa.text) *
                                    double.parse(multiplier.text))
                                .toString();
                          }
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
                    child: Form(
                      key: controller1.PercentageKey,
                      child: TextFormField(
                        controller: percentage,
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
                        onChanged: (value) {
                          if (controller1.PercentageKey.currentState!
                              .validate()) {
                            controller1.PercentageKey.currentState!.save();
                          }
                        },
                        validator: (value) {
                          if (getNUllChecker(value) == false) {
                            if (double.parse(value!) > 11) {
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
                      callbackFunction: callbackCountry,
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
                      callbackFunction: callbackState,
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
                      callbackFunction: callbackCity,
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
                      callbackFunction: callbackAffiliation,
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
                      callbackFunction: callbackInstitution,
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
                      controller: reApper,
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
                                    } else if (qualificationName.text.isEmpty) {
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
                                        grade: cgpa.text,
                                        multiplier: multiplier.text,
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
                                        percentage: percentage.text,
                                        reapperCount: reApper.text,
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
                                        courseName: qualificationName.text,
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
                                    } else if (qualificationName.text.isEmpty) {
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
                                        grade: cgpa.text,
                                        multiplier: multiplier.text,
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
                                        percentage: percentage.text,
                                        reapperCount: reApper.text,
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
                                        courseName: qualificationName.text,
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
                  const SizedBox(
                    height: 120,
                  )
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
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
    if (loading == true) {
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
