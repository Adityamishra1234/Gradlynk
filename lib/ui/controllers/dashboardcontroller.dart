import 'dart:io';

import 'package:studentpanel/services/api.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/dropdownmodel.dart';
import 'package:studentpanel/ui/models/getAllTestimonialsModel.dart';
import 'package:studentpanel/ui/models/newsandupdate.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/models/upcomingholiday.dart';
import 'package:studentpanel/ui/screen/FeedBack/feedback.dart';
import 'package:studentpanel/ui/screen/dashboard/models/evenZonestatusModel.dart';
import 'package:studentpanel/ui/screen/dashboard/models/youtubevideoModel.dart';
import 'package:studentpanel/ui/screen/fund/model/fundPlanner.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';

class DashboardController extends GetxController {
  DropDownModel? dropDownModel;
  api apiservices = ApiServices();
  List<NewsAndUpdate>? newsAndUpdatelist;
  List<UpcomingEventModel>? upcomingEventlist;
  List<UpcomingHoliday>? upcomingholidayslist;
  RxBool loadingUpcomingEvents = false.obs;
  RxBool loadingNewsAndUpdates = false.obs;
  RxBool loadingUpcomingHolidays = false.obs;
  RxBool loadingStudentPanelData = false.obs;
  RxBool loadingCreateModel = false.obs;

  RxBool loadingServiceName = false.obs;
  List<String>? model = [];
  EventZoneStatus meetingZoneStatus = EventZoneStatus();
  List eventlist = [];
  List<YoutubeVideoModel> youtubeVideoModel = [];

  @override
  void onInit() async {
    List<Future> futures = [
      getFeedBack(),
      upcomingEvents(),
      getTestimonials(),
      getYoutubeVideos(),
      getUpdateFCMToken()
    ];
    await Future.wait(futures);
    Get.find<BaseController>().update();
    super.onInit();
  }

  List youtubeVideoLink = [];
  bool youtubeVideoLoading = true;
  getYoutubeVideos() async {
    youtubeVideoLoading = true;
    update();
    var res = await apiservices.getYoutubeVideoLink();
    if (res != null) {
      youtubeVideoModel = res;
      // youtubeVideoLink = res;
    }
    youtubeVideoLoading = false;

    update();
  }

  List<GetAllTestimonialsModel> testimonialsList = [];
  bool testimonialsLoading = true;
  getTestimonials() async {
    testimonialsLoading = true;
    update();
    var res = await apiservices.getAllTestimonials();
    if (res != null) {
      var data = List<GetAllTestimonialsModel>.from(
          res.map((e) => GetAllTestimonialsModel.fromJson(e)));
      testimonialsList = data;
      loadingUpcomingEvents = true.obs;
    }
    testimonialsLoading = false;
    update();
  }

  newAndUpdates() async {
    // var res = await apiservices.newAndUpdates(
    //     Endpoints.baseUrl!, Endpoints.newsAndUpdate!);
    // if (res != null) {
    //   newsAndUpdatelist = res;
    //   loadingNewsAndUpdates = true.obs;
    //   update();
    // } else {}
  }

  upcomingEvents() async {
    try {
      var res = await apiservices.getUpComingEvent(Endpoints.upcomingEvents!);
      if (res != null) {
        upcomingEventlist = res;
        loadingUpcomingEvents = true.obs;
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

  upcomingholidays() async {
    // var res = await apiservices.upcomingholidays(
    //     Endpoints.baseUrl!, Endpoints.upcomingHolidays!);
    // if (res != null) {
    //   upcomingholidayslist = res;
    //   loadingUpcomingHolidays = true.obs;
    //   update();
    // } else {}
  }

  removeAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("UserModel");
  }

  updateUserHistory(String reason) {
    // return apiservices.updateUserHistory(
    //     Endpoints.baseUrl!, Endpoints.userHistory!, reason);
  }

  getUpdateFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('token');
    var phonenumber = await getPhoneNumber();
    if (token != null) {
      if (Platform.isAndroid) {
        var res = apiservices.updateFCMToken(phonenumber, token, "2");
      } else {
        var res = apiservices.updateFCMToken(phonenumber, token, "1");
      }
    }
  }

  getFeedBack() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? route = await prefs.getString("Route");
      List temp = [];
      if (route != null) {
        temp = route.split("/");
      }
      if (temp[0] == "FeedbackPage") {
        Get.offAll(FeedbackPage(
          enq_id: temp[1].toString(),
          event_id: temp[2].toString(),
          phoneNumber: temp[3].toString(),
        ));
      }
    } catch (e) {}
  }
}
