import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';

class CompleteCourseDetailController extends GetxController with StateMixin {
  @override
  void onInit() async {
    change(null, status: RxStatus.loading());

    change(null, status: RxStatus.success());
    // TODO: implement onInit
    super.onInit();
  }

  //
  RxInt index = 0.obs;

  //Loading variable
  RxBool showAnimation = false.obs;
  RxBool firstTimeAnimation = false.obs;
  RxBool scroll = true.obs;
  RxBool moreChoosse = false.obs;

  // Model Create

  ApiServices apiservices = ApiServices();

  setIndex(int data) {
    index.value = data;
    update();
  }

  setScroll(bool data) {
    scroll.value = data;
    update();
  }

  setMore(bool data) {
    moreChoosse.value = data;
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
