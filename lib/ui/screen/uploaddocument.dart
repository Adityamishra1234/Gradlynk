// ignore_for_file: deprecated_member_use
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/uploaddocumentcontroller.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';
import 'package:studentpanel/widgets/customexpansionplanelist.dart';
import 'package:studentpanel/widgets/test.dart';

class UploadDocument extends StatelessWidget {
  UploadDocument({Key? key}) : super(key: key);
  static const routeNamed = '/UploadDocument';

  var controller = Get.put(UploadDocumentController());

  callback(varTopic) {
    controller.setLoadingHighestQualification(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(UploadDocument.routeNamed),
        drawer: CustomDrawer(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: CustomAutoSizeTextMontserrat(
                text: "My Document",
                fontSize: 18,
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Document Type",
                  mandatory: true,
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomDropDownSingle(
              model: const ["Male", "Female", "Other"],
              callbackFunction: callbackFunction,
              initialSelectedValue: "Male",
              choosefieldtype: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: "Document Name",
                  mandatory: true,
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomDropDownSingle(
              model: const ["Male", "Female", "Other"],
              callbackFunction: callbackFunction,
              initialSelectedValue: "Male",
              choosefieldtype: false,
            ),
            const SizedBox(
              height: 10,
            ),
            ConfigurableExpansionTile(
              header: SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                height: 40,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Offer Details",
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              children: [
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Aadhar Card",
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.GreenColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.GreenColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.bluecolor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Download",
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              textColor: ThemeConstants.bluecolor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.orangeColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.orangeColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Passport",
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.GreenColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.GreenColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.bluecolor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Download",
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              textColor: ThemeConstants.bluecolor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.orangeColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.orangeColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Previous Passport 1",
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.GreenColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.GreenColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.bluecolor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Download",
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              textColor: ThemeConstants.bluecolor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.orangeColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.orangeColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: ThemeConstants.TextColor,
            ),
            ConfigurableExpansionTile(
              header: SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                height: 40,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Offer Details",
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              children: [
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Aadhar Card",
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.GreenColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.GreenColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.bluecolor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Download",
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              textColor: ThemeConstants.bluecolor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.orangeColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.orangeColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Passport",
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.GreenColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.GreenColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.bluecolor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Download",
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              textColor: ThemeConstants.bluecolor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.orangeColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.orangeColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Previous Passport 1",
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.GreenColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.GreenColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.bluecolor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Download",
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              textColor: ThemeConstants.bluecolor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.orangeColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Upload",
                              fontWeight: FontWeight.w500,
                              textColor: ThemeConstants.orangeColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: ThemeConstants.TextColor,
            ),
          ],
        ));
  }

  //Function
  callbackFunction(data) {}
}
