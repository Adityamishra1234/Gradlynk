import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/screen/FeedBack/models/feedbackmodels.dart';

class feedBackController extends GetxController with StateMixin {
  ApiServices apiservice = ApiServices();
  List<dynamic> items = [];
  int numberOfStar = 0;
  List<bool> selectedValues = [];
  bool optUpdate = false;

  @override
  void onInit() async {
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
      change(null, status: RxStatus.success());
    }
  }
}
