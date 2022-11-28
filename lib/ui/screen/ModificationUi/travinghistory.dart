import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/travelhistory.dart';
import 'package:studentpanel/ui/models/travelhistory.dart';
import 'package:studentpanel/ui/screen/ModificationUi/travinghistoryview.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class TravingHistory extends StatelessWidget {
  TravingHistory({Key? key}) : super(key: key);
  var controller = Get.put(TravelHistoryController());
  final dateOfApplication = TextEditingController();
  final dateOfReject = TextEditingController();
  final reasonOfRejection = TextEditingController();
  final applicationNumber = TextEditingController();
  final visaNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelHistoryController>(
        builder: (_) => _.viewDetails.value == true
            ? TravingHistoryView(
                callbackAddTravelDetails: callbackAddedTravelHistory,
                model: _.travelHistoryList,
              )
            : ListView(
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
                      model: ["Yes", "No"],
                      initialSelectedValue: "No",
                      choosefieldtype: false,
                      callbackFunction: callbackTravelAbroad,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: _.loadingtravelStatus.value == true
                          ? _.travelStatus
                          : ["No Data"],
                      initialSelectedValue: _.loadingtravelStatus.value == true
                          ? _.travelStatus[0]
                          : "No Data",
                      choosefieldtype: false,
                      callbackFunction: callbackTravelStatus,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: _.loadingCountry.value == true
                          ? _.countryList
                          : ["No Data"],
                      initialSelectedValue: _.loadingCountry.value == true
                          ? _.countryList[0]
                          : "No Data",
                      choosefieldtype: false,
                      callbackFunction: callbackCountry,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: _.loadingTypeVisa.value == true
                          ? _.typeOfVisaList
                          : ["No Data"],
                      initialSelectedValue: _.loadingTypeVisa.value == true
                          ? _.typeOfVisaList[0]
                          : "No Data",
                      choosefieldtype: false,
                      callbackFunction: callbackTypeOfVisa,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: _.loadingVisaStatus.value == true
                          ? _.visaStatusList
                          : ["No Data"],
                      initialSelectedValue: _.loadingVisaStatus.value == true
                          ? _.visaStatusList[0]
                          : "No Data",
                      choosefieldtype: false,
                      callbackFunction: callbackVisaStatus,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                    child: TextField(
                      controller: dateOfApplication,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
                      decoration: InputDecoration(
                        hintText: "Enter date of application",
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                    child: TextField(
                      controller: dateOfReject,
                      scrollPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
                      decoration: InputDecoration(
                        hintText: "Enter date of reject",
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                          vertical:
                              MediaQuery.of(context).viewInsets.bottom + 30),
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      model: ["Yes", "No"],
                      initialSelectedValue: "No",
                      choosefieldtype: false,
                      callbackFunction: callbackProofAvailable,
                    ),
                  ),
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
                                  elevation: 0.0,
                                  primary:
                                      ThemeConstants.bluecolor, // background
                                  onPrimary:
                                      ThemeConstants.bluecolor, // foreground
                                ),
                                onPressed: () async {
                                  controller.travelHistoryList.add(
                                      TravelHistoryModel(
                                          travelStatus: controller
                                              .travelStatusSelected,
                                          chooseCountry: int.parse(controller
                                              .countryCodeSelected!),
                                          typeOfVisa: int.parse(controller
                                              .typeOfVisaCodeSelected!),
                                          visaStatus: controller
                                              .visaStatusSelected,
                                          dateOfApplication: dateOfApplication
                                              .text,
                                          dateOfRejection: dateOfReject.text,
                                          reasonOfRejection: reasonOfRejection
                                              .text,
                                          proofAvailable: int
                                              .parse(
                                                  controller.proofAvailable!),
                                          countryName:
                                              controller.countrySelected,
                                          applicationNumber:
                                              applicationNumber.text,
                                          visaNumber: visaNumber.text));
                                  controller.update();
                                  controller.updateTravelHistory("78623",
                                      controller.travelAbroadSelected!);
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
                  if (controller.applicationNumberField.value == true)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: applicationNumber,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
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
                  if (controller.applicationNumberField.value == false)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Visa Number",
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (controller.applicationNumberField.value == false)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: visaNumber,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).viewInsets.bottom + 30),
                        decoration: InputDecoration(
                          hintText: "Enter Visa Number",
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
                ],
              ));
  }

  callbackAddedTravelHistory(varTopic) {
    controller.viewDetails.value = false;
    controller.update();
  }

  callbackTravelAbroad(varTopic) {
    if (varTopic == "Yes") {
      controller.travelAbroadSelected = "1";
    } else {
      controller.travelAbroadSelected = "2";
    }
    controller.update();
  }

  callbackTravelStatus(varTopic) {
    //name
    controller.travelStatusSelected = varTopic;
    controller.getVisaStatus(varTopic);
    controller.update();
  }

  callbackCountry(varTopic) {
    //id
    for (var i = 0; i < controller.countryList.length; i++) {
      if (controller.countryList[i] == varTopic) {
        controller.countrySelected = controller.countryList[i];
        controller.countryCodeSelected = controller.countryCode[i];
      }
    }
    controller.update();
  }

  callbackTypeOfVisa(varTopic) {
    //id
    for (var i = 0; i < controller.typeOfVisaList.length; i++) {
      if (controller.typeOfVisaList[i] == varTopic) {
        controller.typeOfVisaSelected = controller.typeOfVisaList[i];
        controller.typeOfVisaCodeSelected = controller.typeofVisaCode[i];
      }
    }
    controller.update();
  }

  callbackVisaStatus(varTopic) {
    //id

    for (var i = 0; i < controller.visaStatusList.length; i++) {
      if (controller.visaStatusList[i] == varTopic) {
        controller.visaStatusSelected = controller.visaStatusList[i];
        controller.visaStatusCodeSelected =
            controller.visaStatusCode[i].toString();
      }
    }
    if (controller.visaStatusCodeSelected == "3") {
      controller.applicationNumberField.value = false;
    }
    controller.update();
  }

  callbackProofAvailable(varTopic) {
    if (varTopic == "Yes") {
      controller.proofAvailable = "1";
    } else {
      controller.proofAvailable = "2";
    }
    controller.update();
  }
}
