import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/QualificationDetails.dart';

import 'package:studentpanel/ui/screen/Profile_Module/controller/passport.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/relativeinformation.dart';

class RelativeInformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RelativeInformationController>(
        () => RelativeInformationController());
  }
}
