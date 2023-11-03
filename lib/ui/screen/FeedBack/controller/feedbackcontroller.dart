import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/screen/FeedBack/models/feedbackmodels.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';

class feedBackController extends GetxController with StateMixin {
  ApiServices apiservice = ApiServices();
  List<dynamic> items = [];
  int numberOfStar = 0;
  List<bool> selectedValues = [];
  bool optUpdate = false;

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("Route");
    change(null, status: RxStatus.success());
    super.onInit();
  }

  getCheckBox(String number_of_star) async {
    change(null, status: RxStatus.loading());
    var res = await apiservice.getFeedbackCheckBox(number_of_star);
    if (res != null) {
      items = [];
      items = res;
      selectedValues = [];
      selectedValues = List.filled(items.length, false);
      change(null, status: RxStatus.success());
    }
  }

  UpdateFeedback(FeedBackModel model) async {
    change(null, status: RxStatus.loading());
    var res = await apiservice.updatedFeedBack(model);
    if (res != null) {
      if (res == true) {
        Get.toNamed(DashBoard.routeNamed);
      }
      change(null, status: RxStatus.success());
    }
  }
}
