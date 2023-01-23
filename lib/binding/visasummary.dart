import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/travelhistory.dart';
import 'package:studentpanel/ui/controllers/visaSummary.dart';

class VisaSummaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisaSummaryController>(() => VisaSummaryController());
  }
}
