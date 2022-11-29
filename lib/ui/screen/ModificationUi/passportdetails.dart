import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/passport.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class PassportDetails extends StatelessWidget {
  PassportDetails({Key? key}) : super(key: key);
  var controller = Get.put(PassportController());

  final passportNumber = TextEditingController();
  final dateofIssuse = TextEditingController();
  final expireDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassportController>(
        builder: (_) => ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Row(
                    children: [
                      CustomAutoSizeTextMontserrat(
                        text: "Passport Avaliable",
                        mandatory: true,
                        textColor: ThemeConstants.TextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      if (_.editSave.value == true)
                        TextButton(
                            onPressed: () {
                              controller.editSave.value = false;
                              controller.update();
                              updatePassport();
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "save",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              textColor: ThemeConstants.bluecolor,
                            )),
                      if (_.editSave.value == false)
                        TextButton(
                            onPressed: () {
                              controller.editSave.value = true;
                              controller.update();
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "edit",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              textColor: ThemeConstants.bluecolor,
                            ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: CustomDropDownSingle(
                    model: const ["Yes", "No"],
                    initialSelectedValue: "No",
                    choosefieldtype: controller.editSave.value == false,
                    callbackFunction: callbackPassportAvaliables,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: "Citizen of",
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
                        : ["No Data"],
                    initialSelectedValue: _.loadingCountry.value == true
                        ? _.countryList[0]
                        : "No Data",
                    choosefieldtype: controller.editSave.value == false,
                    callbackFunction: callbackCitizenOf,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: "Passport Number",
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
                    controller: passportNumber,
                    readOnly: controller.editSave.value == false,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical:
                            MediaQuery.of(context).viewInsets.bottom + 30),
                    decoration: InputDecoration(
                      hintText: "Enter passport number",
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
                      text: "Country of Issue",
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
                        : ["No Data"],
                    initialSelectedValue: _.loadingCountry.value == true
                        ? _.countryList[0]
                        : "No Data",
                    choosefieldtype: controller.editSave.value == false,
                    callbackFunction: callbackCountry,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: "State of Issue",
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
                    model: _.loadingState.value == true
                        ? _.stateList
                        : ["No Data"],
                    initialSelectedValue: _.loadingState.value == true
                        ? _.stateList[0]
                        : "No Data",
                    choosefieldtype: controller.editSave.value == false,
                    callbackFunction: calllbackState,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: "Place of Issue",
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
                    model: _.loadingPlaceOfIssuse.value == true
                        ? _.placeOfIssuse
                        : ["No Data"],
                    initialSelectedValue: _.loadingPlaceOfIssuse.value == true
                        ? _.placeOfIssuse[0]
                        : "No Data",
                    choosefieldtype: controller.editSave.value == false,
                    callbackFunction: callbackPlaceOfIssuse,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: "Date Of Issue",
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
                    controller: dateofIssuse,
                    readOnly: controller.editSave.value == false,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical:
                            MediaQuery.of(context).viewInsets.bottom + 30),
                    decoration: InputDecoration(
                      hintText: "Enter your date",
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
                      text: "Expire Date",
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
                    controller: expireDate,
                    readOnly: controller.editSave.value == false,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical:
                            MediaQuery.of(context).viewInsets.bottom + 30),
                    decoration: InputDecoration(
                      hintText: "Enter expiry date",
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
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Spacer(),
                      if (_.editSave.value == false)
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SizedBox(
                            width: 100,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side:
                                    BorderSide(color: ThemeConstants.bluecolor),
                                primary:
                                    ThemeConstants.whitecolor, // background
                                onPrimary:
                                    ThemeConstants.whitecolor, // foreground
                              ),
                              onPressed: () {
                                controller.editSave.value = true;
                                controller.update();
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "Edit",
                                textColor: ThemeConstants.bluecolor,
                              ),
                            ),
                          ),
                        ),
                      if (_.editSave.value == true)
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SizedBox(
                            width: 100,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side:
                                    BorderSide(color: ThemeConstants.bluecolor),
                                primary:
                                    ThemeConstants.whitecolor, // background
                                onPrimary:
                                    ThemeConstants.whitecolor, // foreground
                              ),
                              onPressed: () {
                                controller.editSave.value = false;
                                controller.update();
                                updatePassport();
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "Save",
                                textColor: ThemeConstants.bluecolor,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
            ));
  }

  callback(varTopic) {
    if (varTopic == "Yes") {
      controller.passportAvaliable.value = true;
    } else {
      controller.passportAvaliable.value = false;
    }
    controller.update();
  }

  callbackPlaceOfIssuse(varTopic) {
    controller.placeOfIssuseSelected = varTopic;
    controller.update();
  }

  callbackCountry(varTopic) {
    controller.countrySelected = varTopic;
    for (var i = 0; i < controller.countryList.length; i++) {
      if (controller.countryList[i] == varTopic) {
        controller.countryCodeSelected = controller.countryCode[i].toString();
        controller.getState("[${controller.countryCode[i]}]");
      }
    }
    controller.update();
  }

  callbackCitizenOf(varTopic) {
    controller.citizenSelected = varTopic;
    for (var i = 0; i < controller.countryList.length; i++) {
      if (controller.countryList[i] == varTopic) {
        controller.citizenCodeSelected = controller.countryCode[i].toString();
      }
    }
    controller.update();
  }

  calllbackState(varTopic) {
    controller.stateSelected = varTopic;
    for (var i = 0; i < controller.stateList.length; i++) {
      if (controller.stateList[i] == varTopic) {
        controller.stateCodeSelected = controller.stateCode[i].toString();
      }
    }
    controller.update();
  }

  callbackPassportAvaliables(varTopic) {
    // controller.placeOfIssuseSelected = varTopic;
    if (varTopic.toString() == "NO") {
      controller.passportAvaliable.value = true;
    } else {
      controller.passportAvaliable.value = false;
    }
    controller.update();
  }

  updatePassport() {
    controller.passportModel.dateOfIssue = dateofIssuse.text;
    controller.passportModel.expiryDate = expireDate.text;
    //  controller.passportModel.passportTentativeDate
    controller.passportModel.passportNumber = passportNumber.text;
    controller.passportModel.citizenOf = controller.citizenCodeSelected;
    controller.passportModel.countryOfIssue = controller.countryCodeSelected;
    controller.passportModel.stateOfIssue = controller.stateCodeSelected;
    controller.passportModel.placeOfIssue = controller.placeOfIssuseSelected;
    controller.passportModel.passportAvailable =
        controller.passportAvaliable.value == true ? "2" : "1";
    controller.passportModel.enqId = "78623";

    controller.updatePassportDetail("78623", controller.passportModel);
  }
}
