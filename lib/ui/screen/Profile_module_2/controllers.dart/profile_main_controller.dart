import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/profileDataValidatorModel.dart';
import 'package:studentpanel/ui/screen/Profile_Module/contactinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/QualificationDetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/contactinformationcontroller.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/englishtest.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/othertestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/passport.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/relativeinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/travelhistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/workhistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/courseinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/englishtestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/othertestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/passportdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/qualificationdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/relativeinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/travinghistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/workhistory.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/controllers.dart/contact_information_in_popup_controller.dart';
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
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableEdit: false,
                enableSaveNext: false,
                onEdit: () {},
                title: "Course Info",
                onTap: () async {
                  Get.back();
                  await Future.delayed(const Duration(milliseconds: 200));
                  // await Future.delayed(const Duration(milliseconds: 200));
                  Get.find<ContactInformationInPopUpController>()
                      .profileDataValidator();
                  getDailog(1, context);
                },
                child: CourseInformationCopy()));

      case 1:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableEdit: false,
                enableSaveNext: false,
                onEdit: () {},
                showViewDetails: true,
                title: "Qualification Details",
                viewDetail: () {
                  // print('objdddddddect');
                  if (Get.find<QualificationDetailsController>()
                          .addedQualification
                          .value ==
                      false) {
                    Get.find<QualificationDetailsController>()
                        .setaddedQualification(true);
                  } else {
                    Get.find<QualificationDetailsController>()
                        .setaddedQualification(false);
                  }

                  Get.find<QualificationDetailsController>().update();
                },
                onTap: () {
                  Get.back();
                  Get.find<ContactInformationInPopUpController>()
                      .profileDataValidator();
                  getDailog(2, context);
                },
                child: QualificationDetailsCopy()));
      case 2:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableEdit: false,
                enableSaveNext: false,
                onEdit: () {},
                viewDetail: () {
                  if (Get.find<WorkHistoryController>().viewDetails.value ==
                      false) {
                    Get.find<WorkHistoryController>().setViewDetails(true);
                  } else {
                    Get.find<WorkHistoryController>().setViewDetails(false);
                  }

                  Get.find<WorkHistoryController>().update();
                },
                showViewDetails: true,
                title: "Work History",
                onTap: () {
                  Get.back();
                  Get.find<ContactInformationInPopUpController>()
                      .profileDataValidator();
                  getDailog(3, context);
                },
                child: WorkHistoryCopy()));
      case 3:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
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
                      var res =
                          await Get.find<EnglishTestController>().saveButton();
                      if (res != false) {
                        Get.back();
                        Get.find<ContactInformationInPopUpController>()
                            .profileDataValidator();
                        getDailog(4, context);
                      }
                    },
                    child: EnglishTestDetails(
                      editButton: editButton,
                    ));
              });
            });
      case 4:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
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
                      var res = await Get.find<OtherTestDetailsController>()
                          .saveButton();
                      if (res == true) {
                        Get.back();
                        Get.find<ContactInformationInPopUpController>()
                            .profileDataValidator();
                        getDailog(5, context);
                      }
                    },
                    child: OthertestDetail(
                      editButton: editButton,
                    ));
              });
            });

      case 5:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
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
                        Get.find<ContactInformationInPopUpController>()
                            .profileDataValidator();
                        getDailog(6, context);
                      }
                    },
                    child: PassportDetails(
                      editButton: editButton,
                    ));
              });
            });

      case 6:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                showViewDetails: true,
                enableSaveNext: false,
                onEdit: () {},
                viewDetail: () {
                  if (Get.find<TravelHistoryController>().viewDetails.value ==
                      false) {
                    Get.find<TravelHistoryController>().viewDetails.value =
                        true;
                  } else {
                    Get.find<TravelHistoryController>().viewDetails.value =
                        false;
                  }

                  Get.find<TravelHistoryController>().update();
                },
                title: "Travel History",
                onTap: () {
                  Get.back();
                  Get.find<ContactInformationInPopUpController>()
                      .profileDataValidator();
                  getDailog(7, context);
                },
                child: TravingHistory()));

      case 7:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                enableSaveNext: false,
                onEdit: () {},
                title: "Relative Info",
                showViewDetails: true,
                viewDetail: () {
                  if (Get.find<RelativeInformationController>()
                          .viewDetails
                          .value ==
                      false) {
                    Get.find<RelativeInformationController>()
                        .viewDetails
                        .value = true;
                  } else {
                    Get.find<RelativeInformationController>()
                        .viewDetails
                        .value = false;
                  }

                  Get.find<RelativeInformationController>().update();
                },
                onTap: () {
                  Get.find<ContactInformationInPopUpController>()
                      .profileDataValidator();
                  Get.back();
                },
                child: RelativeInformation()));

      case 8:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
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
                    title: "Mandatory Details",
                    onTap: () async {
                      var res = await Get.find<ContactInformationController>()
                          .saveButton();
                      if (res == true) {
                        Get.back();
                        getDailog(0, context);
                      }
                      // Get.back();
                    },
                    child: ContactInformationCopy(
                      editButton: editButton,
                    ));
              });
            });

      default:
        print('choose a different number!');
    }
  }
}
