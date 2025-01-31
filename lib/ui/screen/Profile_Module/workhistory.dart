import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/workhistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/workhistoryview.dart';
import 'package:studentpanel/ui/screen/Profile_Module/workhistorywidget.dart';

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
                callbackWorkingForm: callbackWorkingFrom,
                callbackWorkingTill: callbackWorkingTill,
              ));
  }

  // Funcation
  callback(varTopic) {
    controller.setViewDetails(true);
  }

  callbackIndustry(varTopic) {
    for (var i = 0; i < controller.industriesList.length; i++) {
      if (controller.industriesList[i].toString() == varTopic) {
        controller.industryNameSelected = controller.industriesList[i];
        controller.industryNameCode = int.parse(controller.industriesCode[i]);
      }
    }
    print(controller.industryNameSelected);
    controller.update();
  }

  callbackEmployementType(varTopic) {
    for (var i = 0; i < controller.employmentTypeList.length; i++) {
      if (controller.employmentTypeList[i].toString() == varTopic) {
        controller.employementTypeSelected = controller.employmentTypeList[i];
        controller.employementTypeCode = i + 1;
      }
    }
    controller.update();
  }

  callbackViewDetails(varTopic) {
    controller.setViewDetails(varTopic);
  }

  callbackDeleteButton(data) {
    controller.workHistoryViewModelList.removeAt(data);
    controller.updatedWorkHistory("delete");
    controller.update();
  }

  callbackEditButton(data) {
    controller.index = data;
    controller.updateForEdit.value = false;
    controller.viewDetails.value = false;
    controller.getUpdateWorkHistory();
  }

  callbackAdded(data) async {
    await controller.updatedWorkHistory("added");
    controller.update();
  }

  callbackUpdate(data) {
    controller.updatedWorkHistory("updated");
    controller.updateForEdit.value = true;
    controller.update();
  }

  callbackWorkingFrom(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.workingFromSelected = date[0] + "-" + date[1] + '-' + date[2];
    controller.workingFromSelected = data;
    controller.update();
  }

  callbackWorkingTill(data) {
    // String temp = data.toString().split(' ')[0];
    // List<String> date = temp.split('-');
    // controller.workingTillSelected = date[0] + "-" + date[1] + '-' + date[2];
    controller.workingTillSelected = data;
    controller.update();
  }
}
