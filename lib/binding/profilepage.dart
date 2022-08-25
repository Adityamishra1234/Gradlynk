import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';

class ProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}
