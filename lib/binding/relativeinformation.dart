import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/QualificationDetails.dart';
import 'package:studentpanel/ui/controllers/othertestdetails.dart';
import 'package:studentpanel/ui/controllers/passport.dart';
import 'package:studentpanel/ui/controllers/relativeinformation.dart';

class RelativeInformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RelativeInformationController>(
        () => RelativeInformationController());
  }
}
