import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/finalshortlistcontroller.dart';

class FinalShortListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinalShortListController>(() => FinalShortListController());
  }
}
