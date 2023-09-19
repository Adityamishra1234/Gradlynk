import 'package:get/get.dart';
import 'package:new_app_version_alert/new_app_version_alert.dart';

class VersionController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getUpdateNotitifcation();
  }

  getUpdateNotitifcation() {
    Future.delayed(const Duration(minutes: 1)).then((value) {
      NewVersionCheck.newVersionCheck(Get.context,
          "com.downtownengineers.gradlynk", "com.downtownengineers.gradlynk");
    });
  }
}
