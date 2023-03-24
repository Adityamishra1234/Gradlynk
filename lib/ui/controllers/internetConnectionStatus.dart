import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/internet_connection.dart';

mixin InternetConnectionStatusController {
  // getConnectivity() {
  //   if (result == true) {
  //     print('YAY! Free cute dog pics!');
  //   } else {
  //     print('No internet :( Reason:');
  //     print(InternetConnectionChecker().lastTryResults);
  //   }
  //   subscription = Connectivity().onConnectivityChanged.listen(
  //     (ConnectivityResult result) async {
  //       isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //       if (!isDeviceConnected && isAlertSet == false) {
  //         isAlertSet = true;
  //         Get.to(const InternetConnectionStatusScreen());
  //       }
  //     },
  //   );
  // }
}
