import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  var controller = Get.put(TravelHistoryController());

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      // For Edit

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
                        controller.viewDetails.value = true;
                        controller.update();
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
                  getNUllChecker(controller.travelAbroadSelected) == true
                      ? "No"
                      : controller.travelAbroadSelected == "Yes"
                          ? "Yes"
                          : "No",
              choosefieldtype: false,
              callbackFunction: callbackTravelAbroad,
            ),
          ),
          if (controller.travelAbroadSelected == "Yes")
            ...getTravelledAbroad(controller, context),
        ],
      );
    }, onLoading: getLoading(context));
  }

  //Funcation
  List<Widget> getTravelledAbroad(
      TravelHistoryController controller, BuildContext context) {
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
          model: getDropdownModel(controller.loadingtravelStatus.value,
              controller.travelStatusSelected, controller.travelStatus),
          initialSelectedValue: getSelectedDropDown(
              controller.loadingtravelStatus.value,
              controller.travelStatusSelected,
              controller.travelStatus),
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
          model: getDropdownModel(controller.loadingCountry.value == true,
              controller.countrySelected, controller.countryList),
          initialSelectedValue: getSelectedDropDown(
              controller.loadingCountry.value == true,
              controller.countrySelected,
              controller.countryList),
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
          model: getDropdownModel(
              controller.loadingTypeVisa.value,
              controller.typeOfVisaSelected,
              controller.typeOfVisaList.toSet().toList()),
          initialSelectedValue: getSelectedDropDown(
              controller.loadingTypeVisa.value,
              controller.typeOfVisaSelected,
              controller.typeOfVisaList.toSet().toList()),
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
          model: getDropdownModel(controller.loadingVisaStatus.value,
              controller.visaStatusSelected, controller.visaStatusList),
          initialSelectedValue: getSelectedDropDown(
              controller.loadingVisaStatus.value,
              controller.visaStatusSelected,
              controller.visaStatusList),
          choosefieldtype: false,
          callbackFunction: callbackVisaStatus,
        ),
      ),
      if (controller.applicationNumberField.value == true)
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
      if (controller.applicationNumberField.value == true)
        Obx(
          () => Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: TravelHistoryController.applicationNumber.value,
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
            date: controller.dateOfApplicatiton,
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
            date: controller.dateOfReject,
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
      Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: TravelHistoryController.reasonOfRejection.value,
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
          initialSelectedValue: controller.proofAvailableSelected,
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
                        controller.modelList.add(TravelHistoryModel(
                            travelStatus: controller.travelStatusSelected,
                            chooseCountry: int.parse(
                                controller.countryCodeSelected ?? "0"),
                            typeOfVisa: int.parse(
                                controller.typeOfVisaCodeSelected ?? "0"),
                            visaStatus: controller.visaStatusSelected,
                            dateOfApplication: TravelHistoryController
                                .dateOfApplication.value.text,
                            dateOfRejection: TravelHistoryController
                                .dateOfReject1.value.text,
                            reasonOfRejection: TravelHistoryController
                                .reasonOfRejection.value.text,
                            proofAvailable: int.parse(
                                controller.proofAvailableSelectedID ?? "0"),
                            countryName: controller.countrySelected,
                            applicationNumber: TravelHistoryController
                                .applicationNumber.value.text,
                            visaNumber:
                                TravelHistoryController.visaNumber.value.text));
                        controller.update();
                        controller.updateTravelHistory(
                            Get.find<BaseController>().model1.id.toString(),
                            controller.travelAbroadSelected!,
                            "add");
                      },
                      child: CustomAutoSizeTextMontserrat(
                        text: "Add",
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
                        TravelHistoryModel model = TravelHistoryModel();

                        model = TravelHistoryModel(
                            travelStatus: controller.travelStatusSelected,
                            chooseCountry: int.parse(
                                controller.countryCodeSelected ?? "0"),
                            typeOfVisa: int.parse(
                                controller.typeOfVisaCodeSelected ?? "0"),
                            visaStatus: controller.visaStatusSelected,
                            dateOfApplication: TravelHistoryController
                                .dateOfApplication.value.text,
                            dateOfRejection: TravelHistoryController
                                .dateOfReject1.value.text,
                            reasonOfRejection: TravelHistoryController
                                .reasonOfRejection.value.text,
                            proofAvailable: int.parse(
                                controller.proofAvailableSelectedID ?? "0"),
                            countryName: controller.countrySelected,
                            applicationNumber: TravelHistoryController
                                .applicationNumber.value.text,
                            visaNumber:
                                TravelHistoryController.visaNumber.value.text);
                        controller.modelList[index!] = model;
                        controller.update();
                        controller.updateTravelHistory(
                            Get.find<BaseController>().model1.id.toString(),
                            controller.travelAbroadSelected!,
                            "updated");
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
