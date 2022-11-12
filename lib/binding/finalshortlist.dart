import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/finalshortlistcontroller.dart';

class FinalShortList implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinalShortListController>(() => FinalShortListController());
  }
}
