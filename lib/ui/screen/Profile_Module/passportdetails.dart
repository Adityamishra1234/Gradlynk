import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/passport.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';

class PassportDetails extends StatelessWidget {
  PassportDetails({Key? key, this.editButton}) : super(key: key);
  var controller = Get.put(PassportController());

  bool? editButton = false;

  // static final dateofIssuse = TextEditingController();
  // static final expireDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      try {
        if (controller.loadingFirstTime.value == false &&
            controller.loadingCountry.value == true &&
            controller.loadingPassport.value == true &&
            controller.loadingPlaceOfIssuse.value == true) {
          controller.loadingFirstTime.value = true;
          // citizen of, passport number ,country of issue, state of issue, place of issue ,date of issue, expiry date  ("Yes") / No => tentative Date
          PassportController.passportNumber.text =
              getNUllChecker(controller.passportModel.passportNumber) == false
                  ? controller.passportModel.passportNumber!
                  : "";
          controller.dateOfIssue =
              getNUllChecker(controller.passportModel.dateOfIssue) == false
                  ? controller.passportModel.dateOfIssue!
                  : "";
          controller.expireDate =
              getNUllChecker(controller.passportModel.expiryDate) == false
                  ? controller.passportModel.expiryDate!
                  : "";
          controller.passportAvaliable =
              (controller.passportModel.passportAvailable == "1")
                  ? false.obs
                  : true.obs;
          controller.placeOfIssuseSelected =
              getNUllChecker(controller.passportModel.placeOfIssue) == false
                  ? controller.passportModel.placeOfIssue!
                  : "";

//Citizen of Selected View at the Time of autoview
          for (var i = 0; i < controller.countryList.length; i++) {
            if (controller.countryCode[i] ==
                controller.passportModel.citizenOf) {
              controller.citizenCodeSelected =
                  controller.passportModel.citizenOf;
              controller.citizenSelected = controller.countryList[i];
            }
          }
          for (var i = 0; i < controller.countryList.length; i++) {
            if (controller.countryCode[i] ==
                controller.passportModel.countryOfIssue) {
              controller.countryCodeSelected =
                  controller.passportModel.countryOfIssue;
              controller.getState(controller.countryCodeSelected!);
              controller.countrySelected = controller.countryList[i];
            }
          }
        }
      } catch (e) {
        print(e.toString());
      }
      if (editButton == true) {
        controller.editSave.value = true;
        controller.update();
      }

      return ListView(
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
              ],
            ),
          ),
          CustomDropDownSingle(
            model: const ["Yes", "No"],
            initialSelectedValue:
                getNUllChecker(controller.passportAvaliable.value) == true
                    ? "No"
                    : controller.passportAvaliable.value == false
                        ? "Yes"
                        : "No",
            choosefieldtype: controller.editSave.value == false,
            callbackFunction: callbackPassportAvaliables,
          ),
          if (controller.passportAvaliable.value == false)
            ...getPassportAvaliable(controller, context),
        ],
      );
    }, onLoading: getLoading(context));
  }

  // Widget Function
  List<Widget> getPassportAvaliable(
      PassportController controller, BuildContext context) {
    return [
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
      CustomDropDownSingle(
        model: controller.loadingCountry.value == true
            ? controller.countryList
            : ["No Data"],
        initialSelectedValue:
            getNUllChecker(controller.citizenSelected) == false
                ? controller.citizenSelected
                : controller.loadingCountry.value == true
                    ? controller.countryList[0]
                    : "No Data",
        choosefieldtype: controller.editSave.value == false,
        callbackFunction: callbackCitizenOf,
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
          controller: PassportController.passportNumber,
          readOnly: controller.editSave.value == false,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
      // Padding(
      //   padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      //   child: Align(
      //     alignment: AlignmentDirectional.topStart,
      //     child: CustomAutoSizeTextMontserrat(
      //       text: "Country of Issue",
      //       mandatory: true,
      //       textColor: ThemeConstants.TextColor,
      //       fontSize: 14,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      // CustomDropDownSingle(
      //   model: controller.loadingCountry.value == true
      //       ? controller.countryList
      //       : ["No Data"],
      //   initialSelectedValue:
      //       getNUllChecker(controller.countrySelected) == false
      //           ? controller.countrySelected
      //           : controller.loadingCountry.value == true
      //               ? controller.countryList[0]
      //               : "No Data",
      //   choosefieldtype: controller.editSave.value == false,
      //   callbackFunction: callbackCountry,
      // ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Nationality",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      CustomDropDownSingle(
        model: controller.loadingCountry.value == true
            ? controller.countryList
            : ["No Data"],
        initialSelectedValue:
            getNUllChecker(controller.countrySelected) == false
                ? controller.countrySelected
                : controller.loadingCountry.value == true
                    ? controller.countryList[0]
                    : "No Data",
        choosefieldtype: controller.editSave.value == false,
        callbackFunction: callbackCountry,
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
      CustomDropDownSingle(
        model: controller.loadingState.value == true
            ? controller.stateList
            : ["No Data"],
        initialSelectedValue: getNUllChecker(controller.stateSelected) == false
            ? controller.stateSelected
            : controller.loadingState.value == true
                ? controller.stateList[0]
                : "No Data",
        choosefieldtype: controller.editSave.value == false,
        callbackFunction: calllbackState,
      ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      //   child: Align(
      //     alignment: AlignmentDirectional.topStart,
      //     child: CustomAutoSizeTextMontserrat(
      //       text: "Place of Issue",
      //       mandatory: true,
      //       textColor: ThemeConstants.TextColor,
      //       fontSize: 14,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      // CustomDropDownSingle(
      //   model: controller.loadingPlaceOfIssuse.value == true
      //       ? controller.placeOfIssuse
      //       : ["No Data"],
      //   initialSelectedValue:
      //       getNUllChecker(controller.placeOfIssuseSelected) == false
      //           ? controller.placeOfIssuseSelected
      //           : controller.loadingPlaceOfIssuse.value == true
      //               ? controller.placeOfIssuse[0]
      //               : "No Data",
      //   choosefieldtype: controller.editSave.value == false,
      //   callbackFunction: callbackPlaceOfIssuse,
      // ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Date of Issue",
            mandatory: true,
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DatePickerExample(
            enableField: controller.editSave.value == true ? false : true,
            date: controller.dateOfIssue,
            callbackDate: callbackDateOfIssue),
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
        child: DatePickerExample(
            enableField: controller.editSave.value == true ? false : true,
            date: controller.expireDate,
            callbackDate: callbackExpireDate),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 15),
      //   child: Row(
      //     children: [
      //       const Spacer(),
      //       if (controller.editSave.value == false)
      //         Padding(
      //           padding: const EdgeInsets.only(right: 15),
      //           child: SizedBox(
      //             width: 100,
      //             height: 35,
      //             child: ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 foregroundColor: ThemeConstants.whitecolor,
      //                 side: BorderSide(color: ThemeConstants.bluecolor),
      //                 backgroundColor: ThemeConstants.whitecolor, // foreground
      //               ),
      //               onPressed: () {
      //                 controller.editSave.value = true;
      //                 controller.update();
      //               },
      //               child: CustomAutoSizeTextMontserrat(
      //                 text: "Edit",
      //                 textColor: ThemeConstants.bluecolor,
      //               ),
      //             ),
      //           ),
      //         ),
      //       if (controller.editSave.value == true)
      //         Padding(
      //           padding: const EdgeInsets.only(right: 15),
      //           child: SizedBox(
      //             width: 100,
      //             height: 35,
      //             child: ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 foregroundColor: ThemeConstants.whitecolor,
      //                 side: BorderSide(color: ThemeConstants.bluecolor),
      //                 backgroundColor: ThemeConstants.whitecolor, // foreground
      //               ),
      //               onPressed: () {},
      //               child: CustomAutoSizeTextMontserrat(
      //                 text: "Save",
      //                 textColor: ThemeConstants.bluecolor,
      //               ),
      //             ),
      //           ),
      //         ),

      //     ],
      //   ),
      // ),

      const SizedBox(
        height: 30,
      )
    ];
  }

//Function
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
        controller.getState("${controller.countryCode[i]}");
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
        controller.getPlaceOfIssue();
      }
    }
    controller.update();
  }

  callbackPassportAvaliables(varTopic) {
    // controller.placeOfIssuseSelected = varTopic;
    if (varTopic.toString() == "No") {
      controller.passportAvaliable.value = true;
    } else {
      controller.passportAvaliable.value = false;
    }
    controller.update();
  }

  // updatePassport() {
  //   controller.passportModel.dateOfIssue = controller.dateOfIssue;
  //   controller.passportModel.expiryDate = controller.expireDate;
  //   //  controller.passportModel.passportTentativeDate
  //   controller.passportModel.passportNumber = passportNumber.text;
  //   controller.passportModel.citizenOf = controller.citizenCodeSelected;
  //   controller.passportModel.countryOfIssue = controller.countryCodeSelected;
  //   controller.passportModel.stateOfIssue = controller.stateCodeSelected;
  //   controller.passportModel.placeOfIssue = controller.placeOfIssuseSelected;
  //   controller.passportModel.passportAvailable =
  //       controller.passportAvaliable.value == true ? "2" : "1";
  //   controller.passportModel.enqId =
  //       Get.find<BaseController>().model1.id.toString();

  //   controller.updatePassportDetail(
  //       Get.find<BaseController>().model1.id.toString(),
  //       controller.passportModel);
  // }

  callbackDateOfIssue(data) {
    String temp = data.toString().split(' ')[0];
    List<String> date = temp.split('-');
    controller.dateOfIssue = date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
  }

  callbackExpireDate(data) {
    String temp = data.toString().split(' ')[0];
    List<String> date = temp.split('-');
    controller.expireDate = date[0] + "-" + date[1] + '-' + date[2];
    controller.update();
  }
}
