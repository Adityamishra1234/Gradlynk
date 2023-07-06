import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:get/get.dart';

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
