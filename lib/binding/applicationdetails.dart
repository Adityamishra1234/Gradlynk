import 'package:get/get.dart';

class ApplicationDetail implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationDetail>(() => ApplicationDetail());
  }
}
