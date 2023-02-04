import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

class TrackApplicationController extends GetxController {
  RxInt chooseIndex = 0.obs;

  setIndex(int data) {
    chooseIndex.value = data;
    update();
  }
}
