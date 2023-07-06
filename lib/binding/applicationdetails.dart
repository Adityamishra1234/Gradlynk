import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/track_application/applicationdetail.dart';

class ApplicationDetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ApplicationDetail());
    Get.lazyPut<ApplicationDetail>(() => const ApplicationDetail());
  }
}
