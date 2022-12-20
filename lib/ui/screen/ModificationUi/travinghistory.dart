import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/travelhistory.dart';
import 'package:studentpanel/ui/screen/ModificationUi/travinghistoryview.dart';
import 'travelhistorywidget.dart';

class TravingHistory extends StatelessWidget {
  TravingHistory({Key? key}) : super(key: key);
  var controller = Get.put(TravelHistoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelHistoryController>(
        builder: (_) => _.viewDetails.value == true
            ? TravingHistoryView(
                callbackEdit: callbackEdit,
                callbackDelete: callbackDelete,
                callbackAddTravelDetails: callbackAddedTravelHistory,
                model: _.modelList,
              )
            : TravelHistoryWidget(
                index: _.index,
                updateForEdit: _.updateForEdit.value,
                callbackCountry: callbackCountry,
                callbackProofAvailable: callbackProofAvailable,
                callbackTravelAbroad: callbackTravelAbroad,
                callbackTravelStatus: callbackTravelStatus,
                callbackTypeOfVisa: callbackTypeOfVisa,
                callbackVisaStatus: callbackVisaStatus,
              ));
  }

//Function

  callbackDelete(data) {
    controller.modelList.removeAt(data);
    controller.updateTravelHistory(
        "78623", controller.travelAbroadSelectedID.toString());
    controller.update();
  }

  callbackEdit(data) {
    controller.index = data;
    controller.updateForEdit.value = false;
    controller.viewDetails.value = false;
    controller.update();
  }

  callbackAddedTravelHistory(varTopic) {
    controller.viewDetails.value = false;
    controller.update();
  }

  callbackTravelAbroad(varTopic) {
    if (varTopic == "Yes") {
      controller.travelAbroadSelectedID = "1";
      controller.travelAbroadSelected = "Yes";
    } else {
      controller.travelAbroadSelectedID = "2";
      controller.travelAbroadSelected = "No";
    }
    controller.update();
  }

  callbackTravelStatus(varTopic) {
    //name
    controller.travelStatusSelected = varTopic;
    controller.getVisaStatus(varTopic);
    controller.loadingVisaStatus.value = false;
    controller.visaStatusSelected = null;
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
    for (var i = 0; i < controller.visaStatusList.length; i++) {
      if (controller.visaStatusList[i] == varTopic) {
        controller.visaStatusSelected = controller.visaStatusList[i];
      }
    }
    // if (controller.visaStatusCodeSelected == "3") {
    //   controller.applicationNumberField.value = false;
    // }
    controller.update();
  }

  callbackProofAvailable(varTopic) {
    controller.proofAvailableSelected = varTopic;
    if (varTopic == "Yes") {
      controller.proofAvailableSelectedID = "1";
    } else {
      controller.proofAvailableSelectedID = "2";
    }
    controller.update();
  }
}
