import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/services/baseservice.dart';
import 'package:studentpanel/ui/models/carouselListModel.dart';
import 'package:studentpanel/ui/models/notificationmodel.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/profileDataValidatorModel.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/screen/dashboard/models/evenZonestatusModel.dart';
import 'package:studentpanel/ui/screen/fund/model/fundPlanner.dart';
import 'package:studentpanel/ui/screen/letsGetStarted/letsGetStartedMainVIew.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:studentpanel/ui/screen/mark_attendance/code_screen.dart';
import 'package:studentpanel/ui/screen/mark_attendance/intake_screen.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:new_app_version_alert/new_app_version_alert.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/data/models/saveVisitSheetDeskResponse.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/custom_dialog_box.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/dashboardeventSection.dart';

class BaseController extends GetxController with StateMixin {
  api apiServices = ApiServices();
  StudentPanel model1 = StudentPanel();
  RxBool loadingStudentPanelData1 = false.obs;
  PersonalInformationModel personalModal = PersonalInformationModel();
  final prefs = SharedPreferences.getInstance();
  List<UpcomingEventModel>? upcomingModel;
  RxBool loadingUpcomingEvents = false.obs;
  List<NotificationModel>? notificationModel;
  RxBool loadingnotificationModel = false.obs;
  List<String> countrylist = [];
  List<int> countryid = [];
  bool dashboard = false;
  RxList<CarouselListModel> carouselList = <CarouselListModel>[].obs;
  EventZoneStatus meetingZoneStatus = EventZoneStatus();
  List eventlist = [];
  bool showDailogEventZone = false;

  @override
  void onInit() async {
    super.onInit();

    // List<Future> futures = [
    //   profiledetail(),
    //   caraouselData(),
    // ];
    // await Future.wait(futures);
    change(null, status: RxStatus.success());
  }

  getDataAgain() async {
    await profiledetail();
    await caraouselData();
  }

  var data = ProfileDataValidatorModel().obs;
  RxBool loading = false.obs;

  bool loadinValidatorDataForDashboard = false;
  profileDataValidator() async {
    try {
      loadinValidatorDataForDashboard = true;


      var x = await apiServices.profileDataValidation(model1.id!);
      print("this is coming : ${x}");
      var z = ProfileDataValidatorModel.fromJson(x);
      data.value = z;

      calculateProfilePercentage();
      loadinValidatorDataForDashboard = false;
      update();

      return z;
    } on Exception catch (e) {
      await StudentPanelBase().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      // TODO
    }
    // loading.value = false;
  }

  getUpdateNotitifcation() {
    NewVersionCheck.newVersionCheck(Get.context,
        "com.downtownengineers.gradlynk", "com.downtownengineers.gradlynk");
  }

  caraouselData() async {
    var res = await apiServices.caraouselList();
    carouselList.value = List<CarouselListModel>.from(
        res.map((e) => CarouselListModel.fromJson(e)));
    update();
  }

  profiledetail() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? phonenumber = sharedPreferences.getString("phonenumber");
      if (phonenumber != null) {
        var res = await apiServices.dashboard(
            Endpoints.baseUrl!, "${Endpoints.dashboard!}$phonenumber");
        if (res != null) {
          model1 = res;

          if (model1.is_block == 1) {
            getToast(SnackBarConstants.userBlock!);
            // logout();
          } else {
            // if(model1.p)
            if (model1.otherCountryOfInterest != null) {
              for (var element in model1.otherCountryOfInterest!) {
                countrylist.add("Select your country");
                countryid.add(0);
                countryid.add(element.id!);
                countrylist.add(element.countryName!);
              }
            }
            if (getNUllChecker(model1.countryName) == false) {
              countrylist.add(model1.countryName!);
            }
            if (getNUllChecker(model1.countryID) == false) {
              countryid.add(model1.countryID!);
            }
          }

          await checkShowLetsGetStarted();
          await eventZone(model1.id.toString());
          await getFundPlannerData();
          await profileDataValidator();

          loadingStudentPanelData1 = true.obs;

          // model1.service_id = 3;
          update();
        } else {
          logout();
        }
      } else {
        logout();
      }

      getNotificatin(model1.id.toString());
    } on Exception catch (e) {
      change(null, status: RxStatus.loadingMore());
      await StudentPanelBase().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      // TODO
    }
  }

  checkShowLetsGetStarted() async {
    // if (model1.student_consent == 1) {
    change(null, status: RxStatus.success());
    var res = await apiServices.whichConsentForm(model1.id.toString());

    var map = Map<String, bool>.from(res);

    List<bool> questionsToShowList = [];

    questionsToShowList.addAll(map.values.toList());

    if (model1.service_id == 2) {
      if (questionsToShowList[1] == false && model1.student_consent == 1) {
        // Get.offAllNamed(DashBoard.routeNamed);
      } else {
        Get.offAll(LetsGetStartedMainView());
      }
    } else {
      if (model1.student_consent == 1) {
        // Get.offAllNamed(DashBoard.routeNamed);
      } else {
        Get.offAll(LetsGetStartedMainView());
      }
    }

    // if (questionsToShowList[1] == true )   {
    // }else if( questionsToShowList[1] == false ){

    // }

    // }
  }

  getPersonalModal(PersonalInformationModel model) {
    personalModal = model;
    update();
  }

  upcomingEvents() async {
    var res = await apiServices.getUpComingEvent(Endpoints.upcomingEvents!);
    if (res != null) {
      upcomingModel = res;
      loadingUpcomingEvents = true.obs;
      update();
    }
  }

  getNotificatin(String id) async {
    var res = await apiServices
        .getNotification("${Endpoints.notificationForUser!}$id");
    if (res != null) {
      notificationModel = res;
      loadingnotificationModel = true.obs;
      update();
    }
  }

  logout() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString("token").toString();
      String id = sharedPreferences.getString("id").toString();
      var res = await apiServices.logoutPostNull(await logoutEndpoint());

      Get.deleteAll();
      sharedPreferences.clear();
      Get.offAll(const LoginCopy());
    } catch (e) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.clear();
      Get.offAll(const LoginCopy());
    }

    // Get.toNamed(LoginCopy.routeNamed);
    // } else {
    //   sharedPreferences.clear();
    //   Get.toNamed(LoginScreen.routeNamed);
    // }
  }

  eventZone(String end_id) async {
    // change(null, status: RxStatus.loading());
    eventlist = [];
    var res = await apiServices.getEventZone(Endpoints.eventZone! + end_id);
    if (res != null) {
      meetingZoneStatus = res;
      if (meetingZoneStatus.campaignDetails != null) {
        meetingZoneStatus.campaignDetails!.forEach((element) {
          eventlist.add(element.campaignName);
        });
      }
    }
    eventlist = eventlist.toSet().toList();

    if (meetingZoneStatus.markAttendance == true ||
        meetingZoneStatus.expressPass == true ||
        meetingZoneStatus.expressPassGenerated == true) {
      if (showDailogEventZone == false) {
        eventZoneDrawerPopUp(
            Get.context!,
            meetingZoneStatus.markAttendance ?? false,
            meetingZoneStatus.expressPass ?? false,
            meetingZoneStatus.expressPassGenerated ?? false);
        showDailogEventZone = true;
        update();
        // getDailogEventZone(Get.context!);
      }
    }
    // change(null, status: RxStatus.success());
    update();
  }

  List<Data> notAssignedDesk = [];
  List<Data> assignedDesk = [];

  List<int> temporarySelectedDeskIndex = [];
  bool showAddAssignOption = false;

  List<String> convertString(String inputString) {
    // Remove leading and trailing double quotes
    // Remove the leading and trailing double quotes
    inputString = inputString.substring(1, inputString.length - 1);

    // Split the string by commas, removing any extra spaces
    List<String> items =
        inputString.split(",").map((item) => item.trim()).toList();

    // Remove the leading and trailing double quotes from each item
    for (int i = 0; i < items.length; i++) {
      items[i] = items[i].substring(1, items[i].length - 1);
    }

    return items;
  }

  getEventDeskListData({required String id}) async {
    var res = await apiServices.getVisitSheetDesks(id);

    var data = SaveVisitSheetDeskResponse.fromJson(res);

    notAssignedDesk = [];
    assignedDesk = [];
    if (data.data != null) {
      for (var i = 0; i < data.data!.length; i++) {
        notAssignedDesk.add(data.data![i]);
      }
    }

    List<String> temporaryAssignedDesk = [];
    print(getNUllChecker(data.assignedDesk));
    if (!getNUllChecker(data.assignedDesk)) {
      temporaryAssignedDesk = await convertString(data.assignedDesk!);
      print(temporaryAssignedDesk);
      for (var i = 0; i < temporaryAssignedDesk!.length; i++) {
        for (var j = 0; j < data.data!.length; j++) {
          print(data.data![j].id.toString());
          print(temporaryAssignedDesk[i].toString());

          if (data.data![j].id.toString() ==
              temporaryAssignedDesk[i].toString()) {
            assignedDesk.add(data.data![j]);
          }
        }
        // var tempData = data.data!
        //     .where((element) => element.id == temporaryAssignedDesk[i])
        //     .toList();
        // assignedDesk = tempData;
      }
    }

    print(assignedDesk);

    if (assignedDesk.length != 0) {
      showAddAssignOption = false;
    } else {
      showAddAssignOption = true;
    }

    update();
  }

  saveEventDeskData() async {
    List<String> stringData = [];

    for (var i = 0; i < temporarySelectedDeskIndex.length; i++) {
      stringData
          .add(notAssignedDesk[temporarySelectedDeskIndex[i]].id!.toString());
    }

    var res = await apiServices.saveVisitSheetDesk(
        deskIds: stringData,
        enq_id: Get.find<BaseController>().model1.id.toString());

    getEventDeskListData(id: Get.find<BaseController>().model1.id.toString());
  }

  fundPlanner fundplanner = fundPlanner();
  double total_fund = 0.0;
  getFundPlannerData() async {
    total_fund = 0.0;
    try {
      var res = await apiServices
          .getFundPlannerData(Get.find<BaseController>().model1.id.toString());
      if (res != null) {
        fundplanner = fundPlanner.fromJson(res);
        if (fundplanner.fundPlannersData != null) {
          for (var i = 0; i < fundplanner.fundPlannersData!.length; i++) {
            total_fund = total_fund +
                double.parse(fundplanner.fundPlannersData![i].amount ?? "");
          }
        }
      }
      print(total_fund);
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  calculateProfilePercentage() {
    var percentage = 0.0;
    var singlepartCompletePercentage = 0.0;

    if (model1.service_id == 1) {
      singlepartCompletePercentage = 14.25;
    } else if (model1.service_id == 2) {
      singlepartCompletePercentage = 11.11;
    } else if (model1.service_id == 3) {
      singlepartCompletePercentage = 12.25;
    }
    if (data.value.validateIconForCourseInfo == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    if (data.value.validateIconForQualificationInfo == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    if (data.value.validateIconForWorkHistory == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    if (data.value.validateIconForEnglishTest == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    if (data.value.validateIconForOtherTest == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    if (data.value.validateIconForPassport == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    if (data.value.validateIconForTravelHistory == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    if (data.value.validateIconForRelativeInfo == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    if (data.value.validateIconForPersonalInfo == "1") {
      percentage = percentage + singlepartCompletePercentage;
    }
    data.value.totalPercentageComplete = percentage.round();
    update();
  }
}
