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
                callbackAffiliation: callbackAffiliation,
                callbackEducationStatus: callbackEducationStatus,
                callbackInstitution: callbackInstitution,
                callbackYearOfPassing: callbackYearOfPassing,
                callbackCity: callbackCity,
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
      if (i == 0) {
        controller.highestQualificationSelected = null;
        controller.highestQualificationSelectedID = null;
      } else {
        if (controller.highestQualificationList[i] == varTopic) {
          controller.highestQualificationSelected =
              controller.highestQualificationList[i];
          controller.highestQualificationSelectedID =
              controller.highestQualificationCode[i];
        }
      }
    }
  }

  callbackStream(varTopic) {
    for (var i = 0; i < controller.streamList.length; i++) {
      if (i == 0) {
        controller.highestQualificationSelected = null;
        controller.highestQualificationSelectedID = null;
      } else {
        if (controller.streamList[i] == varTopic) {
          controller.streamSelected = controller.streamList[i];
          controller.streamSelectedID = controller.streamCode[i].toString();
          controller.update();
        }
      }
    }
  }

  callbackEducationStatus(varTopic) {
    for (var i = 0; i < controller.streamList.length; i++) {
      if (i == 0) {
        controller.educationStatusSelected = null;
      } else {
        if (controller.educationStatusList[i] == varTopic) {
          controller.educationStatusSelected =
              controller.educationStatusList[i];
          controller.update();
        }
      }
    }
  }

  callbackYearOfPassing(varTopic) {
    if (varTopic.toString().contains("Select")) {
      controller.yearOfPassingSelected = null;
    } else {
      controller.yearOfPassingSelected = varTopic.toString();
    }
    controller.update();
  }

  callbackCountry(varTopic) {
    for (var i = 0; i < controller.countryList.length; i++) {
      if (i == 0) {
        controller.countrySelected = null;
        controller.countrySelectedID = null;
      } else {
        if (controller.countryList[i] == varTopic) {
          controller.countrySelected = controller.countryList[i];
          controller.countrySelectedID = controller.countryCode[i];
          controller.getState(controller.countrySelectedID.toString());
          controller.getAffiliation(controller.countrySelectedID!);
          controller.update();
        }
      }
    }
  }

  callbackState(varTopic) {
    for (var i = 0; i < controller.stateList.length; i++) {
      if (i == 0) {
        controller.stateSelected = null;
        controller.stateSelectedID = null;
      } else {
        if (controller.stateList[i] == varTopic) {
          controller.stateSelected = controller.stateList[i];
          controller.stateSelectedID = controller.stateCode[i];
          controller.getCity(controller.stateSelectedID!);
          controller.update();
        }
      }
    }
  }

  // Function callbackAffiliation;
  callbackAffiliation(data) {
    for (var i = 0; i < controller.affiliationList.length; i++) {
      if (i == 0) {
        controller.affiliationNameSelected = null;
        controller.affiliationCodeSelected = null;
      } else {
        if (controller.affiliationList[i].toString() == data.toString()) {
          controller.affiliationNameSelected = controller.affiliationList[i];
          controller.affiliationCodeSelected = controller.affiliationCode[i];
          controller.update();
        }
      }
    }
  }

  callbackCity(varTopic) {
    for (var i = 0; i < controller.cityList.length; i++) {
      if (i == 0) {
        controller.citySelected = null;
        controller.citySelectedID = null;
      } else {
        if (controller.cityList[i].toString() == varTopic.toString()) {
          controller.citySelected = controller.cityList[i];
          controller.citySelectedID = controller.cityCode[i];
          controller.geInstitution(controller.citySelectedID!);
          controller.update();
        }
      }
    }
  }

  callbackInstitution(varTopic) {
    if (varTopic.toString().contains("Select")) {
    } else {
      controller.institutionSelected = varTopic.toString();
    }
    controller.update();
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
