import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/travelhistory.dart';

class TravelHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelHistoryController>(() => TravelHistoryController());
  }
}
