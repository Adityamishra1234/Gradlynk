import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/profileDataValidatorModel.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
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
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/widgets/custom_profile_dialogue/custom_profile_dialogue.dart';

class ContactInformationInPopUpController extends GetxController
    with StateMixin {
  ApiServices apiServices = ApiServices();

// Selected fields
//Name
  String? genderSelected;
  String? maritalStatusSelected;
  String? countrySelected;
  String? stateSelected;
  String? citySelected;
  String? dob;
  String? selectedChildCount;

//Code
  int? genderIdSelected,
      maritalStatusIdSelected,
      childrenCountSelected,
      countryIdSelected,
      stateIdSelected,
      cityIdSelected;

//  Dropdown Fields
  List<String> countryList = [];
  List<String> countryCode = [];
  List<String> stateList = [];
  List<String> stateCode = [];
  List<String> cityList = [];
  List<String> cityCode = [];
  List martialStatusList = [];
  List martialStatusCode = [];

  //Loading
  RxBool loadingCountry = false.obs;
  RxBool loadingState = false.obs;
  RxBool loadingCity = false.obs;
  RxBool loadingmartialStatus = false.obs;
  // 0=> ,1=> first time,2=> loading,3=> normal
  RxInt loadingStudentPanelData = 0.obs;

  StudentPanel model = StudentPanel();

  var profileValidationData = ProfileDataValidatorModel();

  bool loading = false;
  @override
  void onInit() async {
    List<Future> futures = [
      getCountry(),
      getMartialStatus(),
      profiledetail(),
      profileDataValidator()
    ];

    await Future.wait(futures);

    super.onInit();
    change(null, status: RxStatus.success());
  }

  profileDataValidator() async {
    // change(null, status: RxStatus.loading());

    var x = await Get.find<BaseController>().data.value;
    // var x = await apiservice
    //     .profileDataValidation(Get.find<BaseController>().model1.id!);
    // var z = ProfileDataValidatorModel.fromJson(x);
    profileValidationData = x;

    change(null, status: RxStatus.success());
  }

  profiledetail() async {
    try {
      var res = await apiServices.dashboard(Endpoints.baseUrl!,
          "${Endpoints.dashboard!}${Get.find<BaseController>().model1.mobile.toString()}");
      if (res != null) {
        model = res;
        loadingStudentPanelData = 1.obs;
        update();
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getCountry() async {
    try {
      loadingCountry.value == false;
      var res =
          await apiServices.dropDown1(Endpoints.baseUrl!, Endpoints.country!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        countryList.add("Select Country");
        countryCode.add("0");
        for (var element in temp) {
          countryList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          countryCode.add(element.toString());
        }

        update();
      }
      loadingCountry.value = true;
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getMartialStatus() async {
    try {
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.maritalStatus!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        martialStatusList.add("Select Martial Status");
        martialStatusCode.add(0);
        martialStatusCode.addAll(map.keys.toList());
        martialStatusList.addAll(map.values.toList());
        loadingmartialStatus.value = true;
        update();
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getState(String countryId) async {
    try {
      loadingCity.value = false;
      cityCode = [];
      cityList = [];
      citySelected = null;
      cityIdSelected = null;
      loadingState.value = false;
      stateList = [];
      stateCode = [];
      stateSelected = null;
      stateIdSelected = null;
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.state! + countryId);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        stateList.add("select State");
        stateCode.add("0");
        for (var element in temp) {
          stateList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          stateCode.add(element.toString());
        }

        loadingState = true.obs;
      }
      update();
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getCity(String state) async {
    try {
      loadingCity.value = false;
      cityCode = [];
      cityList = [];
      citySelected = null;
      cityIdSelected = null;
      List tempList;
      var res = await apiServices.dropDown1(
          Endpoints.baseUrl!, Endpoints.city! + state);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        cityList.add("Select city");
        cityCode.add("0");
        for (var element in temp) {
          cityList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          cityCode.add(element.toString());
        }
        loadingCity = true.obs;
      }
      update();
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  updateData(PersonalInformationModel personalInformationModel) async {
    change(null, status: RxStatus.loading());
    await apiServices.personalInformationDataUpdate(
        personalInformationModel, Endpoints.personalDetailUpdate);
    change(null, status: RxStatus.success());
  }

  getDailog(int number, BuildContext context) {
// Services id Modification

    if ((number == 0) &&
        (Get.find<BaseController>().model1.service_id == 1 ||
            Get.find<BaseController>().model1.service_id == 3)) {
      number++;
    }
    if ((number == 4) && Get.find<BaseController>().model1.service_id == 3) {
      number++;
    }
    switch (number) {
      case 0:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                backButton: () {
                  Get.find<BaseController>().calculateProfilePercentage();
                  update();
                  Get.back();
                },
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
                  Get.find<BaseController>().calculateProfilePercentage();
                  getDailog(1, context);
                },
                child: CourseInformationCopy())).whenComplete(
            () => Get.find<BaseController>().calculateProfilePercentage());

      case 1:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                backButton: () {
                  Get.find<BaseController>().calculateProfilePercentage();
                  update();
                  Get.back();
                },
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
                  Get.find<BaseController>().calculateProfilePercentage();
                  getDailog(2, context);
                },
                child: QualificationDetailsCopy())).whenComplete(
            () => Get.find<BaseController>().calculateProfilePercentage());
      case 2:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                backButton: () {
                  Get.find<BaseController>().calculateProfilePercentage();
                  update();
                  Get.back();
                },
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
                  Get.find<BaseController>().calculateProfilePercentage();
                  getDailog(3, context);
                },
                child: WorkHistoryCopy())).whenComplete(
            () => Get.find<BaseController>().calculateProfilePercentage());
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
                        backButton: () {
                          Get.find<BaseController>()
                              .calculateProfilePercentage();
                          update();
                          Get.back();
                        },
                        enableEdit: true,
                        enableSaveNext: true,
                        onEdit: () {
                          innerSetState(() {
                            editButton = true;
                          });
                        },
                        title: "Language Test",
                        onTap: () async {
                          var res = await Get.find<EnglishTestController>()
                              .saveButton();
                          if (res != false) {
                            Get.back();
                            Get.find<ContactInformationInPopUpController>()
                                .profileDataValidator();
                            Get.find<BaseController>()
                                .calculateProfilePercentage();
                            getDailog(4, context);
                          }
                        },
                        child: EnglishTestDetails(
                          editButton: editButton,
                        ));
                  });
                })
            .whenComplete(
                () => Get.find<BaseController>().calculateProfilePercentage());
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
                        backButton: () {
                          Get.find<BaseController>()
                              .calculateProfilePercentage();
                          update();
                          Get.back();
                        },
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
                            Get.find<BaseController>()
                                .calculateProfilePercentage();
                            getDailog(5, context);
                          }
                        },
                        child: OthertestDetail(
                          editButton: editButton,
                        ));
                  });
                })
            .whenComplete(
                () => Get.find<BaseController>().calculateProfilePercentage());

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
                        backButton: () {
                          Get.find<BaseController>()
                              .calculateProfilePercentage();
                          update();
                          Get.back();
                        },
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
                            Get.find<BaseController>()
                                .calculateProfilePercentage();
                            getDailog(6, context);
                          }
                        },
                        child: PassportDetails(
                          editButton: editButton,
                        ));
                  });
                })
            .whenComplete(
                () => Get.find<BaseController>().calculateProfilePercentage());

      case 6:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                backButton: () {
                  Get.find<BaseController>().calculateProfilePercentage();
                  update();
                  Get.back();
                },
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
                  Get.find<BaseController>().calculateProfilePercentage();
                  getDailog(7, context);
                },
                child: TravingHistory())).whenComplete(
            () => Get.find<BaseController>().calculateProfilePercentage());

      case 7:
        return showAnimatedDialog(
            animationType: DialogTransitionType.slideFromBottomFade,
            curve: Curves.easeInOutQuart,
            context: context,
            builder: (_) => CustomProfileDialogue(
                backButton: () {
                  Get.find<BaseController>().calculateProfilePercentage();

                  update();
                  Get.back();
                },
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
                  Get.find<BaseController>().calculateProfilePercentage();
                  Get.back();
                },
                child: RelativeInformation())).whenComplete(
            () => Get.find<BaseController>().calculateProfilePercentage());

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
                        backButton: () {
                          Get.find<BaseController>()
                              .calculateProfilePercentage();
                          update();
                          Get.back();
                        },
                        enableEdit: true,
                        enableSaveNext: true,
                        onEdit: () {
                          innerSetState(() {
                            editButton = true;
                          });
                        },
                        title: "Mandatory Details",
                        onTap: () async {
                          var res =
                              await Get.find<ContactInformationController>()
                                  .saveButton();
                          if (res == true) {
                            Get.back();
                            Get.find<BaseController>()
                                .calculateProfilePercentage();
                            getDailog(0, context);
                          }
                          // Get.back();
                        },
                        child: ContactInformationCopy(
                          editButton: editButton,
                        ));
                  });
                })
            .whenComplete(
                () => Get.find<BaseController>().calculateProfilePercentage());

      default:
        print('choose a different number!');
    }
  }
}
