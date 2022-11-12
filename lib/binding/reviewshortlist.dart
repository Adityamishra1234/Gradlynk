import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/reviewshortlistcontroller.dart';

class ReviewShortList implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewShortListController>(() => ReviewShortListController());
  }
}
