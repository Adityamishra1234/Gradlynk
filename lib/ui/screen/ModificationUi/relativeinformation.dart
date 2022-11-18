import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/relativeinformation.dart';
import 'package:studentpanel/ui/controllers/reviewshortlistcontroller.dart';
import 'package:studentpanel/ui/screen/ModificationUi/relativeinformationview.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class RelativeInformation extends StatelessWidget {
  RelativeInformation({Key? key}) : super(key: key);
  var controller = Get.put(RelativeInformationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RelativeInformationController>(
        builder: (_) => _.viewDetails.value == true
            ? RelativeInformationView(
                callbackAddRelativeInfo: callbackAddRelativeInfro,
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
                            callbackFunction: callback,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Country Name",
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Citizenship Status",
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Relation",
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Relative Email",
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
                                  onPressed: () async {},
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

  callback(varTopic) {}
  callbackAddRelativeInfro(varTopic) {
    controller.setViewDetails(false);
  }
}
