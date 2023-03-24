import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

class OTPScreenController extends GetxController {
  RxInt count = 60.obs;
  RxBool loadingcounter = false.obs;
  RxBool loadingTimer = false.obs;

  // setCounter() {
  //   if (loadingTimer.value == false) {
  //     Timer.periodic(const Duration(seconds: 1), (timer) {
  //       count--;
  //       if (count.value == 0) {
  //         loadingcounter.value = true;
  //       } else if (count.value == -1) {
  //         loadingTimer.value = true;
  //       }
  //       update();
  //     });
  //   }
  // }
}
