import 'dart:async';
import 'dart:io';

import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/userHistory.dart';

class DetailController extends BaseController {
  ApiServices apiServices = ApiServices();

  List<UserHistory>? userHistoryList;
  RxBool isLoading = false.obs;
  RxBool temp = false.obs;


  void startTimer(String currentScreen) {
    const maxmin = 5220;
    int min = maxmin;
    Timer? timer;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (temp == true.obs) {
        timer.cancel();
      }
      if (kDebugMode) {
        debugPrint(currentScreen + min.toString());
      }
      min--;
      if (min == 0) {
        exit(0);
      }
    });
  }

  // getUserHistory() async {
  //   // userHistoryList = await apiServices.getUserHistory(
  //   //     Endpoints.baseUrl!, Endpoints.getUserHistory!);
  //   // if (userHistoryList != null) {
  //   //   isLoading.value = true;
  //   //   update();
  //   }

  //   return userHistoryList!;
  // }
}
