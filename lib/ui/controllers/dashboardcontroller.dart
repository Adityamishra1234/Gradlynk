import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/dropdownmodel.dart';
import 'package:studentpanel/ui/models/getAllTestimonialsModel.dart';
import 'package:studentpanel/ui/models/newsandupdate.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/models/upcomingholiday.dart';
import 'package:studentpanel/ui/screen/dashboard/models/youtubevideoModel.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  DropDownModel? dropDownModel;
  ApiServices apiservices = ApiServices();
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

  List<YoutubeVideoModel> youtubeVideoModel = [];

  @override
  void onInit() async {
    await upcomingEvents();
    await getTestimonials();
    await getYoutubeVideos();

    super.onInit();
  }

  List youtubeVideoLink = [];
  getYoutubeVideos() async {
    var res = await apiservices.getYoutubeVideoLink();
    if (res != null) {
      youtubeVideoModel = res;
      // youtubeVideoLink = res;

      update();
    }
  }

  List<GetAllTestimonialsModel> testimonialsList = [];
  getTestimonials() async {
    var res = await apiservices.getAllTestimonials();
    if (res != null) {
      var data = List<GetAllTestimonialsModel>.from(
          res.map((e) => GetAllTestimonialsModel.fromJson(e)));

      testimonialsList = data;
      loadingUpcomingEvents = true.obs;
      update();
    }
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

// Notification Api call
}
