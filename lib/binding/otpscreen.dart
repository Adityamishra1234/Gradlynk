import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/otpscreencontroller.dart';

class OPTScreen implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPScreenController>(() => OTPScreenController());
  }
}
