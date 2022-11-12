import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/detailcontroller.dart';

class Detail implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
