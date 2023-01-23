import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/applicationsummarycontroller.dart';

class ApplicationSummaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationSummaryController>(
        () => ApplicationSummaryController());
  }
}
