import 'package:get/get.dart';
import 'package:new_app_version_alert/new_app_version_alert.dart';

class VersionController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUpdateNotitifcation();
  }

  getUpdateNotitifcation() {
    Future.delayed(const Duration(minutes: 3)).then((value) {
      NewVersionCheck.newVersionCheck(Get.context,
          "com.downtownengineers.gradlynk", "com.downtownengineers.gradlynk");
    });
  }
}
