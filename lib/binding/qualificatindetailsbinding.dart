import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/QualificationDetails.dart';

import 'package:studentpanel/ui/screen/Profile_Module/controller/passport.dart';

class QualificationDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QualificationDetailsController>(
        () => QualificationDetailsController());
  }
}
