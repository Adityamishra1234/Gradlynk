import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

class CourseSearchFullDetailController extends BaseController {
  //
  RxInt index = 0.obs;

  //Loading variable
  RxBool? showAnimation = false.obs;
  RxBool? firstTimeAnimation = false.obs;

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
