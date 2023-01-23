import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/QualificationDetails.dart';
import 'package:studentpanel/ui/controllers/othertestdetails.dart';
import 'package:studentpanel/ui/controllers/passport.dart';

class QualificationDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QualificationDetailsController>(
        () => QualificationDetailsController());
  }
}
