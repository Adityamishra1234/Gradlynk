import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/lunchingpagecontroller.dart';

class LunchingPage implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LunchingPageController>(() => LunchingPageController());
  }
}
