import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(BaseController(), permanent: true);
    Get.lazyPut<BaseController>(fenix: true, () => BaseController());
  }
}
