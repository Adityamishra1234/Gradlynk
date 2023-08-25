import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api_services.dart';
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
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:new_app_version_alert/new_app_version_alert.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

class BaseController extends GetxController with StateMixin {
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
  RxList<CarouselListModel> carouselList = <CarouselListModel>[].obs;
  EventZoneStatus meetingZoneStatus = EventZoneStatus();
  List eventlist = [];

  @override
  void onInit() async {
    super.onInit();

    await profiledetail();
    await caraouselData();
    await profileDataValidator();

    change(null, status: RxStatus.success());
  }

  var data = ProfileDataValidatorModel().obs;
  RxBool loading = false.obs;

  bool loadinValidatorDataForDashboard = false;
  profileDataValidator() async {
    ///todo
    ///
    ///
    try {
      loadinValidatorDataForDashboard = true;
      update();
      // print(Get.find<BaseController>().model1.id!);
      var x = await apiServices.profileDataValidation(model1.id!);
      var z = ProfileDataValidatorModel.fromJson(x);
      data.value = z;
      loadinValidatorDataForDashboard = false;
      return z;
      update();
    } on Exception catch (e) {
      await apiServices.errorHandle(
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

    print(res);
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
            logout();
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
          loadingStudentPanelData1 = true.obs;

          update();
        }
      } else {
        Get.toNamed(Login.routeNamed);
      }

      getNotificatin(model1.id.toString());
    } on Exception catch (e) {
      await apiServices.errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      // TODO
    }
  }

  checkShowLetsGetStarted() async {
    if (model1.student_consent == 0) {
      change(null, status: RxStatus.success());

      Get.offAll(LetsGetStartedMainView());
    }
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
    Get.offAll(const LoginCopy());
    // Get.toNamed(LoginCopy.routeNamed);
    // } else {
    //   sharedPreferences.clear();
    //   Get.toNamed(LoginScreen.routeNamed);
    // }
  }

  eventZone(String end_id) async {
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
    update();
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
}
