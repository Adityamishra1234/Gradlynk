import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/filtercontroller.dart';

class Filter implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterController>(() => FilterController());
  }
}
