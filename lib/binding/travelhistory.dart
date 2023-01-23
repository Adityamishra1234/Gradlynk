import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/travelhistory.dart';

class TravelHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelHistoryController>(() => TravelHistoryController());
  }
}
