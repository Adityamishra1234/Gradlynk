import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashids2/hashids2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/notificationmodel.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/screen/Login_Module/LoginScreen.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/updatedialog.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:new_app_version_alert/new_app_version_alert.dart';

class BaseController extends GetxController {
  ApiServices apiServices = ApiServices();
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

  @override
  void onInit() {
    super.onInit();
    profiledetail();
  }

  @override
  onReady() {
    upcomingEvents();
    NewVersionCheck.newVersionCheck(Get.context,
        "com.downtownengineeers.gradlynk", "com.downtownengineeers.gradlynk");
  }

  profiledetail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String phonenumber = sharedPreferences.getString("phonenumber").toString();
    var res = await apiServices.dashboard(
        Endpoints.baseUrl!, "${Endpoints.dashboard!}$phonenumber");
    if (res != null) {
      model1 = res;

      if (model1.is_block == 1) {
        getToast("User will blocked by Gradlynk");
        logout();
      } else {
        if (model1.otherCountryOfInterest != null) {
          model1.otherCountryOfInterest!.forEach((element) {
            countrylist.add("Select your country");
            countryid.add(0);
            countryid.add(element.id!);
            countrylist.add(element.countryName!);
          });
        }
        if (getNUllChecker(model1.countryName) == false) {
          countrylist.add(model1.countryName!);
        }
        if (getNUllChecker(model1.countryID) == false) {
          countryid.add(model1.countryID!);
        }
      }

      loadingStudentPanelData1 = true.obs;
      update();
    }
    getNotificatin(model1.id.toString());
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token").toString();
    String id = sharedPreferences.getString("id").toString();
    // var res = await apiServices.logout(
    //     Endpoints.baseUrl!, Endpoints.logout! + id, token);
    // if (res == true) {
    Get.deleteAll();
    sharedPreferences.clear();
    Get.toNamed(LoginCopy.routeNamed);
    // } else {
    //   sharedPreferences.clear();
    //   Get.toNamed(LoginScreen.routeNamed);
    // }
  }
}
