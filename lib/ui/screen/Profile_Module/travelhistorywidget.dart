import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/travelhistory.dart';
import 'package:studentpanel/ui/models/travelhistory.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class TravelHistoryWidget extends StatelessWidget {
  int? index;
  bool updateForEdit;
  Function callbackTravelAbroad;
  Function callbackTravelStatus;
  Function callbackCountry;
  Function callbackTypeOfVisa;
  Function callbackVisaStatus;
  Function callbackProofAvailable;
  Function callbackDateOfApplciation;
  Function callbackDateOfReject;

  TravelHistoryWidget({
    Key? key,
    this.index,
    required this.updateForEdit,
    required this.callbackCountry,
    required this.callbackTravelAbroad,
    required this.callbackTravelStatus,
    required this.callbackTypeOfVisa,
    required this.callbackProofAvailable,
    required this.callbackVisaStatus,
    required this.callbackDateOfApplciation,
    required this.callbackDateOfReject,
  }) : super(key: key);

  static final dateOfApplication = TextEditingController();
  static final dateOfReject = TextEditingController();
  static final reasonOfRejection = TextEditingController();
  static final applicationNumber = TextEditingController();
  static final visaNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelHistoryController>(builder: (_) {
      // For Edit
      try {
        if (updateForEdit == false || _.loadingEdit.value == true) {
          _.travelAbroadSelected = "Yes";
          _.travelStatusSelected = _.modelList[index!].travelStatus;
          _.countrySelected = _.modelList[index!].countryName;
          _.countryCodeSelected = _.modelList[index!].chooseCountry.toString();
          if (_.typeOfVisaList.isNotEmpty) {
            for (var i = 0; i < _.typeOfVisaList.length; i++) {
              if (_.typeofVisaCode[i].toString() ==
                  _.modelList[index!].typeOfVisa.toString()) {
                _.typeOfVisaSelected = _.typeOfVisaList[i];
                _.typeOfVisaCodeSelected =
                    _.modelList[index!].typeOfVisa.toString();
              }
            }
          }
          _.visaStatusSelected = _.modelList[index!].visaStatus;
          applicationNumber.text = _.modelList[index!].applicationNumber ?? "";
          dateOfApplication.text = _.modelList[index!].dateOfApplication ?? "";
          reasonOfRejection.text = _.modelList[index!].reasonOfRejection ?? "";
        }
      } catch (e) {
        print(e.toString());
      }

      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              children: [
                CustomAutoSizeTextMontserrat(
                  text: "Have you travelled Abroad?",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  child: TextButton(
                      onPressed: () {
                        _.viewDetails.value = true;
                        _.update();
                      },
                      child: CustomAutoSizeTextMontserrat(
                        text: "View Details",
                        textColor: ThemeConstants.orangeColor,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: CustomDropDownSingle(
              model: const ["Yes", "No"],
              initialSelectedValue:
                  getNUllChecker(_.travelAbroadSelected) == true
                      ? "No"
                      : _.travelAbroadSelected == "Yes"
                          ? "Yes"
                          : "No",
              choosefieldtype: false,
              callbackFunction: callbackTravelAbroad,
            ),
          ),
          if (_.travelAbroadSelected == "Yes")
            ...getTravelledAbroad(_, context),
        ],
      );
    });
  }

  //Funcation
  List<Widget> getTravelledAbroad(
      TravelHistoryController _, BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Travel Status",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: getDropdownModel(_.loadingtravelStatus.value,
              _.travelStatusSelected, _.travelStatus),
          initialSelectedValue: getSelectedDropDown(_.loadingtravelStatus.value,
              _.travelStatusSelected, _.travelStatus),
          choosefieldtype: false,
          callbackFunction: callbackTravelStatus,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Selected Country",
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
              _.loadingCountry.value == true, _.countrySelected, _.countryList),
          initialSelectedValue: getSelectedDropDown(
              _.loadingCountry.value == true, _.countrySelected, _.countryList),
          choosefieldtype: false,
          callbackFunction: callbackCountry,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Type Of Visa",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: getDropdownModel(_.loadingTypeVisa.value, _.typeOfVisaSelected,
              _.typeOfVisaList.toSet().toList()),
          initialSelectedValue: getSelectedDropDown(_.loadingTypeVisa.value,
              _.typeOfVisaSelected, _.typeOfVisaList.toSet().toList()),
          choosefieldtype: false,
          callbackFunction: callbackTypeOfVisa,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Visa Status",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 50,
        child: CustomDropDownSingle(
          model: getDropdownModel(_.loadingVisaStatus.value,
              _.visaStatusSelected, _.visaStatusList),
          initialSelectedValue: getSelectedDropDown(_.loadingVisaStatus.value,
              _.visaStatusSelected, _.visaStatusList),
          choosefieldtype: false,
          callbackFunction: callbackVisaStatus,
        ),
      ),
      if (_.applicationNumberField.value == true)
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CustomAutoSizeTextMontserrat(
              text: "Application Number",
              textColor: ThemeConstants.TextColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (_.applicationNumberField.value == true)
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: applicationNumber,
            keyboardType: TextInputType.number,
            scrollPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).viewInsets.bottom + 30),
            decoration: InputDecoration(
              hintText: "Enter Application number",
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
            text: "Date of application",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DatePickerExample(
            enableField: false,
            date: _.dateOfApplicatiton,
            callbackDate: callbackDateOfApplciation),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Date of reject",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DatePickerExample(
            enableField: false,
            date: _.dateOfReject,
            callbackDate: callbackDateOfReject),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomAutoSizeTextMontserrat(
            text: "Reason of rejection",
            textColor: ThemeConstants.TextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          controller: reasonOfRejection,
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom + 30),
          decoration: InputDecoration(
            hintText: "Enter reason of rejection",
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
            text: "Proof Available",
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
          initialSelectedValue: _.proofAvailableSelected,
          choosefieldtype: false,
          callbackFunction: callbackProofAvailable,
        ),
      ),
      if (updateForEdit == true)
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
                        backgroundColor: ThemeConstants.bluecolor, // foreground
                      ),
                      onPressed: () async {
                        _.modelList.add(TravelHistoryModel(
                            travelStatus: _.travelStatusSelected,
                            chooseCountry:
                                int.parse(_.countryCodeSelected ?? "0"),
                            typeOfVisa:
                                int.parse(_.typeOfVisaCodeSelected ?? "0"),
                            visaStatus: _.visaStatusSelected,
                            dateOfApplication: dateOfApplication.text,
                            dateOfRejection: dateOfReject.text,
                            reasonOfRejection: reasonOfRejection.text,
                            proofAvailable:
                                int.parse(_.proofAvailableSelectedID ?? "0"),
                            countryName: _.countrySelected,
                            applicationNumber: applicationNumber.text,
                            visaNumber: visaNumber.text));
                        _.update();
                        _.updateTravelHistory(
                            Get.find<BaseController>().model1.id.toString(),
                            _.travelAbroadSelected!);
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
      if (updateForEdit == false)
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
                        backgroundColor: ThemeConstants.bluecolor, // foreground
                      ),
                      onPressed: () async {
                        // _.modelList.add(TravelHistoryModel(
                        //     travelStatus: _.travelStatusSelected,
                        //     chooseCountry:
                        //         int.parse(_.countryCodeSelected!),
                        //     typeOfVisa:
                        //         int.parse(_.typeOfVisaCodeSelected!),
                        //     visaStatus: _.visaStatusSelected,
                        //     dateOfApplication: dateOfApplication.text,
                        //     dateOfRejection: dateOfReject.text,
                        //     reasonOfRejection: reasonOfRejection.text,
                        //     proofAvailable:
                        //         int.parse(_.proofAvailableSelected!),
                        //     countryName: _.countrySelected,
                        //     applicationNumber: applicationNumber.text,
                        //     visaNumber: visaNumber.text));
                        // _.update();
                        // _.updateTravelHistory(
                        //     "78623", _.travelAbroadSelected!);
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
    ];
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
    if (loading == true) {
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
