import 'package:studentpanel/ui/controllers/completedetaildetailcontroller.dart';
import 'package:get/get.dart';

class CompleteCoursedetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteCourseDetailController>(
        () => CompleteCourseDetailController());
  }
}
