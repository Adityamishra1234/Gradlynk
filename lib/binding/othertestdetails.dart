import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/othertestdetails.dart';

class othertestdetails implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherTestDetailsController>(() => OtherTestDetailsController());
  }
}
