import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/qualificationdetails.dart';
import 'package:studentpanel/ui/screen/ModificationUi/qualificationdetailsview.dart';
import 'package:studentpanel/ui/screen/ModificationUi/qualificationwidget.dart';

class QualificationDetailsCopy extends StatelessWidget {
  QualificationDetailsCopy({Key? key}) : super(key: key);
  var controller = Get.put(QualificationDetailsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QualificationDetailsController>(
        builder: (controller1) => controller1.addedQualification.value == true
            ? QualificationDetailView(
                callbackDelete: callbackDelete,
                callbackEdit: callbackEdit,
                callbackAddQualification: callback,
                model: controller1.modelList,
              )
            : QualificationWidget(
                updateForEdit: controller1.updteForEdit.value,
                index: controller1.modelindex,
                callback: callback,
                callbackCountry: callbackCountry,
                callbackHighestQualification: callbackHighestQualification,
                callbackState: callbackState,
                callbackStream: callbackStream,
              ));
  }

  // Funcation
  callback(varTopic) {
    controller.setaddedQualification(false);
  }

  callbackHighestQualification(varTopic) {
    for (var i = 0; i < controller.highestQualificationList.length; i++) {
      if (controller.highestQualificationList[i] == varTopic) {
        controller.highestQualificationSelected =
            controller.highestQualificationList[i];
        controller.highestQualificationSelectedID =
            controller.highestQualificationCode[i];
      }
    }
  }

  callbackStream(varTopic) {
    for (var i = 0; i < controller.streamList.length; i++) {
      if (controller.streamList[i] == varTopic) {
        controller.highestQualificationSelected = controller.streamList[i];
        controller.highestQualificationSelectedID =
            controller.streamCode[i].toString();
      }
    }
  }

  callbackEducationStatus(varTopic) {
    for (var i = 0; i < controller.streamList.length; i++) {
      if (controller.educationStatusList[i] == varTopic) {
        controller.educationStatusSelected = controller.educationStatusList[i];
      }
    }
  }

  callbackYearOfPassing(varTopic) {
    controller.yearOfPassingSelected = varTopic.toString();
  }

  callbackCountry(varTopic) {
    for (var i = 0; i < controller.countryList.length; i++) {
      if (controller.countryList[i] == varTopic) {
        controller.countrySelected = controller.countryList[i];
        controller.countrySelectedID = controller.countryCode[i];
      }
    }
    controller.getState(controller.countrySelectedID.toString());
    controller.getAffiliation(controller.countrySelectedID!);
  }

  callbackState(varTopic) {
    for (var i = 0; i < controller.stateList.length; i++) {
      if (controller.stateList[i] == varTopic) {
        controller.stateSelected = controller.stateList[i];
        controller.stateSelectedID = controller.stateCode[i];
      }
    }
    controller.getCity(controller.stateSelectedID!);
  }

  callbackCity(varTopic) {
    for (var i = 0; i < controller.cityList.length; i++) {
      if (controller.cityList == varTopic) {
        controller.citySelected = controller.cityList[i];
        controller.citySelectedID = controller.cityCode[i];
      }
    }
    controller.geInstitution(controller.citySelectedID!);
  }

  callbackInstitution(varTopic) {
    controller.institutionSelected = varTopic.toString();
  }

  callbackDelete(data) {
    controller.modelList.removeAt(data);
    controller.updateQualification("78623");
    controller.update();
  }

  callbackEdit(data) {
    controller.modelindex = data;
    controller.updteForEdit.value = false;
    controller.addedQualification.value = false;
    controller.loadingEditQualification.value = true;
    controller.update();
  }
}
