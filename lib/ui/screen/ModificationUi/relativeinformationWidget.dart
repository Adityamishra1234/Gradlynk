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
  Function callbackAnyRelativeCountryInterested;
  Function callbackCountry;
  Function callbackCitizenShip;
  Function callbackRelation;
  RelativeInformationWidget(
      {Key? key,
      this.index,
      required this.updatForEdit,
      required this.callbackAnyRelativeCountryInterested,
      required this.callbackCountry,
      required this.callbackCitizenShip,
      required this.callbackRelation})
      : super(key: key);

  final realtiveEmail = TextEditingController();
  final contactOfRelative = TextEditingController();
  final addresOfrelative = TextEditingController();

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
              model: ["Yes", "No"],
              initialSelectedValue: "No",
              choosefieldtype: false,
              callbackFunction: callbackAnyRelativeCountryInterested,
            ),
          ),
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
              model:
                  _.loadingCountry.value == true ? _.countryList : ["No data"],
              initialSelectedValue: _.loadingCountry.value == true
                  ? updatForEdit == false
                      ? _.countryNameSelected
                      : _.countryList[0]
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
              model: _.loadingCitizen.value == true
                  ? _.citizenShipStatus
                  : ["No data"],
              initialSelectedValue: _.loadingCitizen.value == true
                  ? updatForEdit == false
                      ? _.citizenShipStatusSelected
                      : _.citizenShipStatus[0]
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
              model: _.loadingRealtion.value == true ? _.realtion : ["No data"],
              initialSelectedValue: _.loadingRealtion.value == true
                  ? updatForEdit == false
                      ? _.relationSelected
                      : _.realtion[0]
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
                        _.modelList.add(RealtionModel(
                          countryName: _.countryNameSelected,
                          relationWithRelative: _.relationSelected,
                          id: "",
                          anyRelativeCountryInterested:
                              _.anyRelativeCountryInterestedSelected,
                          citizenshipStatus: _.citizenShipStatusSelected,
                          relativeCountry:
                              int.parse(_.countryNameCodeSelected!),
                          relativeEmailId: realtiveEmail.text,
                          contactOfRelative: int.parse(contactOfRelative.text),
                          addressOfRelative: addresOfrelative.text,
                        ));
                        _.updateRelativeInformation("78623", "1");
                        _.update();
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
                        _.modelList[index!] = RealtionModel(
                          countryName: _.countryNameSelected,
                          relationWithRelative: _.relationSelected,
                          id: "",
                          anyRelativeCountryInterested:
                              _.anyRelativeCountryInterestedSelected,
                          citizenshipStatus: _.citizenShipStatusSelected,
                          relativeCountry:
                              int.parse(_.countryNameCodeSelected!),
                          relativeEmailId: realtiveEmail.text,
                          contactOfRelative: int.parse(contactOfRelative.text),
                          addressOfRelative: addresOfrelative.text,
                        );
                        _.updateRelativeInformation("78623", "1");
                        _.updateForEdit.value = true;
                        _.update();
                      },
                      child: CustomAutoSizeTextMontserrat(
                        text: "Update",
                        textColor: ThemeConstants.whitecolor,
                      )),
                ),
              ),
            ),
        ],
      );
    });
  }

  //Funcation

}
