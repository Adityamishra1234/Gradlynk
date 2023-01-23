import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/travelhistory.dart';
import 'package:studentpanel/ui/controllers/visaSummary.dart';
import 'package:studentpanel/ui/controllers/workhistory.dart';

class WorkHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkHistoryController>(() => WorkHistoryController());
  }
}
