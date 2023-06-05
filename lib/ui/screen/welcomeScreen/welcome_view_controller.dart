import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/models/checkbox.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/welcomeScreen/welcome_view.dart';

class WelcomeViewController extends GetxController with StateMixin {
  @override
  void onInit() async {
    await check();
    change(null, status: RxStatus.success());
  }

  check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phonenumber = prefs.getString("phonenumber");
    print(phonenumber);

    if (phonenumber == null) {
      return;
    } else {
      Get.toNamed(DashBoard.routeNamed);
    }
  }
}
