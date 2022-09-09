import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:get/get.dart';

class TextScreenController extends BaseController {
  RxBool temp = false.obs;

  void startTimer(String currentScreen) {
    const maxmin = 20;
    int min = maxmin;
    Timer? timer;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // ignore: unrelated_type_equality_checks
      if (temp == true) {
        timer.cancel();
      }
      debugPrint(currentScreen + min.toString());
      min--;
      if (min == 0) {
        exit(0);
      }
    });
  }
}
