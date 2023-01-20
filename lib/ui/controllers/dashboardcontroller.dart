import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/dropdownmodel.dart';
import 'package:studentpanel/ui/models/newsandupdate.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/models/upcomingholiday.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends BaseController {
  DropDownModel? dropDownModel;
  // StudentPanel studentPanel = StudentPanel();
  ApiServices apiservices = ApiServices();
  List<NewsAndUpdate>? newsAndUpdatelist;
  List<UpcomingEvent>? upcomingEventlist;
  List<UpcomingHoliday>? upcomingholidayslist;
  RxBool loadingUpcomingEvents = false.obs;
  RxBool loadingNewsAndUpdates = false.obs;
  RxBool loadingUpcomingHolidays = false.obs;
  RxBool loadingStudentPanelData = false.obs;
  RxBool loadingCreateModel = false.obs;

  RxBool loadingServiceName = false.obs;
  List<String>? model = [];

  // List<String>? createModelForDropdown() {
  //   if (loadingStudentPanelData.value == true) {
  //     for (var element in studentPanel.addtionalDetails!) {
  //       model!.add(element.branchType!);
  //     }
  //   }
  //   model = model!.toSet().toList();
  //   loadingCreateModel = true.obs;
  //   update();

  //   return model;
  // }

  // List<String>? createDropDownData(
  //   String choose1, [
  //   String choose2 = "",
  //   String choose3 = "",
  //   String choose4 = "",
  // ]) {
  //   List<String>? tempModel = [];

  //   for (var element in studentPanel.addtionalDetails!) {
  //     if (choose1 == element.branchType) {
  //       tempModel.add(element.branchName!);
  //     }
  //   }

  //   tempModel = tempModel.toSet().toList();
  //   return tempModel;
  // }

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
    // var res = await apiservices.upcomingEvents(
    //     Endpoints.baseUrl!, Endpoints.upcomingEvents!);

    // if (res != null) {
    //   upcomingEventlist = res;
    //   loadingUpcomingEvents = true.obs;
    //   update();
    // } else {}
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
