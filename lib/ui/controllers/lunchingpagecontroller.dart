import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';

class LunchingPageController extends GetxController {
  void startTimer() {
    Future.delayed(const Duration(milliseconds: 5535), () {
      Get.toNamed(LoginCopy.routeNamed);
    });
  }
}
