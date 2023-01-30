import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/applicationdetail.dart';

class ApplicationDetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ApplicationDetail());
    Get.lazyPut<ApplicationDetail>(() => ApplicationDetail());
  }
}
