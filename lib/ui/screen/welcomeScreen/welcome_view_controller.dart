import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

class WelcomeViewController extends GetxController with StateMixin {
  @override
  void onInit() async {
    await check();
    change(null, status: RxStatus.success());
    // hideScreen();
  }

  // Future<void> hideScreen() async {
  //   if (GetPlatform.isIOS) {
  //     Future.delayed(const Duration(milliseconds: 2000), () {
  //       FlutterSplashScreen.hide();
  //     });
  //   } else {
  //     Future.delayed(const Duration(milliseconds: 5100), () {
  //       FlutterSplashScreen.hide();
  //     });
  //   }
  // }

  check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phonenumber = prefs.getString("phonenumber");
    if (phonenumber == null) {
      return;
    } else {
      Get.offNamed(DashBoard.routeNamed);
    }
  }
}
