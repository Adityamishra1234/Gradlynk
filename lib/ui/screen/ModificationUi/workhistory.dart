import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/workhistory.dart';
import 'package:studentpanel/ui/screen/ModificationUi/workhistoryview.dart';
import 'package:studentpanel/ui/screen/ModificationUi/workhistorywidget.dart';

class WorkHistoryCopy extends StatelessWidget {
  WorkHistoryCopy({Key? key}) : super(key: key);
  var controller = Get.put(WorkHistoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkHistoryController>(
        builder: (_) => _.viewDetails.value == true
            ? WorkHistoryView(
                calbackEditButton: callbackEditButton,
                callbackDeleteButton: callbackDeleteButton,
                callbackAddWorkHistory: callbackViewDetails,
                model: _.workHistoryViewModelList,
              )
            : WorkHistoryWidget(
                update: _.updateForEdit.value,
                index: _.index,
                callbackAdded: callbackAdded,
                callbackUpdate: callbackUpdate,
                callbackEmployementType: callbackEmployementType,
                callbackIndustry: callbackIndustry,
              ));
  }

  // Funcation
  callback(varTopic) {
    controller.setViewDetails(true);
  }

  callbackIndustry(varTopic) {
    for (var i = 0; i < controller.industriesList.length; i++) {
      if (controller.industriesList[i] == varTopic) {
        controller.industryNameSelected = controller.industriesList[i];
        controller.industryNameCode = int.parse(controller.industriesCode[i]);
      }
    }
  }

  callbackEmployementType(varTopic) {
    for (var i = 0; i < controller.employmentTypeList.length; i++) {
      if (controller.employmentTypeList[i] == varTopic) {
        controller.employementTypeSelected = controller.employmentTypeList[i];
        controller.employementTypeCode = i + 1;
      }
    }
  }

  callbackViewDetails(varTopic) {
    controller.setViewDetails(varTopic);
  }

  callbackDeleteButton(data) {
    controller.workHistoryViewModelList.removeAt(data);
    controller.updatedWorkHistory();
    controller.update();
  }

  callbackEditButton(data) {
    controller.index = data;
    controller.updateForEdit.value = false;
    controller.viewDetails.value = false;
    controller.update();
  }

  callbackAdded(data) {
    controller.updatedWorkHistory();
    controller.update();
  }

  callbackUpdate(data) {
    controller.updatedWorkHistory();
    controller.updateForEdit.value = true;
    controller.update();
  }
}
