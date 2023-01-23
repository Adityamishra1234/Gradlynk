import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/reviewshortlistcontroller.dart';

class ReviewShortListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewShortListController>(() => ReviewShortListController());
  }
}
