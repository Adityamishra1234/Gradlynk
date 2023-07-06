import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/workhistory.dart';

class WorkHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkHistoryController>(() => WorkHistoryController());
  }
}
