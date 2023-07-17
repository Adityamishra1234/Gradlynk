import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/travelhistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/travinghistoryview.dart';
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
                callbackDateOfApplciation: callbackDateOfApplication,
                callbackDateOfReject: callbackDateOfReject,
              ));
  }

//Function

  callbackDelete(data) {
    controller.modelList.removeAt(data);
    controller.updateTravelHistory(
        Get.find<BaseController>().model1.id.toString(),
        controller.travelAbroadSelectedID.toString(),
        "deleted");
    controller.update();
  }

  callbackEdit(data) {
    controller.index = data;
    controller.updateForEdit.value = false;
    controller.viewDetails.value = false;
    controller.getUpdateCondition(int.parse(data.toString()));
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
      if (i == 0) {
        controller.countrySelected = null;
        controller.countryCodeSelected = null;
      } else {
        if (controller.countryList[i] == varTopic) {
          controller.countrySelected = controller.countryList[i];
          controller.countryCodeSelected = controller.countryCode[i];
        }
      }
    }
    controller.update();
  }

  callbackTypeOfVisa(varTopic) {
    //id
    for (var i = 0; i < controller.typeOfVisaList.length; i++) {
      if (i == 0) {
        controller.typeOfVisaSelected = null;
        controller.typeOfVisaCodeSelected = null;
      } else {
        if (controller.typeOfVisaList[i] == varTopic) {
          controller.typeOfVisaSelected = controller.typeOfVisaList[i];
          controller.typeOfVisaCodeSelected = controller.typeofVisaCode[i];
        }
      }
    }
    controller.update();
  }

  callbackVisaStatus(varTopic) {
    for (var i = 0; i < controller.visaStatusList.length; i++) {
      if (i == 0) {
        controller.visaStatusSelected = null;
      } else {
        if (controller.visaStatusList[i] == varTopic) {
          controller.visaStatusSelected = controller.visaStatusList[i];
        }
      }
    }
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

  callbackDateOfApplication(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.dateOfApplicatiton = date[0] + "-" + date[1] + '-' + date[2];
    controller.dateOfApplicatiton = data;
    controller.update();
  }

  callbackDateOfReject(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.dateOfReject = date[0] + "-" + date[1] + '-' + date[2];

    controller.dateOfReject = data;
    controller.update();
  }
}
