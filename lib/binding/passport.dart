import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/othertestdetails.dart';
import 'package:studentpanel/ui/controllers/passport.dart';

class PassportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassportController>(() => PassportController());
  }
}
