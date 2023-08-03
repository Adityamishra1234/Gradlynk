import 'package:get/get.dart';
import 'package:studentpanel/binding/serviceIniitial.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GetSignedInUserInfoRepoImp>(GetSignedInUserInfoRepoImp());
  }
}

// APP

