import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/trackapplicationcontroller.dart';

class TrackApplication implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackApplicationController>(() => TrackApplicationController());
  }
}
