import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';

import 'package:get/get.dart';

class ProfilePageController extends BaseController with StateMixin<UserModel> {
  RxInt? chooseIndex = 0.obs;
  RxBool? englishTestDetail = true.obs;
  RxBool? showAnimation = false.obs;
  RxBool? firstTimeAnimation = false.obs;

  getEnglishTestDetail(RxBool data) {
    englishTestDetail = data;
    update();
  }

  getChooseIndex(RxInt data) {
    chooseIndex = data;
    update();
  }

  getShowAnimationTrue(RxBool showAnimation, RxBool firstTime) {
    showAnimation = showAnimation;
    firstTimeAnimation = firstTime;
    update();
  }

  getShowAnimation(RxBool data) {
    showAnimation = data;
    update();
  }
}
