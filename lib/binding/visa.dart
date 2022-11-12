import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/visa.dart';

class Visa implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisaDetailController>(() => VisaDetailController());
  }
}
