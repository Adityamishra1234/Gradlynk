import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/trackapplicationcontroller.dart';

class TrackApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackApplicationController>(() => TrackApplicationController());
  }
}
