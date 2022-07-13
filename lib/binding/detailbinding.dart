import 'package:studentpanel/ui/controllers/detailcontroller.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
    // Get.lazyPut<DetailController>(() => DetailController());
  }
}
