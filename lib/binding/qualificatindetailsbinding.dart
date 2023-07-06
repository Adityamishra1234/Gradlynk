import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/QualificationDetails.dart';


class QualificationDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QualificationDetailsController>(
        () => QualificationDetailsController());
  }
}
