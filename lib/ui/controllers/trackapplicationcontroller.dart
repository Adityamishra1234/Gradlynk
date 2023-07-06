import 'package:get/get.dart';

class TrackApplicationController extends GetxController {
  RxInt chooseIndex = 0.obs;

  setIndex(int data) {
    chooseIndex.value = data;
    update();
  }
}
