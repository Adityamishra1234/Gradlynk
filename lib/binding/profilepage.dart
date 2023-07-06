import 'package:get/get.dart';

import 'package:studentpanel/ui/screen/Profile_Module/controller/profilepagecontroller.dart';

class ProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}
