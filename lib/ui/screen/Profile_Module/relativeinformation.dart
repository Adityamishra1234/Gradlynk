import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/relativeinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/relativeinformationWidget.dart';
import 'package:studentpanel/ui/screen/Profile_Module/relativeinformationview.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class RelativeInformation extends StatelessWidget {
  RelativeInformation({Key? key}) : super(key: key);
  var controller = Get.put(RelativeInformationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RelativeInformationController>(
        builder: (_) => _.viewDetails.value == true
            ? RelativeInformationView(
                callbackEdit: callbackEdit,
                callbackDelete: callbackDelete,
                callbackAddRelativeInfo: callbackAddRelativeInfro,
                model: controller.modelList,
              )
            : Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 30,
                        child: TextButton(
                            onPressed: () {
                              _.setViewDetails(true);
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "View Details",
                              fontSize: 12,
                              textColor: ThemeConstants.orangeColor,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                      child: RelativeInformationWidget(
                    index: _.index,
                    // interestedCountry: _.modelList[_.index].anyRelativeCountryInterested,
                    updatForEdit: _.updateForEdit.value,
                    callbackAnyRelativeCountryInterested:
                        callbackAnyRelativeCountryInterested,
                    callbackCitizenShip: callbackCitizenShip,
                    callbackCountry: callbackCountry,
                    callbackRelation: callbackRelation,
                  )),
                ],
              ));
  }

// Funcation
  callbackAnyRelativeCountryInterested(varTopic) {
    if (varTopic == "Yes") {
      controller.anyRelativeCountryInterestedSelected = "1";
    } else {
      controller.anyRelativeCountryInterestedSelected = "2";
    }
    controller.update();
  }

  callbackCountry(varTopic) {
    controller.countryNameSelected = varTopic;
    for (var i = 0; i < controller.countryList.length; i++) {
      if (controller.countryList[i] == varTopic) {
        controller.countryNameCodeSelected = controller.countryCode[i];
      }
    }
    controller.update();
  }

  callbackCitizenShip(varTopic) {
    controller.citizenShipStatusSelected = varTopic;
    controller.update();
  }

  callbackRelation(varTopic) {
    controller.relationSelected = varTopic;
    controller.update();
  }

  callbackAddRelativeInfro(varTopic) {
    controller.setViewDetails(false);
  }

  callbackDelete(data) {
    controller.modelList.removeAt(data);
    controller.updateRelativeInformation(
        Get.find<BaseController>().model1.id.toString(), "1", "delete");
    controller.update();
  }

  callbackEdit(data) {
    controller.index = data;
    controller.updateForEdit.value = false;
    controller.viewDetails.value = false;
    controller.updateButton();
    controller.update();
  }
}
