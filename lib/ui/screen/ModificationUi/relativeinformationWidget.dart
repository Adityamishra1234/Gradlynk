import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/relativeinformation.dart';
import 'package:studentpanel/ui/models/realtion.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class RelativeInformationWidget extends StatelessWidget {
  int? index;
  bool updatForEdit;
  // bool interestedCountry;
  Function callbackAnyRelativeCountryInterested;
  Function callbackCountry;
  Function callbackCitizenShip;
  Function callbackRelation;
  RelativeInformationWidget(
      {Key? key,
      this.index,
      // required this.interestedCountry,
      required this.updatForEdit,
      required this.callbackAnyRelativeCountryInterested,
      required this.callbackCountry,
      required this.callbackCitizenShip,
      required this.callbackRelation})
      : super(key: key);

  static final realtiveEmail = TextEditingController();
  static final contactOfRelative = TextEditingController();
  static final addresOfrelative = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RelativeInformationController>(builder: (_) {
      if (updatForEdit == false) {
        realtiveEmail.text = _.modelList[index!].relativeEmailId ?? "";
        contactOfRelative.text =
            getNUllChecker(_.modelList[index!].contactOfRelative.toString()) ==
                    false
                ? _.modelList[index!].contactOfRelative.toString()
                : "";
        addresOfrelative.text = _.modelList[index!].addressOfRelative ?? "";
        _.countryNameSelected =
            _.modelList[index!].countryName ?? _.countryList[0];

        _.citizenShipStatusSelected =
            _.modelList[index!].citizenshipStatus ?? _.citizenShipStatus[0];
        _.relationSelected = _.modelList[index!].relationWithRelative;
        _.anyRelativeCountryInterestedSelected =
            _.modelList[index!].anyRelativeCountryInterested;
        _.countryNameCodeSelected =
            _.modelList[index!].relativeCountry.toString();
      }
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Any relatives residing in the Interested Country",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: CustomDropDownSingle(
              model: const ["Yes", "No"],
              initialSelectedValue:
                  getNUllChecker(_.anyRelativeCountryInterestedSelected) == true
                      ? "No"
                      : _.anyRelativeCountryInterestedSelected == "1"
                          ? "Yes"
                          : "No",
              choosefieldtype: false,
              callbackFunction: callbackAnyRelativeCountryInterested,
            ),
          ),
          if (_.anyRelativeCountryInterestedSelected == "1")
            ...interestedCountry(_, context),
        ],
      );
    });
  }

  //Funcation
  List<Widget> interestedCountry(
      RelativeInformationController controller, BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
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
          model: controller.loadingCountry.value == true
              ? controller.countryList
              : ["No data"],
          initialSelectedValue: controller.loadingCountry.value == true
              ? updatForEdit == false
                  ? controller.countryNameSelected
                  : controller.countryList[0]
              : "No data",
          choosefieldtype: false,
          callbackFunction: callbackCountry,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
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
          model: controller.loadingCitizen.value == true
              ? controller.citizenShipStatus
              : ["No data"],
          initialSelectedValue: controller.loadingCitizen.value == true
              ? updatForEdit == false
                  ? controller.citizenShipStatusSelected
                  : controller.citizenShipStatus[0]
              : "No data",
          choosefieldtype: false,
          callbackFunction: callbackCitizenShip,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
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
          model: controller.loadingRealtion.value == true
              ? controller.realtion
              : ["No data"],
          initialSelectedValue: controller.loadingRealtion.value == true
              ? updatForEdit == false
                  ? controller.relationSelected
                  : controller.realtion[0]
              : "No data",
          choosefieldtype: false,
          callbackFunction: callbackRelation,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
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
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
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
          keyboardType: TextInputType.number,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
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
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
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
      if (updatForEdit == true)
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: SizedBox(
              width: 90,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: ThemeConstants.bluecolor, // background
                    onPrimary: ThemeConstants.bluecolor, // foreground
                  ),
                  onPressed: () async {
                    controller.modelList.add(RealtionModel(
                      countryName: controller.countryNameSelected,
                      relationWithRelative: controller.relationSelected,
                      id: "",
                      anyRelativeCountryInterested:
                          controller.anyRelativeCountryInterestedSelected,
                      citizenshipStatus: controller.citizenShipStatusSelected,
                      relativeCountry:
                          int.parse(controller.countryNameCodeSelected!),
                      relativeEmailId: realtiveEmail.text,
                      contactOfRelative: int.parse(contactOfRelative.text),
                      addressOfRelative: addresOfrelative.text,
                    ));
                    controller.updateRelativeInformation("78623", "1");
                    controller.update();
                  },
                  child: CustomAutoSizeTextMontserrat(
                    text: "Add",
                    textColor: ThemeConstants.whitecolor,
                  )),
            ),
          ),
        ),
      if (updatForEdit == false)
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: SizedBox(
              width: 110,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: ThemeConstants.bluecolor, // background
                    onPrimary: ThemeConstants.bluecolor, // foreground
                  ),
                  onPressed: () async {
                    controller.modelList[index!] = RealtionModel(
                      countryName: controller.countryNameSelected,
                      relationWithRelative: controller.relationSelected,
                      id: "",
                      anyRelativeCountryInterested:
                          controller.anyRelativeCountryInterestedSelected,
                      citizenshipStatus: controller.citizenShipStatusSelected,
                      relativeCountry:
                          int.parse(controller.countryNameCodeSelected!),
                      relativeEmailId: realtiveEmail.text,
                      contactOfRelative: int.parse(contactOfRelative.text),
                      addressOfRelative: addresOfrelative.text,
                    );
                    controller.updateRelativeInformation("78623", "1");
                    controller.updateForEdit.value = true;
                    controller.update();
                  },
                  child: CustomAutoSizeTextMontserrat(
                    text: "Update",
                    textColor: ThemeConstants.whitecolor,
                  )),
            ),
          ),
        ),
      const SizedBox(
        height: 160,
      )
    ];
  }
}
