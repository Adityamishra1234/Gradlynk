import 'package:get/get.dart';

import 'package:studentpanel/ui/screen/Profile_Module/controller/othertestdetails.dart';

class othertestdetails implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherTestDetailsController>(() => OtherTestDetailsController());
  }
}
