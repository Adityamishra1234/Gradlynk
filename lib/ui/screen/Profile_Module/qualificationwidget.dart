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

  @override
  State<QualificationWidget> createState() => _QualificationWidgetState();
}

class _QualificationWidgetState extends State<QualificationWidget> {
  var controller = Get.put(QualificationDetailsController());
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      // try {
      //   if (widget.index != null) {
      //     if (widget.updateForEdit == false) {
      //       QualificationWidget.qualificationName.text =
      //           controller.modelList[widget.index!].courseName ?? "";
      //       QualificationWidget.multiplier.text =
      //           controller.modelList[widget.index!].multiplier ?? "";
      //       QualificationWidget.percentage.text =
      //           controller.modelList[widget.index!].percentage ?? "";
      //       QualificationWidget.reApper.text =
      //           controller.modelList[widget.index!].reapperCount ?? "";
      //     }
      //     if (widget.updateForEdit == false &&
      //         controller.loadingEditQualification.value == true) {
      //       controller.loadingEditQualification.value = false;
      //       controller.highestQualificationSelected =
      //           controller.modelList[widget.index!].courseLevel;

      //       controller.streamSelected =
      //           controller.modelList[widget.index!].streamName ?? "";
      //       controller.streamSelectedID = getNUllChecker(controller
      //                   .modelList[widget.index!].streamId
      //                   .toString()) ==
      //               false
      //           ? controller.modelList[widget.index!].streamId.toString()
      //           : "";
      //       controller.educationStatusSelected =
      //           controller.modelList[widget.index!].educationStatus ?? "";
      //       controller.yearOfPassingSelected =
      //           controller.modelList[widget.index!].yearOfPassing ?? "";
      //       controller.countrySelected =
      //           controller.modelList[widget.index!].countryName;
      //       Get.find<QualificationDetailsController>().loadingEdit.value = 1;
      //       // cgpa.text = double.parse(controller.modelList[index!].percentage.toString()) /;
      //       // controller.getEdit(
      //       //     controller.modelList[widget.index!].countryId!,
      //       //     controller.modelList[widget.index!].stateName,
      //       //     controller.modelList[widget.index!].stateId,
      //       //     controller.modelList[widget.index!].cityName,
      //       //     controller.modelList[widget.index!].cityId,
      //       //     controller.modelList[widget.index!].affiliationName,
      //       //     controller.modelList[widget.index!].affiliationId,
      //       //     controller.modelList[widget.index!].universityName,
      //       //     controller.modelList[widget.index!].passingInstId);
      //     }
      //   }
      // } catch (e) {
      //   print(e.toString());
      // }

      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextButton(
                    onPressed: () {
                      if (controller.loadingViewQualification.value == true) {
                        controller.setaddedQualification(true);
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
                model: getDropdownModel(
                    controller.loadingHighestQualification.value,
                    controller.highestQualificationSelected,
                    controller.highestQualificationList),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingHighestQualification.value,
                    controller.highestQualificationSelected,
                    controller.highestQualificationList),
                choosefieldtype: false,
                callbackFunction: widget.callbackHighestQualification,
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
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller:
                      QualificationDetailsController.qualificationName.value,
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
                model: getDropdownModel(controller.loadingStream.value,
                    controller.streamSelected, controller.streamList),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingStream.value,
                    controller.streamSelected,
                    controller.streamList),
                choosefieldtype: false,
                callbackFunction: widget.callbackStream,
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
                model: getDropdownModel(
                    controller.loadingEducationStatus.value,
                    controller.educationStatusSelected,
                    controller.educationStatusList),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingEducationStatus.value,
                    controller.educationStatusSelected,
                    controller.educationStatusList),
                choosefieldtype: false,
                callbackFunction: widget.callbackEducationStatus,
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
                model: getDropdownModel(controller.loadingyearOfpassing.value,
                    controller.yearOfPassingSelected, controller.yearofPassing),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingyearOfpassing.value,
                    controller.yearOfPassingSelected,
                    controller.yearofPassing),
                choosefieldtype: false,
                callbackFunction: widget.callbackYearOfPassing,
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
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: QualificationDetailsController.cgpa.value,
                  keyboardType: TextInputType.number,
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
                  onChanged: (value) {
                    try {
                      if (getNUllChecker(QualificationDetailsController
                                  .cgpa.value.text) ==
                              false &&
                          getNUllChecker(QualificationDetailsController
                                  .multiplier.value.text) ==
                              false) {
                        QualificationDetailsController.percentage.value.text =
                            (double.parse(QualificationDetailsController
                                        .cgpa.value.text) *
                                    double.parse(QualificationDetailsController
                                        .multiplier.value.text))
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
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: QualificationDetailsController.multiplier.value,
                  keyboardType: TextInputType.number,
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
                  onChanged: (value) {
                    try {
                      if (getNUllChecker(QualificationDetailsController
                                  .cgpa.value.text) ==
                              false &&
                          getNUllChecker(QualificationDetailsController
                                  .multiplier.value.text) ==
                              false) {
                        QualificationDetailsController.percentage.value.text =
                            (double.parse(QualificationDetailsController
                                        .cgpa.value.text) *
                                    double.parse(QualificationDetailsController
                                        .multiplier.value.text))
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
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: QualificationDetailsController.percentage.value,
                  keyboardType: TextInputType.number,
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
                model: getDropdownModel(controller.loadingCountry.value,
                    controller.countrySelected, controller.countryList),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingCountry.value,
                    controller.countrySelected,
                    controller.countryList),
                choosefieldtype: false,
                callbackFunction: widget.callbackCountry,
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
                model: getDropdownModel(controller.loadingState.value,
                    controller.stateSelected, controller.stateList),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingState.value,
                    controller.stateSelected,
                    controller.stateList),
                choosefieldtype: false,
                callbackFunction: widget.callbackState,
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
                model: getDropdownModel(controller.loadingCity.value,
                    controller.citySelected, controller.cityList),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingCity.value,
                    controller.citySelected,
                    controller.cityList),
                choosefieldtype: false,
                callbackFunction: widget.callbackCity,
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
                model: getDropdownModel(
                    controller.loadingAffiliation.value,
                    controller.affiliationNameSelected,
                    controller.affiliationList),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingAffiliation.value,
                    controller.affiliationNameSelected,
                    controller.affiliationList),
                choosefieldtype: false,
                callbackFunction: widget.callbackAffiliation,
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
                model: getDropdownModel(controller.loadingInstitution.value,
                    controller.institutionSelected, controller.institutionList),
                initialSelectedValue: getSelectedDropDown(
                    controller.loadingInstitution.value,
                    controller.institutionSelected,
                    controller.institutionList),
                choosefieldtype: false,
                callbackFunction: widget.callbackInstitution,
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
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: QualificationDetailsController.reApper.value,
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
                              if (controller.highestQualificationSelected ==
                                  null) {
                                getToast("Please select Highest Qualification");
                              } else if (QualificationDetailsController
                                  .qualificationName.value.text.isEmpty) {
                                getToast("Please enter Qualification Name ");
                              } else if (controller.streamSelected == null) {
                                getToast("Please select Stream");
                              } else if (controller.educationStatusSelected ==
                                  null) {
                                getToast("Please select education status");
                              } else if (controller.countrySelected == null) {
                                getToast("Please select Country");
                              } else {
                                controller.modelList
                                    .add(QualificationDetailsViewModel(
                                  grade: QualificationDetailsController
                                      .cgpa.value.text,
                                  multiplier: QualificationDetailsController
                                      .multiplier.value.text,
                                  applicantType: "",
                                  qualificationId: controller
                                      .highestQualificationSelectedID
                                      .toString(),
                                  streamId:
                                      controller.streamSelectedID.toString(),
                                  countryId:
                                      controller.countrySelectedID.toString(),
                                  cityId: controller.citySelectedID.toString(),
                                  stateId:
                                      controller.stateSelectedID.toString(),
                                  affiliationId: controller
                                      .affiliationCodeSelected
                                      .toString(),
                                  passingInstId: controller
                                      .institutionSelectedID
                                      .toString(),
                                  educationStatus:
                                      controller.educationStatusSelected,
                                  yearOfPassing:
                                      controller.yearOfPassingSelected,
                                  percentage: QualificationDetailsController
                                      .percentage.value.text,
                                  reapperCount: QualificationDetailsController
                                      .reApper.value.text,
                                  courseLevel:
                                      controller.highestQualificationSelected,
                                  streamName: controller.streamSelected,
                                  countryName: controller.countrySelected,
                                  stateName: controller.stateSelected,
                                  cityName: controller.citySelected,
                                  affiliationName:
                                      controller.affiliationNameSelected,
                                  universityName:
                                      controller.institutionSelected,
                                  courseName: QualificationDetailsController
                                      .qualificationName.value.text,
                                ));
                                controller.updateQualification(
                                    Get.find<BaseController>()
                                        .model1
                                        .id
                                        .toString());
                                // controller.updteForEdit.value = false;
                                controller.update();
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
                              if (controller.highestQualificationSelected ==
                                  null) {
                                getToast("Please select Highest Qualification");
                              } else if (QualificationDetailsController
                                  .qualificationName.value.text.isEmpty) {
                                getToast("Please enter Qualification Name ");
                              } else if (controller.streamSelected == null) {
                                getToast("Please select Stream");
                              } else if (controller.educationStatusSelected ==
                                  null) {
                                getToast("Please select education status");
                              } else if (controller.countrySelected == null) {
                                getToast("Please select Country");
                              } else {
                                QualificationDetailsViewModel model =
                                    QualificationDetailsViewModel();
                                model = QualificationDetailsViewModel(
                                  grade: QualificationDetailsController
                                      .cgpa.value.text,
                                  multiplier: QualificationDetailsController
                                      .multiplier.value.text,
                                  applicantType: "",
                                  qualificationId: controller
                                      .highestQualificationSelectedID
                                      .toString(),
                                  streamId:
                                      controller.streamSelectedID.toString(),
                                  countryId:
                                      controller.countrySelectedID.toString(),
                                  cityId: controller.citySelectedID.toString(),
                                  stateId:
                                      controller.stateSelectedID.toString(),
                                  affiliationId: controller
                                      .affiliationCodeSelected
                                      .toString(),
                                  passingInstId: controller
                                      .institutionSelectedID
                                      .toString(),
                                  educationStatus:
                                      controller.educationStatusSelected,
                                  yearOfPassing:
                                      controller.yearOfPassingSelected,
                                  percentage: QualificationDetailsController
                                      .percentage.value.text,
                                  reapperCount: QualificationDetailsController
                                      .reApper.value.text,
                                  courseLevel:
                                      controller.highestQualificationSelected,
                                  streamName: controller.streamSelected,
                                  countryName: controller.countrySelected,
                                  stateName: controller.stateSelected,
                                  cityName: controller.citySelected,
                                  affiliationName:
                                      controller.affiliationNameSelected,
                                  universityName:
                                      controller.institutionSelected,
                                  courseName: QualificationDetailsController
                                      .qualificationName.value.text,
                                );
                                controller.modelList[widget.index!] = model;
                                controller.updateQualification(
                                    Get.find<BaseController>()
                                        .model1
                                        .id
                                        .toString());
                                controller.updteForEdit.value = false;
                                controller.update();
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
      );
    }, onLoading: getLoading(context));
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
