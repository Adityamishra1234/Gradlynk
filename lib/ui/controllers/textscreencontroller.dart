import 'dart:async';
import 'dart:io';

import 'package:studentpanel/ui/controllers/basemixin.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/detailcontroller.dart';
import 'package:get/get.dart';

class TextScreenController extends BaseController {
  RxBool temp = false.obs;

  void startTimer(String currentScreen) {
    print(currentScreen);
    const maxmin = 20;
    int min = maxmin;
    Timer? timer;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (temp == true) {
        timer.cancel();
      }
      print(currentScreen + min.toString());
      min--;
      if (min == 0) {
        exit(0);
      }
    });
  }
}
