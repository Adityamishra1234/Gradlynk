import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';

class CompleteCourseDetailController extends BaseController {
  //
  RxInt index = 0.obs;

  //Loading variable
  RxBool showAnimation = false.obs;
  RxBool firstTimeAnimation = false.obs;

  // Model Create

  ApiServices apiservices = ApiServices();

  void onInit() {
    super.onInit();
  }

  setIndex(int data) {
    index.value = data;
    update();
  }

  getShowAnimation(RxBool data) {
    showAnimation = data;
    update();
  }

  getShowAnimationTrue(RxBool showAnimation, RxBool firstTime) {
    showAnimation = showAnimation;
    firstTimeAnimation = firstTime;
    update();
  }
}
