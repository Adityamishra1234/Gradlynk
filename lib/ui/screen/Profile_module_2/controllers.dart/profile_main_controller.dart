import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/profileDataValidatorModel.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/englishtest.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/othertestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/passport.dart';
import 'package:studentpanel/ui/screen/Profile_Module/courseinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/englishtestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/othertestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/passportdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/qualificationdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/relativeinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/travinghistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/workhistory.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/contact_information_in_popup.dart';
import 'package:studentpanel/widgets/custom_profile_dialogue/custom_profile_dialogue.dart';

class ProfileViewMainController extends GetxController {
  ApiServices api = ApiServices();
  var data = ProfileDataValidatorModel().obs;

  RxInt indexOfSelection = 0.obs;
  RxBool popupIsOpen = false.obs;

  RxBool loading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // loading.value = true;
    // var x = await api.profileDataValidation(78623);
    // var z = await ProfileDataValidatorModel.fromJson(x);
    // data.value = z;
    // loading.value = false;
  }

  getDailog(int number, BuildContext context) {
    switch (number) {
      case 0:
        return showDialog(
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableEdit: false,
                enableSaveNext: false,
                onEdit: () {},
                title: "Course Info",
                onTap: () {
                  Get.back();
                  getDailog(1, context);
                },
                child: CourseInformationCopy()));

      case 1:
        return showDialog(
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableEdit: false,
                enableSaveNext: false,
                onEdit: () {},
                title: "Qualification Details",
                onTap: () {
                  Get.back();
                  getDailog(2, context);
                },
                child: QualificationDetailsCopy()));
      case 2:
        return showDialog(
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableEdit: false,
                enableSaveNext: false,
                onEdit: () {},
                title: "Work History",
                onTap: () {
                  Get.back();
                  getDailog(3, context);
                },
                child: WorkHistoryCopy()));
      case 3:
        return showDialog(
            context: context,
            builder: (_) {
              bool? editButton = false;
              return StatefulBuilder(
                  builder: (thisLowerContext, innerSetState) {
                return CustomProfileDialogue(
                    enableEdit: true,
                    enableSaveNext: true,
                    onEdit: () {
                      innerSetState(() {
                        editButton = true;
                      });
                    },
                    title: "Language Test",
                    onTap: () async {
                      Get.back();
                      var res =
                          await Get.find<EnglishTestController>().saveButton();
                      if (res != false) {
                        getDailog(4, context);
                      }
                    },
                    child: EnglishTestDetails(
                      editButton: editButton,
                    ));
              });
            });
      case 4:
        return showDialog(
            context: context,
            builder: (_) {
              bool? editButton = false;
              return StatefulBuilder(
                  builder: (thisLowerContext, innerSetState) {
                return CustomProfileDialogue(
                    enableEdit: true,
                    enableSaveNext: true,
                    onEdit: () {
                      innerSetState(() {
                        editButton = true;
                      });
                    },
                    title: "Qualifying Test",
                    onTap: () async {
                      Get.back();
                      var res = await Get.find<OtherTestDetailsController>()
                          .saveButton();
                      if (res == true) {
                        getDailog(5, context);
                      }
                    },
                    child: OthertestDetail(
                      editButton: editButton,
                    ));
              });
            });

      case 5:
        return showDialog(
            context: context,
            builder: (_) {
              bool? editButton = false;
              return StatefulBuilder(
                  builder: (thisLowerContext, innerSetState) {
                return CustomProfileDialogue(
                    enableEdit: true,
                    enableSaveNext: true,
                    onEdit: () {
                      innerSetState(() {
                        editButton = true;
                      });
                    },
                    title: "Passport",
                    onTap: () async {
                      Get.find<PassportController>().updateData = false;
                      Get.find<PassportController>().update();
                      var res =
                          await Get.find<PassportController>().saveButton();
                      if (res == true) {
                        Get.back();
                        getDailog(6, context);
                      }
                    },
                    child: PassportDetails(
                      editButton: editButton,
                    ));
              });
            });

      case 6:
        return showDialog(
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableSaveNext: false,
                onEdit: () {},
                title: "Travel History",
                onTap: () {
                  Get.back();
                  getDailog(7, context);
                },
                child: TravingHistory()));

      case 7:
        return showDialog(
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableSaveNext: false,
                onEdit: () {},
                title: "Relative Info",
                onTap: () {
                  Get.back();
                  getDailog(1, context);
                },
                child: RelativeInformation()));

      default:
        print('choose a different number!');
    }
  }
}
