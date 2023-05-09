import 'package:get/get.dart';

import 'package:studentpanel/ui/screen/Profile_Module/controller/passport.dart';

class PassportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassportController>(() => PassportController());
  }
}
