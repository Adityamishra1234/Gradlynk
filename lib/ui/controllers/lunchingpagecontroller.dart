import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';

class LunchingPageController extends BaseController {
  void startTimer() {
    Future.delayed(const Duration(milliseconds: 5535), () {
      Get.toNamed(LoginCopy.routeNamed);
    });
  }
}
