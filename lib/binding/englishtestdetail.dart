import 'package:studentpanel/ui/controllers/detailcontroller.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/englishtest.dart';

class EnglishDetailsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(EnglishTestController());
    Get.lazyPut<EnglishTestController>(() => EnglishTestController());
  }
}
