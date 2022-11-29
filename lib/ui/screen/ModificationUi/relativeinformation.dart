import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/relativeinformation.dart';
import 'package:studentpanel/ui/models/realtion.dart';
import 'package:studentpanel/ui/screen/ModificationUi/relativeinformationview.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class RelativeInformation extends StatelessWidget {
  RelativeInformation({Key? key}) : super(key: key);
  var controller = Get.put(RelativeInformationController());

  final realtiveEmail = TextEditingController();
  final contactOfRelative = TextEditingController();
  final addresOfrelative = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RelativeInformationController>(
        builder: (_) => _.viewDetails.value == true
            ? RelativeInformationView(
                callbackAddRelativeInfo: callbackAddRelativeInfro,
                model: controller.modelList,
              )
            : Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 25,
                        child: TextButton(
                            onPressed: () {
                              _.setViewDetails(true);
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "View Details",
                              fontSize: 12,
                              textColor: ThemeConstants.orangeColor,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text:
                                  "Any relatives residing in the Interested Country",
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
                            callbackFunction:
                                callbackAnyRelativeCountryInterested,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Country Name",
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
                            model: _.loadingCountry.value == true
                                ? _.countryList
                                : ["No data"],
                            initialSelectedValue: _.loadingCountry.value == true
                                ? _.countryList[0]
                                : "No data",
                            choosefieldtype: false,
                            callbackFunction: callbackCountry,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Citizenship Status",
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
                            model: _.loadingCitizen.value == true
                                ? _.citizenShipStatus
                                : ["No data"],
                            initialSelectedValue: _.loadingCitizen.value == true
                                ? _.citizenShipStatus[0]
                                : "No data",
                            choosefieldtype: false,
                            callbackFunction: callbackCitizenShip,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Relation",
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
                            model: _.loadingRealtion.value == true
                                ? _.realtion
                                : ["No data"],
                            initialSelectedValue:
                                _.loadingRealtion.value == true
                                    ? _.realtion[0]
                                    : "No data",
                            choosefieldtype: false,
                            callbackFunction: callbackRelation,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Relative Email",
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
                            controller: realtiveEmail,
                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom +
                                        30),
                            decoration: InputDecoration(
                              hintText: "Enter Relative Email",
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Contact Of Relative",
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
                            controller: contactOfRelative,
                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom +
                                        30),
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Address Of Relative",
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
                            controller: addresOfrelative,
                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom +
                                        30),
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
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Padding(
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
                                    //                                    int? id,
                                    // String? anyRelativeCountryInterested,
                                    // String? citizenshipStatus,
                                    // int? relativeCountry,
                                    // String? relationWithRelative,
                                    // String? relativeEmailId,
                                    // int? contactOfRelative,
                                    // String? addressOfRelative,
                                    // int? applicantType,
                                    // int? isActive,
                                    // String? countryName,
                                    controller.modelList.add(RealtionModel(
                                      countryName:
                                          controller.countryNameSelected,
                                      relationWithRelative:
                                          controller.relationSelected,
                                      id: "",
                                      anyRelativeCountryInterested: controller
                                          .anyRelativeCountryInterestedSelected,
                                      citizenshipStatus:
                                          controller.citizenShipStatusSelected,
                                      relativeCountry: int.parse(
                                          controller.countryNameCodeSelected!),
                                      relativeEmailId: realtiveEmail.text,
                                      contactOfRelative:
                                          int.parse(contactOfRelative.text),
                                      addressOfRelative: addresOfrelative.text,
                                    ));

                                    controller.updateRelativeInformation(
                                        "78623", "1");
                                  },
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Add",
                                    textColor: ThemeConstants.whitecolor,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
  }

  callbackAnyRelativeCountryInterested(varTopic) {
    if (varTopic == "Yes") {
      controller.anyRelativeCountryInterestedSelected = "1";
    } else {
      controller.anyRelativeCountryInterestedSelected = "2";
    }
    controller.update();
  }

  callbackCountry(varTopic) {
    controller.countryNameSelected = varTopic;
    for (var i = 0; i < controller.countryList.length; i++) {
      if (controller.countryList[i] == varTopic) {
        controller.countryNameCodeSelected = controller.countryCode[i];
      }
    }
    controller.update();
  }

  callbackCitizenShip(varTopic) {
    controller.citizenShipStatusSelected = varTopic;
    controller.update();
  }

  callbackRelation(varTopic) {
    controller.relationSelected = varTopic;
    controller.update();
  }

  callbackAddRelativeInfro(varTopic) {
    controller.setViewDetails(false);
  }
}
