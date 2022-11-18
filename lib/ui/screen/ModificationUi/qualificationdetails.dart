import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/qualificationdetails.dart';
import 'package:studentpanel/ui/screen/ModificationUi/qualificationdetailsview.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

import 'package:studentpanel/widgets/customdropdownsingle.dart';

class QualificationDetailsCopy extends StatelessWidget {
  QualificationDetailsCopy({Key? key}) : super(key: key);
  var controller = Get.put(QualificationDetailsController());
  String? highestQualificationSelected,
      streamSelected,
      educationStatus,
      yearOfPassing,
      countrySelected,
      stateSelected,
      citySelected,
      institutionSelected;
  int? highestQualificationSelectedID,
      streamSelectedID,
      educationStatusID,
      yearOfPassingID,
      countrySelectedID,
      stateSelectedID,
      citySelectedID,
      institutionSelectedID;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QualificationDetailsController>(
        builder: (controller1) => controller1.addedQualification.value == true
            ? QualificationDetailView(
                callbackAddQualification: callback,
                model: controller1.qualificationDetailsView,
              )
            : SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: TextButton(
                            onPressed: () {
                              if (controller1.loadingViewQualification.value ==
                                  true) controller1.setaddedQualification(true);
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: CustomDropDownSingle(
                        model: controller1.loadingHighestQualification.value ==
                                true
                            ? controller1.highestQualificationList
                            : ["No data"],
                        initialSelectedValue:
                            controller1.loadingHighestQualification.value ==
                                    true
                                ? controller1.highestQualificationList[0]
                                : "No data",
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
                        initialSelectedValue:
                            controller1.loadingStream.value == true
                                ? controller1.streamList[0]
                                : "No data",
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
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: CustomDropDownSingle(
                        model: const [
                          "Complete",
                          "Pursuing",
                          "Awaiting Results"
                        ],
                        initialSelectedValue: "Complete",
                        choosefieldtype: false,
                        callbackFunction: callback,
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
                        model: ["1", "2", "3"],
                        initialSelectedValue: "1",
                        choosefieldtype: false,
                        callbackFunction: callback,
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
                      child: TextField(
                        textInputAction: TextInputAction.next,
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
                      child: TextField(
                        textInputAction: TextInputAction.next,
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
                      child: TextField(
                        textInputAction: TextInputAction.next,
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
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Country of Education",
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
                        initialSelectedValue:
                            controller1.loadingCountry.value == true
                                ? controller1.countryList[0]
                                : "No data",
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
                        model: controller1.loadingState.value == true
                            ? controller1.stateList
                            : ["No data"],
                        initialSelectedValue:
                            controller1.loadingState.value == true
                                ? controller1.stateList[0]
                                : "No data",
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
                        model: controller1.loadingCity.value == true
                            ? controller1.cityList
                            : ["No data"],
                        initialSelectedValue:
                            controller1.loadingCity.value == true
                                ? controller1.cityList[0]
                                : "No data",
                        choosefieldtype: false,
                        callbackFunction: callback,
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
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "name of the Institution",
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
                        textInputAction: TextInputAction.next,
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
                                    primary:
                                        ThemeConstants.bluecolor, // background
                                    onPrimary:
                                        ThemeConstants.bluecolor, // foreground
                                  ),
                                  onPressed: () async {
                                    // Api call
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
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ],
                ),
              ));
  }

  // Funcation
  callback(varTopic) {
    controller.setaddedQualification(false);
  }

  callbackHighestQualification(varTopic) {
    for (var i = 0; i < controller.highestQualificationList.length; i++) {
      if (controller.highestQualificationList[i] == varTopic) {
        highestQualificationSelected = controller.highestQualificationList[i];
        highestQualificationSelectedID =
            int.parse(controller.highestQualificationCode[i]);
      }
    }
  }

  callbackStream(varTopic) {
    for (var i = 0; i < controller.streamList.length; i++) {
      if (controller.streamList[i] == varTopic) {
        highestQualificationSelected = controller.streamList[i];
        highestQualificationSelectedID =
            int.parse(controller.streamCode[i].toString());
      }
    }
  }

  // callbackEducationStatus(varTopic) {
  //   for (var i = 0; i < controller.streamList.length; i++) {
  //     if (controller.streamList[i] == varTopic) {
  //       highestQualificationSelected = controller.streamList[i];
  //       highestQualificationSelectedID =
  //           int.parse(controller.streamCode[i].toString());
  //     }
  //   }
  // }

  callbackYearOfPassing(varTopic) {}
  callbackCountry(varTopic) {
    for (var i = 0; i < controller.countryList.length; i++) {
      if (controller.countryList[i] == varTopic) {
        countrySelected = controller.countryList[i];
        countrySelectedID = int.parse(controller.countryCode[i]);
      }
    }
    controller.getState(countrySelectedID.toString());
    controller.getAffiliation(countrySelectedID!);
  }

  callbackState(varTopic) {
    for (var i = 0; i < controller.stateList.length; i++) {
      if (controller.stateList[i] == varTopic) {
        stateSelected = controller.stateList[i];
        stateSelectedID = int.parse(controller.stateCode[i]);
      }
    }
    controller.getCity(stateSelectedID!);
  }

  callbackCity(varTopic) {
    for (var i = 0; i < controller.cityList.length; i++) {
      if (controller.cityList == varTopic) {
        citySelected = controller.cityList[i];
        citySelectedID = controller.cityCode[i];
      }
    }
    controller.geInstitution(citySelectedID!);
  }

  callbackInstitution(varTopic) {}
}
