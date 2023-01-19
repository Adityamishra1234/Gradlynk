import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/passport.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class PassportDetails extends StatelessWidget {
  PassportDetails({Key? key}) : super(key: key);
  var controller = Get.put(PassportController());

  static final passportNumber = TextEditingController();
  // static final dateofIssuse = TextEditingController();
  // static final expireDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassportController>(builder: (_) {
      if (_.loadingFirstTime.value == false &&
          _.loadingCountry.value == true &&
          _.loadingPassport.value == true &&
          _.loadingPlaceOfIssuse.value == true) {
        _.loadingFirstTime.value = true;
        // citizen of, passport number ,country of issue, state of issue, place of issue ,date of issue, expiry date  ("Yes") / No => tentative Date
        passportNumber.text =
            getNUllChecker(_.passportModel.passportNumber) == false
                ? _.passportModel.passportNumber!
                : "";
        _.dateOfIssue = getNUllChecker(_.passportModel.dateOfIssue) == false
            ? _.passportModel.dateOfIssue!
            : "";
        _.expireDate = getNUllChecker(_.passportModel.expiryDate) == false
            ? _.passportModel.expiryDate!
            : "";
        _.passportAvaliable =
            (_.passportModel.passportAvailable == "1") ? false.obs : true.obs;
        _.placeOfIssuseSelected =
            getNUllChecker(_.passportModel.placeOfIssue) == false
                ? _.passportModel.placeOfIssue!
                : "";

//Citizen of Selected View at the Time of autoview
        for (var i = 0; i < _.countryList.length; i++) {
          if (_.countryCode[i] == _.passportModel.citizenOf) {
            _.citizenCodeSelected = _.passportModel.citizenOf;
            _.citizenSelected = _.countryList[i];
          }
        }

        for (var i = 0; i < _.countryList.length; i++) {
          if (_.countryCode[i] == _.passportModel.countryOfIssue) {
            _.countryCodeSelected = _.passportModel.countryOfIssue;
            _.getState(_.countryCodeSelected!);
            _.countrySelected = _.countryList[i];
          }
        }
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
                const Spacer(),
                if (_.editSave.value == true)
                  TextButton(
                      onPressed: () {
                        if (_.passportAvaliable.value == true) {
                          controller.editSave.value = false;
                          controller.update();
                          updatePassport();
                        } else {
                          if (_.citizenSelected == null) {
                            getToast("please enter citizen of");
                          } else if (passportNumber.text.isEmpty) {
                            getToast("please enter passport number");
                          } else if (_.countrySelected == null) {
                            getToast("please enter country");
                          } else if (_.stateSelected == null) {
                            getToast("please enter state");
                          } else if (_.placeOfIssuseSelected == null) {
                            getToast("please enter place of issuse");
                          } else if (_.dateOfIssue == null) {
                            getToast("please enter date of issue");
                          } else if (_.expireDate == null) {
                            getToast("please enter expire date");
                          } else {
                            controller.editSave.value = false;
                            controller.update();
                            updatePassport();
                          }
                        }
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
              initialSelectedValue:
                  getNUllChecker(_.passportAvaliable.value) == true
                      ? "No"
                      : _.passportAvaliable.value == false
                          ? "Yes"
                          : "No",
              choosefieldtype: controller.editSave.value == false,
              callbackFunction: callbackPassportAvaliables,
            ),
          ),
          if (_.passportAvaliable.value == false)
            ...getPassportAvaliable(_, context),
        ],
      );
    });
  }

  // Widget Function
  List<Widget> getPassportAvaliable(
      PassportController _, BuildContext context) {
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
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: _.loadingCountry.value == true ? _.countryList : ["No Data"],
          initialSelectedValue: getNUllChecker(_.citizenSelected) == false
              ? _.citizenSelected
              : _.loadingCountry.value == true
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
          model: _.loadingCountry.value == true ? _.countryList : ["No Data"],
          initialSelectedValue: getNUllChecker(_.countrySelected) == false
              ? _.countrySelected
              : _.loadingCountry.value == true
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
          model: _.loadingState.value == true ? _.stateList : ["No Data"],
          initialSelectedValue: getNUllChecker(_.stateSelected) == false
              ? _.stateSelected
              : _.loadingState.value == true
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
          initialSelectedValue: getNUllChecker(_.placeOfIssuseSelected) == false
              ? _.placeOfIssuseSelected
              : _.loadingPlaceOfIssuse.value == true
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
        child: DatePickerExample(
            enableField: _.editSave.value == true ? false : true,
            date: _.dateOfIssue,
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
            enableField: _.editSave.value == true ? false : true,
            date: _.expireDate,
            callbackDate: callbackExpireDate),
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
                      side: BorderSide(color: ThemeConstants.bluecolor),
                      primary: ThemeConstants.whitecolor, // background
                      onPrimary: ThemeConstants.whitecolor, // foreground
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
                      side: BorderSide(color: ThemeConstants.bluecolor),
                      primary: ThemeConstants.whitecolor, // background
                      onPrimary: ThemeConstants.whitecolor, // foreground
                    ),
                    onPressed: () {
                      if (_.passportAvaliable.value == true) {
                        controller.editSave.value = false;
                        controller.update();
                        updatePassport();
                      } else {
                        if (_.citizenSelected == null) {
                          getToast("please enter citizen of");
                        } else if (passportNumber.text.isEmpty) {
                          getToast("please enter passport number");
                        } else if (_.countrySelected == null) {
                          getToast("please enter country");
                        } else if (_.stateSelected == null) {
                          getToast("please enter state");
                        } else if (_.placeOfIssuseSelected == null) {
                          getToast("please enter place of issuse");
                        } else if (_.dateOfIssue == null) {
                          getToast("please enter date of issue");
                        } else if (_.expireDate == null) {
                          getToast("please enter expire date");
                        } else {
                          controller.editSave.value = false;
                          controller.update();
                          updatePassport();
                        }
                      }
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

  updatePassport() {
    controller.passportModel.dateOfIssue = controller.dateOfIssue;
    controller.passportModel.expiryDate = controller.expireDate;
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
